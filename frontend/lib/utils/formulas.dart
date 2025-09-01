// lib/utils/formulas.dart
import 'dart:math';
import '../models/drugs.dart';

/// ---------- Generic helpers ----------
double _toDouble(num x) => x.toDouble();

double mgPerMlFromLabel(String label) {
  // "120 mg/5 mL" -> 24.0 mg/mL
  final l = label.toLowerCase().replaceAll(' ', '');
  final mgPart = RegExp(r'(\d+(\.\d+)?)mg').firstMatch(l);
  final mlPart = RegExp(r'/(\d+(\.\d+)?)ml').firstMatch(l);
  if (mgPart == null || mlPart == null) return 0;
  final mg = double.parse(mgPart.group(1)!);
  final ml = double.parse(mlPart.group(1)!);
  return mg / ml;
}

double mlFromMg({required double mg, required double mgPerMl}) =>
    mgPerMl <= 0 ? 0 : mg / mgPerMl;

Map<String, dynamic> tabletsFromMg({
  required double mg,
  required double tabletStrengthMg,
}) {
  if (tabletStrengthMg <= 0) {
    return {'count': 0.0, 'advice': '-'};
  }
  final tabs = mg / tabletStrengthMg;
  // Round to nearest 0.5 tablet
  final rounded = (tabs * 2).round() / 2.0;
  return {
    'count': tabs,
    'advice': '${rounded.toStringAsFixed(1)} tab(s)',
  };
}

/// ---------- Drug dose calculation with guardrails ----------
/// Works with the miniature `drugDatabase` above.
/// Returns: minDoseMg, maxDoseMg (per dose), daily totals, severity + summary.
Map<String, dynamic> computeDoseWithGuards({
  required String drug,
  required double weightKg,
  required int dosesPerDay,
}) {
  final d = drugDatabase[drug];
  if (d == null) {
    return {'error': 'Unknown drug'};
  }
  final minPerKg = _toDouble(d['minMgPerKgDose']);
  final maxPerKg = _toDouble(d['maxMgPerKgDose']);
  final maxSingle = _toDouble(d['maxSingleMg']);
  final maxDaily = _toDouble(d['maxDailyMg']);

  final minDose = minPerKg * weightKg;
  final maxDose = maxPerKg * weightKg;

  final minDoseCapped = min(minDose, maxSingle);
  final maxDoseCapped = min(maxDose, maxSingle);

  final dailyMin = minDoseCapped * dosesPerDay;
  final dailyMax = maxDoseCapped * dosesPerDay;

  String severity = 'ok';
  final messages = <String>[];

  if (maxDose > maxSingle) {
    severity = 'warning';
    messages.add(
        'Per-dose cap applied: max single ${maxSingle.toStringAsFixed(0)} mg.');
  }
  if (dailyMax > maxDaily) {
    severity = 'danger';
    messages.add(
        'Daily cap exceeded: ${dailyMax.toStringAsFixed(0)} mg > max ${maxDaily.toStringAsFixed(0)} mg.');
  }

  final summary = [
    '$drug ${minDoseCapped.toStringAsFixed(0)}–${maxDoseCapped.toStringAsFixed(0)} mg per dose',
    '(dosesPerDay×/day → ${dailyMin.toStringAsFixed(0)}–${dailyMax.toStringAsFixed(0)} mg/day)',
    if (messages.isNotEmpty) messages.join(' '),
  ].join(' ');

  return {
    'minDoseMg': minDoseCapped,
    'maxDoseMg': maxDoseCapped,
    'dailyMinMg': dailyMin,
    'dailyMaxMg': dailyMax,
    'severity': severity,
    'summary': summary,
  };
}

/// ---------- Fluids ----------
double maintenanceFluidPer24h(double weightKg) {
  // Holliday–Segar: 100/50/20 rule (mL/day)
  double total = 0;
  var w = weightKg;
  if (w <= 10) {
    total = 100 * w;
  } else if (w <= 20) {
    total = 100 * 10 + 50 * (w - 10);
  } else {
    total = 100 * 10 + 50 * 10 + 20 * (w - 20);
  }
  return total;
}

/// ---------- Blood ----------
double _ebvMlPerKg(String ageBand, String sex) {
  // Typical pediatric EBV mL/kg
  switch (ageBand) {
    case 'Preterm neonate':
      return 100;
    case 'Term neonate (<1 mo)':
      return 90;
    case 'Child (>3 mo)':
      return 80;
    case 'Adolescent':
      return (sex == 'Male') ? 75 : 70;
    default:
      return 80;
  }
}

