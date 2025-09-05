import 'dart:convert';
import 'dart:math';
import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'local_db.dart';

String _generateUuid() {
  final random = Random();
  final bytes = List<int>.generate(16, (_) => random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40; // Version 4
  bytes[8] = (bytes[8] & 0x3f) | 0x80; // Variant bits
  
  String hex = bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}';
}

class DataRepository {
  static DataRepository? _instance;
  static LocalDatabase? _database;
  static const _storage = FlutterSecureStorage();

  static DataRepository get instance {
    _instance ??= DataRepository._internal();
    return _instance!;
  }

  DataRepository._internal();

  Future<LocalDatabase> get database async {
    _database ??= await LocalDatabase.getInstance();
    return _database!;
  }

  // User Management
  Future<User?> getCurrentUser() async {
    final db = await database;
    return await db.getCurrentUser();
  }

  Future<void> setCurrentUser(String userId) async {
    await _storage.write(key: 'current_user_id', value: userId);
  }

  Future<void> clearCurrentUser() async {
    await _storage.delete(key: 'current_user_id');
  }

  // Hospital Management
  Future<Hospital?> getUserHospital(String userId) async {
    final db = await database;
    return await db.getUserHospital(userId);
  }

  Future<List<User>> getHospitalDoctors(String hospitalId) async {
    final db = await database;
    return await (db.select(db.users)
          ..where((u) => u.hospitalId.equals(hospitalId)))
        .get();
  }

  // Patient Management
  Future<List<Patient>> getPatientsForCurrentUser() async {
    final user = await getCurrentUser();
    if (user == null) return [];

    final db = await database;
    return await db.getPatientsForUser(user.id);
  }

  Future<Patient?> getPatient(String patientId) async {
    final db = await database;
    return await (db.select(db.patients)
          ..where((p) => p.id.equals(patientId)))
        .getSingleOrNull();
  }

