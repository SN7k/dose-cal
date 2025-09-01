// lib/data/repository.dart
import '../models/patient.dart';
import '../models/encounter.dart';

/// Simple in-memory repository (you can swap to Hive/Isar later).
class Repo {
  // Singleton
  static final Repo _i = Repo._internal();
  factory Repo() => _i;
  Repo._internal();

  // State
  final Map<String, Patient> _patients = {};
  final Map<String, List<EncounterItem>> _encounters = {};
  String? _selectedPatientId;

  // Getters
  List<Patient> get allPatients => _patients.values.toList();
  String? get selectedPatientId => _selectedPatientId;
  Patient? get currentPatient =>
      _selectedPatientId == null ? null : _patients[_selectedPatientId];

  // Actions
  void addPatient(Patient p) {
    _patients[p.id] = p;
    _encounters.putIfAbsent(p.id, () => []);
    _selectedPatientId = p.id;
  }

  void selectPatient(String id) {
    if (_patients.containsKey(id)) _selectedPatientId = id;
  }

  void addEncounter(EncounterItem e) {
    _encounters.putIfAbsent(e.patientId, () => []);
    _encounters[e.patientId]!.add(e);
  }

  void saveToCurrent({required String module, required String summary}) {
    if (_selectedPatientId == null) return;
    addEncounter(EncounterItem(
      patientId: _selectedPatientId!,
      module: module,
      summary: summary,
    ));
  }

  List<EncounterItem> encountersFor(String patientId) =>
      _encounters[patientId] ?? [];

  // Optional: clear all (for testing)
  void clear() {
    _patients.clear();
    _encounters.clear();
    _selectedPatientId = null;
  }
}