double ebvMl(
    {required double weightKg, required String ageBand, required String sex}) {
  return _ebvMlPerKg(ageBand, sex) * weightKg;
}

double prbcVolumePreset({required double weightKg, required int mlPerKg}) {
  return weightKg * mlPerKg;
}

// Simple estimate using EBV and Hb delta (VERY rough, for demo display only)
double prbcVolumeForTarget({
  required double weightKg,
  required double hbNow,
  required double hbTarget,
}) {
  final ebv = 80 * weightKg; // mL
  final delta = max(0, hbTarget - hbNow);
  // 1 mL PRBC raises Hb ~0.01 g/dL per mL per dL EBV → crude factor:
  final factor = 4; // so 4 mL/kg raises ~1 g/dL (rule-of-thumb)
  return weightKg * factor * delta;
}

/// ---------- Growth / BMI ----------
double bmiFrom(double weightKg, double heightCm) {
  final m = heightCm / 100.0;
  if (m <= 0) return 0;
  return weightKg / (m * m);
}

// Rough categorical labels (not LMS z-scores; placeholder)
String roughBmiCategory(double bmi) {
  if (bmi < 5) return 'error';
  if (bmi < 14) return 'Underweight (approx.)';
  if (bmi < 18) return 'Healthy (approx.)';
  if (bmi < 21) return 'Overweight (approx.)';
  return 'Obese (approx.)';
}

/// ---------- TPN / IV ----------
Map<String, dynamic> computeTpnPlan({
  required double weightKg,
  required double totalMlPerDay,
  required double dextrosePercent,
  required double aaGPerKgDay,
  required double lipidGPerKgDay,
  required double naPlusKMEqPerKgDay,
  required bool lineTypePeripheral,
}) {
  // Component grams
  final aaGperDay = aaGPerKgDay * weightKg;
  final lipidGperDay = lipidGPerKgDay * weightKg;

  // Volumes (10% AA, 20% lipids)
  double volumeForGrams(
      {required double gramsNeeded, required double percentStrength}) {
    // e.g., 10% = 10 g per 100 mL → mL = grams * 100 / percent
    return gramsNeeded * 100 / percentStrength;
  }

  final aaVolMl = volumeForGrams(gramsNeeded: aaGperDay, percentStrength: 10);
  final lipidVolMl =
      volumeForGrams(gramsNeeded: lipidGperDay, percentStrength: 20);

  // Dextrose volume is what's left after AA+lipids (simplified)
  final dextroseVolMl = max(0, totalMlPerDay - aaVolMl - lipidVolMl);

  // GIR (mg/kg/min): %dextrose means g/100mL → mg/mL = % * 10
  // GIR = (dextrose mg/mL * mL/h) / (weight * 60)
  final mlPerHour = totalMlPerDay / 24.0;
  final dexMgPerMl = dextrosePercent * 10;
  final gir = (dexMgPerMl * mlPerHour) / (weightKg * 60.0);

  // Crude osmolarity estimate (mOsm/L) AA ~ 100, dextrose ~ 50 * % , lipids ~ isotonic
  final osm = (dextrosePercent * 50) + 100;

  final peripheralWarning = lineTypePeripheral && osm > 900;

  return {
    'totalMlPerDay': totalMlPerDay,
    'mlPerHour': mlPerHour,
    'dextrosePercent': dextrosePercent,
    'aaGPerDay': aaGperDay,
    'aaVolMl': aaVolMl,
    'lipidGPerDay': lipidGperDay,
    'lipidVolMl': lipidVolMl,
    'dextroseVolMl': dextroseVolMl,
    'girMgKgMin': gir,
    'osmMOsmL': osm,
    'peripheralWarning': peripheralWarning,
  };
}

String planToPrettyString(Map<String, dynamic> p) {
  return 'TPN: Vol ${p['totalMlPerDay'].toStringAsFixed(0)} mL/d '
      '(${p['mlPerHour'].toStringAsFixed(1)} mL/h), '
      'Dex ${p['dextrosePercent']}%, '
      'AA ${p['aaGPerDay'].toStringAsFixed(1)} g, '
      'Lipids ${p['lipidGPerDay'].toStringAsFixed(1)} g, '
      'GIR ${p['girMgKgMin'].toStringAsFixed(2)} mg/kg/min';
}
