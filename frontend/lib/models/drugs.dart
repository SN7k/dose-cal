// lib/models/drugs.dart

/// Frequency → doses per day
const Map<String, int> kDosesPerDay = {
  'qD': 1,
  'BID': 2,
  'TID': 3,
  'QID': 4,
  'q4h': 6,
  'q6h': 4,
  'q8h': 3,
  'q12h': 2,
};

/// Minimal pediatric drug database for demo. Extend as needed.
/// Units: mg/kg **per dose** unless noted. Always verify locally.
final Map<String, Map<String, dynamic>> drugDatabase = {
  'Paracetamol (Acetaminophen)': {
    'route': 'PO',
    // per DOSE mg/kg
    'minMgPerKgDose': 10.0,
    'maxMgPerKgDose': 15.0,
    // caps
    'maxSingleMg': 1000.0,
    'maxDailyMg': 4000.0,
    'commonConcentrations': [
      '120 mg/5 mL',
      '250 mg/5 mL',
    ],
    'tabletStrengths': ['500 mg', '650 mg'],
  },
  'Ibuprofen': {
    'route': 'PO',
    'minMgPerKgDose': 5.0,
    'maxMgPerKgDose': 10.0,
    'maxSingleMg': 400.0,
    'maxDailyMg': 1200.0,
    'commonConcentrations': ['100 mg/5 mL'],
    'tabletStrengths': ['200 mg', '400 mg'],
  },
  'Amoxicillin': {
    'route': 'PO',
    'minMgPerKgDose': 20.0,
    'maxMgPerKgDose': 40.0,
    'maxSingleMg': 1000.0,
    'maxDailyMg': 3000.0,
    'commonConcentrations': ['125 mg/5 mL', '250 mg/5 mL'],
    'tabletStrengths': ['250 mg', '500 mg'],
  },
};
