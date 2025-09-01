// lib/models/patient.dart
class Patient {
  final String id;
  final String name;
  final String parentName;
  final String sex; // 'Male' | 'Female' | 'Other'
  final int ageMonths; // store age in months for simplicity
  final double? weightKg;
  final double? heightCm;
  final List<String> allergies;
  final String? wardBed;
  final String? admissionReason;
  final DateTime admissionTime;

  Patient({
    required this.id,
    this.name = '',
    this.parentName = '',
    this.sex = 'Male',
    this.ageMonths = 0,
    this.weightKg,
    this.heightCm,
    this.allergies = const [],
    this.wardBed,
    this.admissionReason,
    DateTime? admissionTime,
  }) : admissionTime = admissionTime ?? DateTime.now();

  Patient copyWith({
    String? id,
    String? name,
    String? parentName,
    String? sex,
    int? ageMonths,
    double? weightKg,
    double? heightCm,
    List<String>? allergies,
    String? wardBed,
    String? admissionReason,
    DateTime? admissionTime,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      parentName: parentName ?? this.parentName,
      sex: sex ?? this.sex,
      ageMonths: ageMonths ?? this.ageMonths,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
      allergies: allergies ?? this.allergies,
      wardBed: wardBed ?? this.wardBed,
      admissionReason: admissionReason ?? this.admissionReason,
      admissionTime: admissionTime ?? this.admissionTime,
    );
  }
}