  Future<String> createPatient({
    required String initials,
    String? fullName,
    DateTime? dob,
    String? sex,
    double? weightKg,
    double? heightCm,
    String? allergies,
    String? mrn,
  }) async {
    final user = await getCurrentUser();
    if (user == null) throw Exception('No current user');

    final db = await database;
    final patientId = _generateUuid();

    final patient = PatientsCompanion.insert(
      id: patientId,
      hospitalId: user.hospitalId != null ? Value(user.hospitalId) : const Value.absent(),
      ownerUserId: user.hospitalId == null ? Value(user.id) : const Value.absent(),
      initials: Value(initials),
      fullName: Value(fullName),
      dob: Value(dob),
      sex: Value(sex),
      weightKg: Value(weightKg),
      heightCm: Value(heightCm),
      allergies: Value(allergies),
      mrn: Value(mrn),
      createdBy: Value(user.id),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await db.into(db.patients).insert(patient);

    // Queue for sync
    await db.queueForSync(
      endpoint: '/v1/patients',
      payloadJson: jsonEncode({
        'id': patientId,
        'initials': initials,
        'fullName': fullName,
        'dob': dob?.toIso8601String(),
        'sex': sex,
        'weightKg': weightKg,
        'heightCm': heightCm,
        'allergies': allergies,
        'mrn': mrn,
      }),
    );

    return patientId;
  }

  Future<void> updatePatient(String patientId, {
    String? initials,
    String? fullName,
    DateTime? dob,
    String? sex,
    double? weightKg,
    double? heightCm,
    String? allergies,
    String? mrn,
  }) async {
    final db = await database;
    
    await (db.update(db.patients)..where((p) => p.id.equals(patientId))).write(
      PatientsCompanion(
        initials: initials != null ? Value(initials) : const Value.absent(),
        fullName: fullName != null ? Value(fullName) : const Value.absent(),
        dob: dob != null ? Value(dob) : const Value.absent(),
        sex: sex != null ? Value(sex) : const Value.absent(),
        weightKg: weightKg != null ? Value(weightKg) : const Value.absent(),
        heightCm: heightCm != null ? Value(heightCm) : const Value.absent(),
        allergies: allergies != null ? Value(allergies) : const Value.absent(),
        mrn: mrn != null ? Value(mrn) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );

    // Queue for sync
    await db.queueForSync(
      endpoint: '/v1/patients/$patientId',
      payloadJson: jsonEncode({
        'initials': initials,
        'fullName': fullName,
        'dob': dob?.toIso8601String(),
        'sex': sex,
        'weightKg': weightKg,
        'heightCm': heightCm,
        'allergies': allergies,
        'mrn': mrn,
      }),
    );
  }

  // Case Sheet Management
  Future<CaseSheet?> getOrCreateCaseSheet(String patientId) async {
    final user = await getCurrentUser();
    if (user == null) throw Exception('No current user');

    final db = await database;
    
    // Try to get existing case sheet
    var caseSheet = await (db.select(db.caseSheets)
          ..where((c) => c.patientId.equals(patientId)))
        .getSingleOrNull();

    if (caseSheet == null) {
      // Create new case sheet
      final caseSheetId = _generateUuid();
      final companion = CaseSheetsCompanion.insert(
        id: caseSheetId,
        patientId: patientId,
        createdBy: Value(user.id),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await db.into(db.caseSheets).insert(companion);
      
      caseSheet = await (db.select(db.caseSheets)
            ..where((c) => c.id.equals(caseSheetId)))
          .getSingle();
    }

    return caseSheet;
  }

  Future<List<CaseUpdate>> getCaseUpdates(String caseId) async {
    final db = await database;
    return await (db.select(db.caseUpdates)
          ..where((cu) => cu.caseId.equals(caseId))
          ..orderBy([(cu) => OrderingTerm.desc(cu.createdAtUtc)]))
        .get();
  }

  Future<void> addCaseUpdate({
    required String caseId,
    required String details,
  }) async {
    final user = await getCurrentUser();
    if (user == null) throw Exception('No current user');

    final db = await database;
    await db.addCaseUpdate(
      caseId: caseId,
      doctorId: user.id,
      doctorName: user.name,
      details: details,
    );

    // Queue for sync
    await db.queueForSync(
      endpoint: '/v1/cases/$caseId/updates',
      payloadJson: jsonEncode({
        'details': details,
        'doctor_name': user.name,
      }),
    );
  }

  // Format case update for display
  String formatCaseUpdate(CaseUpdate update) {
    final db = _database;
    if (db == null) return '';
    return db.formatCaseUpdate(update);
  }

  // Settings Management
  Future<String?> getSetting(String key) async {
    final db = await database;
    final setting = await (db.select(db.appSettings)
          ..where((s) => s.key.equals(key)))
        .getSingleOrNull();
    return setting?.value;
  }

  Future<void> setSetting(String key, String value) async {
    final db = await database;
    await db.into(db.appSettings).insertOnConflictUpdate(
      AppSettingsCompanion.insert(
        key: key,
        value: value,
        updatedAt: DateTime.now(),
      ),
    );
  }

  // Workspace Management
  Future<bool> isUserInHospital() async {
    final user = await getCurrentUser();
    return user?.hospitalId != null;
  }

  Future<String?> getHospitalUID() async {
    final user = await getCurrentUser();
    if (user?.hospitalId == null) return null;

    final hospital = await getUserHospital(user!.id);
    return hospital?.uid;
  }

  // Authentication helpers
  Future<bool> isLoggedIn() async {
    final user = await getCurrentUser();
    return user != null;
  }

  Future<String?> getUserRole() async {
    final user = await getCurrentUser();
    return user?.role;
  }

  // Drug and Formulary Management (for offline calculations)
  Future<List<Drug>> getAllDrugs() async {
    final db = await database;
    return await db.select(db.drugs).get();
  }

  Future<Drug?> getDrug(String drugId) async {
    final db = await database;
    return await (db.select(db.drugs)
          ..where((d) => d.id.equals(drugId)))
        .getSingleOrNull();
  }

  Future<List<DrugConcentration>> getDrugConcentrations(String drugId) async {
    final db = await database;
    return await (db.select(db.drugConcentrations)
          ..where((dc) => dc.drugId.equals(drugId)))
        .get();
  }

  Future<List<DoseRule>> getDoseRules(String drugId) async {
    final db = await database;
    return await (db.select(db.doseRules)
          ..where((dr) => dr.drugId.equals(drugId)))
        .get();
  }

  // Sync Management
  Future<List<SyncQueueData>> getPendingSyncItems() async {
    final db = await database;
    return await (db.select(db.syncQueue)
          ..orderBy([(sq) => OrderingTerm.asc(sq.createdAt)]))
        .get();
  }

  Future<void> markSyncItemCompleted(String syncId) async {
    final db = await database;
    await (db.delete(db.syncQueue)..where((sq) => sq.id.equals(syncId))).go();
  }

  Future<void> incrementSyncAttempts(String syncId, String error) async {
    final db = await database;
    final item = await (db.select(db.syncQueue)
          ..where((sq) => sq.id.equals(syncId)))
        .getSingleOrNull();

    if (item != null) {
      await (db.update(db.syncQueue)..where((sq) => sq.id.equals(syncId))).write(
        SyncQueueCompanion(
          attempts: Value(item.attempts + 1),
          lastError: Value(error),
        ),
      );
    }
  }

  // Audit Logs
  Future<List<AuditLog>> getAuditLogs({int limit = 100}) async {
    final db = await database;
    return await (db.select(db.auditLogs)
          ..orderBy([(al) => OrderingTerm.desc(al.createdAtUtc)])
          ..limit(limit))
        .get();
  }
}
