import 'package:flutter/material.dart';
import '../utils/formulas.dart';
import '../data/repository.dart';

class TpnCalculatorScreen extends StatefulWidget {
  const TpnCalculatorScreen({super.key});
  @override
  State<TpnCalculatorScreen> createState() => _TpnCalculatorScreenState();
}

class _TpnCalculatorScreenState extends State<TpnCalculatorScreen> {
  final _weight = TextEditingController();
  final _totalMl = TextEditingController(text: '1000');
  final _dexPct = TextEditingController(text: '10');
  final _aaGkg = TextEditingController(text: '2');
  final _lipidGkg = TextEditingController(text: '2');
  final _naKmeqKg = TextEditingController(text: '3'); // Na+K mEq/kg/day
  String _line = 'Peripheral';

  Map<String, dynamic>? _plan;

  @override
  void dispose() {
    _weight.dispose();
    _totalMl.dispose();
    _dexPct.dispose();
    _aaGkg.dispose();
    _lipidGkg.dispose();
    _naKmeqKg.dispose();
    super.dispose();
  }

  Widget _card(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFF161B29),
            borderRadius: BorderRadius.circular(16)),
        child: child,
      );

  void _calc() {
    final w = double.tryParse(_weight.text);
    final vol = double.tryParse(_totalMl.text);
    final dex = double.tryParse(_dexPct.text);
    final aa = double.tryParse(_aaGkg.text);
    final lip = double.tryParse(_lipidGkg.text);
    final naK = double.tryParse(_naKmeqKg.text);
    if ([w, vol, dex, aa, lip, naK].any((x) => x == null || x <= 0)) {
      setState(() => _plan = {'error': 'Enter all values'});
      return;
    }
    final p = computeTpnPlan(
      weightKg: w!,
      totalMlPerDay: vol!,
      dextrosePercent: dex!,
      aaGPerKgDay: aa!,
      lipidGPerKgDay: lip!,
      naPlusKMEqPerKgDay: naK!,
      lineTypePeripheral: _line == 'Peripheral',
    );
    setState(() => _plan = p);
  }

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final pat = repo.currentPatient;

    return Scaffold(
      appBar: AppBar(title: const Text('TPN / IV Planner')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (pat != null) _card(Text('Patient: ${pat.name} • ${pat.id}')),
          const SizedBox(height: 12),
          _card(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Targets',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: TextField(
                        controller: _weight,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'Weight (kg)'))),
                const SizedBox(width: 12),
                Expanded(
                    child: TextField(
                        controller: _totalMl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Total volume (mL/day)'))),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: TextField(
                        controller: _dexPct,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'Dextrose %'))),
                const SizedBox(width: 12),
                Expanded(
                    child: DropdownButtonFormField<String>(
                  initialValue: _line,
                  items: const ['Peripheral', 'Central']
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (v) => setState(() => _line = v ?? _line),
                  decoration: const InputDecoration(labelText: 'Line type'),
                )),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: TextField(
                        controller: _aaGkg,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'AA (g/kg/day)'))),
                const SizedBox(width: 12),
                Expanded(
                    child: TextField(
                        controller: _lipidGkg,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Lipids (g/kg/day)'))),
              ]),
              const SizedBox(height: 12),
              TextField(
                  controller: _naKmeqKg,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Na+K (mEq/kg/day)')),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _calc, child: const Text('Calculate')),
            ],
          )),
          const SizedBox(height: 12),
          if (_plan != null) _card(_PlanView(plan: _plan!)),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save to Patient'),
            onPressed: (_plan != null && repo.selectedPatientId != null)
                ? () {
                    repo.saveToCurrent(
                        module: 'TPN', summary: planToPrettyString(_plan!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Saved to patient timeline')),
                    );
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

class _PlanView extends StatelessWidget {
  final Map<String, dynamic> plan;
  const _PlanView({required this.plan});

  @override
  Widget build(BuildContext context) {
    final warn = plan['peripheralWarning'] == true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (plan['error'] != null)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: const Color(0xFF3B0B0B),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const Icon(Icons.error, color: Colors.white70),
                const SizedBox(width: 8),
                Expanded(child: Text('${plan['error']}')),
              ],
            ),
          ),
        if (plan['error'] == null && warn)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: const Color(0xFF3B0B0B),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: const [
                Icon(Icons.error, color: Colors.white70),
                SizedBox(width: 8),
                Expanded(
                    child: Text(
                        'Peripheral line warning: Osm > 900 mOsm/L; consider central line.')),
              ],
            ),
          ),
        const SizedBox(height: 12),
        _row('Volume',
            '${plan['totalMlPerDay'].toStringAsFixed(0)} mL/day  (${plan['mlPerHour'].toStringAsFixed(1)} mL/h)'),
        _row('Dextrose %', '${plan['dextrosePercent']} %'),
        const SizedBox(height: 8),
        const Text('Components', style: TextStyle(fontWeight: FontWeight.bold)),
        _row('AA',
            '${plan['aaGPerDay'].toStringAsFixed(1)} g → ${plan['aaVolMl'].toStringAsFixed(0)} mL (10%)'),
        _row('Lipids',
            '${plan['lipidGPerDay'].toStringAsFixed(1)} g → ${plan['lipidVolMl'].toStringAsFixed(0)} mL (20%)'),
        _row('Dextrose volume',
            '${plan['dextroseVolMl'].toStringAsFixed(0)} mL'),
        const SizedBox(height: 8),
        const Text('Calculated', style: TextStyle(fontWeight: FontWeight.bold)),
        _row('GIR', '${plan['girMgKgMin'].toStringAsFixed(2)} mg/kg/min'),
        _row('Osmolarity', '${plan['osmMOsmL'].toStringAsFixed(0)} mOsm/L'),
      ],
    );
  }

  Widget _row(String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(
                width: 160,
                child: Text(k, style: const TextStyle(color: Colors.white70))),
            Expanded(child: Text(v)),
          ],
        ),
      );
}
