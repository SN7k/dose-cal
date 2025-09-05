import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data_repository.dart';
import '../data/local_db.dart';
import '../services/background_sync_service.dart';

// Repository provider
final dataRepositoryProvider = Provider<DataRepository>((ref) {
  return DataRepository.instance;
});

// Current user provider
final currentUserProvider = FutureProvider<User?>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getCurrentUser();
});

// User role provider
final userRoleProvider = FutureProvider<String?>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getUserRole();
});

// Hospital workspace check
final isInHospitalProvider = FutureProvider<bool>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.isUserInHospital();
});

// Authentication state
final isLoggedInProvider = FutureProvider<bool>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.isLoggedIn();
});

// Hospital UID provider
final hospitalUIDProvider = FutureProvider<String?>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getHospitalUID();
});

// Patients list provider
final patientsProvider = FutureProvider<List<Patient>>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getPatientsForCurrentUser();
});

// Individual patient provider
final patientProvider = FutureProvider.family<Patient?, String>((ref, patientId) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getPatient(patientId);
});

// Case sheet provider
final caseSheetProvider = FutureProvider.family<CaseSheet?, String>((ref, patientId) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getOrCreateCaseSheet(patientId);
});

// Case updates provider
final caseUpdatesProvider = FutureProvider.family<List<CaseUpdate>, String>((ref, caseId) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getCaseUpdates(caseId);
});

// Drugs provider for offline formulary
final drugsProvider = FutureProvider<List<Drug>>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getAllDrugs();
});

// Individual drug provider
final drugProvider = FutureProvider.family<Drug?, String>((ref, drugId) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getDrug(drugId);
});

// Drug concentrations provider
final drugConcentrationsProvider = FutureProvider.family<List<DrugConcentration>, String>((ref, drugId) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getDrugConcentrations(drugId);
});

// Dose rules provider
final doseRulesProvider = FutureProvider.family<List<DoseRule>, String>((ref, drugId) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getDoseRules(drugId);
});

// Sync queue provider
final syncQueueProvider = FutureProvider<List<SyncQueueData>>((ref) async {
  final repository = ref.read(dataRepositoryProvider);
  return await repository.getPendingSyncItems();
});

// Background sync service provider
final backgroundSyncServiceProvider = Provider<BackgroundSyncService>((ref) {
  return BackgroundSyncService();
});

// Sync status provider
final syncStatusProvider = StreamProvider<SyncStatus>((ref) {
  final syncService = ref.read(backgroundSyncServiceProvider);
  return syncService.syncStatusStream;
});

// Settings provider
class SettingsNotifier extends StateNotifier<Map<String, String?>> {
  final DataRepository _repository;
  
  SettingsNotifier(this._repository) : super({});

  Future<String?> getSetting(String key) async {
    if (state.containsKey(key)) {
      return state[key];
    }
    
    final value = await _repository.getSetting(key);
    state = {...state, key: value};
    return value;
  }

  Future<void> setSetting(String key, String value) async {
    await _repository.setSetting(key, value);
    state = {...state, key: value};
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, Map<String, String?>>((ref) {
  final repository = ref.read(dataRepositoryProvider);
  return SettingsNotifier(repository);
});

// Authentication actions
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final DataRepository _repository;
  final Ref _ref;
  
  AuthNotifier(this._repository, this._ref) : super(const AsyncValue.loading()) {
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    try {
      final user = await _repository.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> setCurrentUser(String userId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.setCurrentUser(userId);
      final user = await _repository.getCurrentUser();
      state = AsyncValue.data(user);
      // Invalidate related providers
      _ref.invalidate(isLoggedInProvider);
      _ref.invalidate(isInHospitalProvider);
      _ref.invalidate(hospitalUIDProvider);
      _ref.invalidate(patientsProvider);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await _repository.clearCurrentUser();
      state = const AsyncValue.data(null);
      // Invalidate all providers that depend on authentication
      _ref.invalidate(isLoggedInProvider);
      _ref.invalidate(isInHospitalProvider);
      _ref.invalidate(hospitalUIDProvider);
      _ref.invalidate(patientsProvider);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final repository = ref.read(dataRepositoryProvider);
  return AuthNotifier(repository, ref);
});

// Patient management actions
class PatientNotifier extends StateNotifier<AsyncValue<List<Patient>>> {
  final DataRepository _repository;
  final Ref _ref;
  
  PatientNotifier(this._repository, this._ref) : super(const AsyncValue.loading()) {
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    try {
      final patients = await _repository.getPatientsForCurrentUser();
      state = AsyncValue.data(patients);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<String?> createPatient({
    required String initials,
    String? fullName,
    DateTime? dob,
    String? sex,
    double? weightKg,
    double? heightCm,
    String? allergies,
    String? mrn,
  }) async {
    try {
      final patientId = await _repository.createPatient(
        initials: initials,
        fullName: fullName,
        dob: dob,
        sex: sex,
        weightKg: weightKg,
        heightCm: heightCm,
        allergies: allergies,
        mrn: mrn,
      );
      
      // Refresh patients list
      _loadPatients();
      
      return patientId;
    } catch (error) {
      // Handle error
      return null;
    }
  }

  Future<bool> updatePatient(String patientId, {
    String? initials,
    String? fullName,
    DateTime? dob,
    String? sex,
    double? weightKg,
    double? heightCm,
    String? allergies,
    String? mrn,
  }) async {
    try {
      await _repository.updatePatient(
        patientId,
        initials: initials,
        fullName: fullName,
        dob: dob,
        sex: sex,
        weightKg: weightKg,
        heightCm: heightCm,
        allergies: allergies,
        mrn: mrn,
      );
      
      // Refresh patients list and specific patient
      _loadPatients();
      _ref.invalidate(patientProvider(patientId));
      
      return true;
    } catch (error) {
      return false;
    }
  }
}

final patientNotifierProvider = StateNotifierProvider<PatientNotifier, AsyncValue<List<Patient>>>((ref) {
  final repository = ref.read(dataRepositoryProvider);
  return PatientNotifier(repository, ref);
});

// Case management actions
class CaseNotifier extends StateNotifier<AsyncValue<List<CaseUpdate>>> {
  final DataRepository _repository;
  final Ref _ref;
  final String caseId;
  
  CaseNotifier(this._repository, this._ref, this.caseId) : super(const AsyncValue.loading()) {
    _loadCaseUpdates();
  }

  Future<void> _loadCaseUpdates() async {
    try {
      final updates = await _repository.getCaseUpdates(caseId);
      state = AsyncValue.data(updates);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<bool> addUpdate(String details) async {
    try {
      await _repository.addCaseUpdate(
        caseId: caseId,
        details: details,
      );
      
      // Refresh case updates
      _loadCaseUpdates();
      
      return true;
    } catch (error) {
      return false;
    }
  }

  String formatUpdate(CaseUpdate update) {
    return _repository.formatCaseUpdate(update);
  }
}

final caseNotifierProvider = StateNotifierProvider.family<CaseNotifier, AsyncValue<List<CaseUpdate>>, String>((ref, caseId) {
  final repository = ref.read(dataRepositoryProvider);
  return CaseNotifier(repository, ref, caseId);
});
