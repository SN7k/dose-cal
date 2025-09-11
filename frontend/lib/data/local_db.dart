import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'local_db.g.dart';

// Hospital table
class Hospitals extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get code => text()();
  TextColumn get uid => text()(); // Public Hospital UID (e.g., H-XXXXXX)
  TextColumn get plan => text()();
  TextColumn get status => text()();
  TextColumn get ownerUserId => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Users table
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get role => text()(); // ADMIN, DOCTOR, SOLO_DOCTOR
  TextColumn get hospitalId => text().nullable()(); // nullable for SOLO doctors
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Subscriptions table
class Subscriptions extends Table {
  TextColumn get id => text()();
  TextColumn get subjectType => text()(); // HOSPITAL or USER
  TextColumn get subjectId => text()();
  TextColumn get planCode => text()();
  DateTimeColumn get periodStart => dateTime()();
  DateTimeColumn get periodEnd => dateTime()();
  TextColumn get status => text()(); // active, grace, expired
  IntColumn get seats => integer().nullable()(); // for hospital plans
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Patients table (updated)
class Patients extends Table {
  TextColumn get id => text()();
  TextColumn get hospitalId => text().nullable()(); // for hospital patients
  TextColumn get ownerUserId => text().nullable()(); // for solo doctor patients
  TextColumn get mrn => text().nullable()(); // Medical Record Number
  TextColumn get initials => text().nullable()();
  TextColumn get fullName => text().nullable()();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get sex => text().nullable()();
  RealColumn get weightKg => real().nullable()();
  RealColumn get heightCm => real().nullable()();
  TextColumn get allergies => text().nullable()();
  TextColumn get createdBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Case Sheets table
class CaseSheets extends Table {
  TextColumn get id => text()();
  TextColumn get patientId => text()();
  TextColumn get createdBy => text().nullable()();
  IntColumn get currentVersion => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Case Updates table (append-only)
class CaseUpdates extends Table {
  TextColumn get id => text()();
  TextColumn get caseId => text()();
  TextColumn get doctorId => text()();
  TextColumn get doctorName => text()(); // denormalized for display
  TextColumn get details => text()(); // case update details
  DateTimeColumn get createdAtUtc => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Audit Logs table
class AuditLogs extends Table {
  TextColumn get id => text()();
  TextColumn get actorId => text()();
  TextColumn get action => text()();
  TextColumn get entity => text()();
  TextColumn get entityId => text()();
  TextColumn get beforeJson => text().nullable()();
  TextColumn get afterJson => text().nullable()();
  DateTimeColumn get createdAtUtc => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Sync Queue table
class SyncQueue extends Table {
  TextColumn get id => text()();
  TextColumn get endpoint => text()();
  TextColumn get payloadJson => text()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Device States table
class DeviceStates extends Table {
  TextColumn get id => text()();
  TextColumn get deviceId => text()();
  DateTimeColumn get lastPullAt => dateTime().nullable()();
  DateTimeColumn get lastPushAt => dateTime().nullable()();
  TextColumn get checksum => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Settings table for app configuration
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {key};
}

// Drug formulary table (for offline dose calculations)
class Drugs extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get atcCode => text().nullable()();
  TextColumn get defaultRoute => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// Drug concentrations table
class DrugConcentrations extends Table {
  TextColumn get id => text()();
  TextColumn get drugId => text()();
  RealColumn get mgPerMl => real()();
  TextColumn get displayText => text()();
  TextColumn get route => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

// Dose rules table
class DoseRules extends Table {
  TextColumn get id => text()();
  TextColumn get drugId => text()();
  TextColumn get basis => text()(); // mg_per_kg_per_day, mg_per_kg_per_dose, etc.
  RealColumn get minPerKg => real().nullable()();
  RealColumn get maxPerKg => real().nullable()();
  RealColumn get maxPerDoseAbs => real().nullable()();
  RealColumn get maxPerDayAbs => real().nullable()();
  TextColumn get roundingRule => text().nullable()();
  IntColumn get ageMinMonths => integer().nullable()();
  IntColumn get ageMaxMonths => integer().nullable()();
  TextColumn get renalAdjJson => text().nullable()();
  TextColumn get hepaticAdjJson => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

// Drift Database
@DriftDatabase(tables: [
  Hospitals,
  Users,
  Subscriptions,
  Patients,
  CaseSheets,
  CaseUpdates,
  AuditLogs,
  SyncQueue,
  DeviceStates,
  AppSettings,
  Drugs,
  DrugConcentrations,
  DoseRules,
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase._internal(super.e);

  static LocalDatabase? _instance;
  static Future<LocalDatabase>? _initializeFuture;

  static Future<LocalDatabase> getInstance() async {
    // If instance already exists, return it
    if (_instance != null) return _instance!;
    
    // If initialization is already in progress, wait for it
    if (_initializeFuture != null) return await _initializeFuture!;
    
    // Start initialization
    _initializeFuture = _initialize();
    
    try {
      _instance = await _initializeFuture!;
      return _instance!;
    } finally {
      _initializeFuture = null;
    }
  }
  
  static Future<LocalDatabase> _initialize() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dosecal_encrypted.sqlite'));
    
    // Get or generate encryption key
    const storage = FlutterSecureStorage();
    String? key = await storage.read(key: 'db_key');
    if (key == null) {
      key = _generateRandomKey();
      await storage.write(key: 'db_key', value: key);
    }
    
    final executor = NativeDatabase(
      file,
      setup: (db) {
        db.execute("PRAGMA key = '$key';");
        db.execute("PRAGMA foreign_keys = ON;");
      },
    );
    
    return LocalDatabase._internal(executor);
  }

  @override
  int get schemaVersion => 1;

  // Helper methods for common operations
  
  // Get current user
  Future<User?> getCurrentUser() async {
    const storage = FlutterSecureStorage();
    final userId = await storage.read(key: 'current_user_id');
    if (userId == null) return null;
    
    return await (select(users)..where((u) => u.id.equals(userId))).getSingleOrNull();
  }

  // Get user's hospital
  Future<Hospital?> getUserHospital(String userId) async {
    final user = await (select(users)..where((u) => u.id.equals(userId))).getSingleOrNull();
    if (user?.hospitalId == null) return null;
    
    return await (select(hospitals)..where((h) => h.id.equals(user!.hospitalId!))).getSingleOrNull();
  }

  // Get patients for current user (scoped by hospital or solo)
  Future<List<Patient>> getPatientsForUser(String userId) async {
    final user = await (select(users)..where((u) => u.id.equals(userId))).getSingleOrNull();
    if (user == null) return [];

    if (user.hospitalId != null) {
      // Hospital doctor - get all hospital patients
      return await (select(patients)..where((p) => p.hospitalId.equals(user.hospitalId!))).get();
    } else {
      // Solo doctor - get only own patients
      return await (select(patients)..where((p) => p.ownerUserId.equals(userId))).get();
    }
  }

  // Add case update with formatted timestamp
  Future<void> addCaseUpdate({
    required String caseId,
    required String doctorId,
    required String doctorName,
    required String details,
  }) async {
    final update = CaseUpdatesCompanion.insert(
      id: _generateUuid(),
      caseId: caseId,
      doctorId: doctorId,
      doctorName: doctorName,
      details: details,
      createdAtUtc: DateTime.now().toUtc(),
    );
    
    await into(caseUpdates).insert(update);
    
    // Add audit log
    await _addAuditLog(
      actorId: doctorId,
      action: 'CASE_UPDATE_CREATED',
      entity: 'case_update',
      entityId: update.id.value,
      afterJson: '{"case_id": "$caseId", "details_length": ${details.length}}',
    );
  }

  // Format case update for display (DD MMM YYYY; HH:mm; Doctor Name; {...})
  String formatCaseUpdate(CaseUpdate update) {
    final date = _formatDate(update.createdAtUtc);
    final time = _formatTime(update.createdAtUtc);
    return '$date; $time; ${update.doctorName};\n{\n${update.details}\n}';
  }

  // Add audit log entry
  Future<void> _addAuditLog({
    required String actorId,
    required String action,
    required String entity,
    required String entityId,
    String? beforeJson,
    String? afterJson,
  }) async {
    await into(auditLogs).insert(AuditLogsCompanion.insert(
      id: _generateUuid(),
      actorId: actorId,
      action: action,
      entity: entity,
      entityId: entityId,
      beforeJson: Value(beforeJson),
      afterJson: Value(afterJson),
      createdAtUtc: DateTime.now().toUtc(),
    ));
  }

  // Queue item for sync
  Future<void> queueForSync({
    required String endpoint,
    required String payloadJson,
  }) async {
    await into(syncQueue).insert(SyncQueueCompanion.insert(
      id: _generateUuid(),
      endpoint: endpoint,
      payloadJson: payloadJson,
      createdAt: DateTime.now().toUtc(),
    ));
  }

  // Helper functions
  String _formatDate(DateTime dateTime) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${dateTime.day.toString().padLeft(2, '0')} ${months[dateTime.month - 1]} ${dateTime.year}';
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _generateUuid() {
    // Simple UUID-like generator for demo; use a proper UUID package in production
    return DateTime.now().millisecondsSinceEpoch.toString() + 
           (1000 + (DateTime.now().microsecond % 9000)).toString();
  }
}

String _generateRandomKey() {
  // Simple random key generator for demo; use a secure RNG in production
  return List.generate(32, (i) => (65 + (i * 7) % 26).toRadixString(16)).join();
}
