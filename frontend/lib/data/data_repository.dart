import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:drift/drift.dart';
import 'local_db.dart';

class DataRepository {
  static DataRepository? _instance;
  LocalDatabase? _database;
  static const _storage = FlutterSecureStorage();

  static DataRepository get instance {
    _instance ??= DataRepository._internal();
    return _instance!;
  }

  DataRepository._internal();

  Future<LocalDatabase> get database async {
    if (_database != null) return _database!;
    _database = await LocalDatabase.getInstance();
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

  Future<List<User>> getAllUsers() async {
    final db = await database;
    return await db.select(db.users).get();
  }

  Future<User> insertUser(UsersCompanion user) async {
    final db = await database;
    final userId = await db.into(db.users).insert(user);
    return await (db.select(db.users)..where((u) => u.id.equals(userId.toString()))).getSingle();
  }

  Future<User> updateUser(String id, UsersCompanion user) async {
    final db = await database;
    await (db.update(db.users)..where((u) => u.id.equals(id))).write(user);
    return await (db.select(db.users)..where((u) => u.id.equals(id))).getSingle();
  }

  Future<void> deleteUser(String id) async {
    final db = await database;
    await (db.delete(db.users)..where((u) => u.id.equals(id))).go();
  }

  // Hospital Management
  Future<List<Hospital>> getAllHospitals() async {
    final db = await database;
    return await db.select(db.hospitals).get();
  }

  Future<Hospital?> getHospitalById(String id) async {
    final db = await database;
    return await (db.select(db.hospitals)..where((h) => h.id.equals(id))).getSingleOrNull();
  }

  Future<Hospital> insertHospital(HospitalsCompanion hospital) async {
    final db = await database;
    final hospitalId = await db.into(db.hospitals).insert(hospital);
    return await (db.select(db.hospitals)..where((h) => h.id.equals(hospitalId.toString()))).getSingle();
  }

  Future<Hospital> updateHospital(String id, HospitalsCompanion hospital) async {
    final db = await database;
    await (db.update(db.hospitals)..where((h) => h.id.equals(id))).write(hospital);
    return await (db.select(db.hospitals)..where((h) => h.id.equals(id))).getSingle();
  }

  Future<void> deleteHospital(String id) async {
    final db = await database;
    await (db.delete(db.hospitals)..where((h) => h.id.equals(id))).go();
  }

  // Patient Management
  Future<List<Patient>> getAllPatients() async {
    final db = await database;
    return await db.select(db.patients).get();
  }

  Future<Patient?> getPatientById(String id) async {
    final db = await database;
    return await (db.select(db.patients)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<List<Patient>> getPatientsByHospital(String hospitalId) async {
    final db = await database;
    return await (db.select(db.patients)..where((p) => p.hospitalId.equals(hospitalId))).get();
  }

  Future<List<Patient>> searchPatients(String query) async {
    final db = await database;
    final searchQuery = '%${query.toLowerCase()}%';
    
    return await (db.select(db.patients)
      ..where((p) => 
        p.fullName.lower().like(searchQuery) |
        p.initials.lower().like(searchQuery) |
        p.mrn.lower().like(searchQuery) |
        p.id.lower().like(searchQuery)
      )
      ..orderBy([(p) => OrderingTerm.desc(p.createdAt)])
    ).get();
  }

  Future<List<Patient>> searchPatientsForCurrentUser(String query) async {
    final user = await getCurrentUser();
    if (user?.hospitalId != null) {
      final db = await database;
      final searchQuery = '%${query.toLowerCase()}%';
      
      return await (db.select(db.patients)
        ..where((p) => 
          p.hospitalId.equals(user!.hospitalId!) &
          (p.fullName.lower().like(searchQuery) |
           p.initials.lower().like(searchQuery) |
           p.mrn.lower().like(searchQuery) |
           p.id.lower().like(searchQuery))
        )
        ..orderBy([(p) => OrderingTerm.desc(p.createdAt)])
      ).get();
    }
    return [];
  }

  Future<Patient> insertPatient(PatientsCompanion patient) async {
    final db = await database;
    final patientId = await db.into(db.patients).insert(patient);
    return await (db.select(db.patients)..where((p) => p.id.equals(patientId.toString()))).getSingle();
  }

  Future<Patient> updatePatient(String id, PatientsCompanion patient) async {
    final db = await database;
    await (db.update(db.patients)..where((p) => p.id.equals(id))).write(patient);
    return await (db.select(db.patients)..where((p) => p.id.equals(id))).getSingle();
  }

  Future<void> deletePatient(String id) async {
    final db = await database;
    await (db.delete(db.patients)..where((p) => p.id.equals(id))).go();
  }

  // Case Sheet Management
  Future<List<CaseSheet>> getAllCaseSheets() async {
    final db = await database;
    return await db.select(db.caseSheets).get();
  }

  Future<CaseSheet?> getCaseSheetById(String id) async {
    final db = await database;
    return await (db.select(db.caseSheets)..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  Future<List<CaseSheet>> getCaseSheetsByPatient(String patientId) async {
    final db = await database;
    return await (db.select(db.caseSheets)..where((c) => c.patientId.equals(patientId))).get();
  }

  Future<CaseSheet> insertCaseSheet(CaseSheetsCompanion caseSheet) async {
    final db = await database;
    final caseId = await db.into(db.caseSheets).insert(caseSheet);
    return await (db.select(db.caseSheets)..where((c) => c.id.equals(caseId.toString()))).getSingle();
  }

  Future<CaseSheet> updateCaseSheet(String id, CaseSheetsCompanion caseSheet) async {
    final db = await database;
    await (db.update(db.caseSheets)..where((c) => c.id.equals(id))).write(caseSheet);
    return await (db.select(db.caseSheets)..where((c) => c.id.equals(id))).getSingle();
  }

  Future<void> deleteCaseSheet(String id) async {
    final db = await database;
    await (db.delete(db.caseSheets)..where((c) => c.id.equals(id))).go();
  }

  // Settings Management
  Future<String?> getSetting(String key) async {
    final db = await database;
    final setting = await (db.select(db.appSettings)..where((s) => s.key.equals(key))).getSingleOrNull();
    return setting?.value;
  }

  Future<void> setSetting(String key, String value) async {
    final db = await database;
    await db.into(db.appSettings).insertOnConflictUpdate(
      AppSettingsCompanion(
        key: Value(key),
        value: Value(value),
      ),
    );
  }

  Future<void> deleteSetting(String key) async {
    final db = await database;
    await (db.delete(db.appSettings)..where((s) => s.key.equals(key))).go();
  }

  // Drug Management
  Future<List<Drug>> getAllDrugs() async {
    final db = await database;
    return await db.select(db.drugs).get();
  }

  Future<Drug?> getDrugById(String id) async {
    final db = await database;
    return await (db.select(db.drugs)..where((d) => d.id.equals(id))).getSingleOrNull();
  }

  Future<Drug> insertDrug(DrugsCompanion drug) async {
    final db = await database;
    final drugId = await db.into(db.drugs).insert(drug);
    return await (db.select(db.drugs)..where((d) => d.id.equals(drugId.toString()))).getSingle();
  }

  Future<Drug> updateDrug(String id, DrugsCompanion drug) async {
    final db = await database;
    await (db.update(db.drugs)..where((d) => d.id.equals(id))).write(drug);
    return await (db.select(db.drugs)..where((d) => d.id.equals(id))).getSingle();
  }

  Future<void> deleteDrug(String id) async {
    final db = await database;
    await (db.delete(db.drugs)..where((d) => d.id.equals(id))).go();
  }

  // Additional helper methods for app_providers compatibility
  Future<String?> getUserRole() async {
    final user = await getCurrentUser();
    return user?.role;
  }

  Future<bool> isUserInHospital() async {
    final user = await getCurrentUser();
    return user?.hospitalId != null;
  }

  Future<bool> isLoggedIn() async {
    final user = await getCurrentUser();
    return user != null;
  }

  Future<String?> getHospitalUID() async {
    final user = await getCurrentUser();
    if (user?.hospitalId != null) {
      final hospital = await getHospitalById(user!.hospitalId!);
      return hospital?.uid;
    }
    return null;
  }

  Future<List<Patient>> getPatientsForCurrentUser() async {
    final user = await getCurrentUser();
    if (user?.hospitalId != null) {
      return await getPatientsByHospital(user!.hospitalId!);
    }
    return [];
  }

  Future<Patient?> getPatient(String patientId) async {
    return await getPatientById(patientId);
  }

  Future<CaseSheet?> getOrCreateCaseSheet(String patientId) async {
    final db = await database;
    // Try to get existing case sheet
    final existing = await (db.select(db.caseSheets)..where((c) => c.patientId.equals(patientId))).getSingleOrNull();
    if (existing != null) {
      return existing;
    }
    
    // Create new case sheet if none exists
    final caseSheet = CaseSheetsCompanion(
      id: Value(_generateId()),
      patientId: Value(patientId),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
    
    return await insertCaseSheet(caseSheet);
  }

  Future<List<CaseUpdate>> getCaseUpdates(String caseId) async {
    final db = await database;
    return await (db.select(db.caseUpdates)..where((cu) => cu.caseId.equals(caseId))).get();
  }

  Future<Drug?> getDrug(String drugId) async {
    return await getDrugById(drugId);
  }

  Future<List<DrugConcentration>> getDrugConcentrations(String drugId) async {
    final db = await database;
    return await (db.select(db.drugConcentrations)..where((dc) => dc.drugId.equals(drugId))).get();
  }

  Future<List<DoseRule>> getDoseRules(String drugId) async {
    final db = await database;
    return await (db.select(db.doseRules)..where((dr) => dr.drugId.equals(drugId))).get();
  }

  Future<String> createPatient({
    required String initials,
    required String fullName,
    required DateTime dob,
    required String sex,
    required double weightKg,
    required double heightCm,
    required String allergies,
    required String mrn,
  }) async {
    final user = await getCurrentUser();
    final patientId = _generateId();
    
    final patient = PatientsCompanion(
      id: Value(patientId),
      initials: Value(initials),
      fullName: Value(fullName),
      dob: Value(dob),
      sex: Value(sex),
      weightKg: Value(weightKg),
      heightCm: Value(heightCm),
      allergies: Value(allergies),
      mrn: Value(mrn),
      hospitalId: Value(user?.hospitalId ?? ''),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
    );
    
    await insertPatient(patient);
    return patientId;
  }

  Future<void> addCaseUpdate(String caseId, String content, String type) async {
    final db = await database;
    final user = await getCurrentUser();
    
    final update = CaseUpdatesCompanion(
      id: Value(_generateId()),
      caseId: Value(caseId),
      doctorId: Value(user?.id ?? ''),
      doctorName: Value(user?.name ?? 'Unknown'),
      details: Value(content),
      createdAtUtc: Value(DateTime.now().toUtc()),
    );
    
    await db.into(db.caseUpdates).insert(update);
  }

  String formatCaseUpdate(CaseUpdate update) {
    return '${update.doctorName}: ${update.details}';
  }

  Future<List<SyncQueueData>> getPendingSyncItems() async {
    final db = await database;
    return await db.select(db.syncQueue).get();
  }

  Future<void> markSyncItemCompleted(String id) async {
    final db = await database;
    await (db.delete(db.syncQueue)..where((sq) => sq.id.equals(id))).go();
  }

  Future<void> incrementSyncAttempts(String id, String error) async {
    // In a real implementation, you might want to update attempt count
    // For now, we'll just log the error
    print('Sync failed for item $id: $error');
  }

  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}