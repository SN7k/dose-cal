// lib/models/encounter.dart
class EncounterItem {
  final String patientId;
  final String module; // Dose | Fluids | Blood | Growth | TPN | Note
  final String summary;
  final DateTime ts;

  EncounterItem({
    required this.patientId,
    required this.module,
    required this.summary,
    DateTime? ts,
  }) : ts = ts ?? DateTime.now();
}
