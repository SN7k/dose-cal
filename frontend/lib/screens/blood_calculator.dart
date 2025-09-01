import 'package:flutter/material.dart';
import '../utils/formulas.dart';
import '../data/repository.dart';

class BloodCalculatorScreen extends StatefulWidget {
  const BloodCalculatorScreen({super.key});
  @override
  State<BloodCalculatorScreen> createState() => _BloodCalculatorScreenState();
}

class _BloodCalculatorScreenState extends State<BloodCalculatorScreen> {
  int _tab = 0; // 0 EBV, 1 PRBC

  // EBV
  final _weight = TextEditingController();
  String _ageBand = 'Child (>3 mo)';
  String _sex = 'Male';

  // PRBC
  final _hbNow = TextEditingController();
  final _hbTarget = TextEditingController();
  int? _preset; // 10, 15, 20 mL/kg
  String? _out;

  @override
  void dispose() {
    _weight.dispose();
    _hbNow.dispose();
    _hbTarget.dispose();
    super.dispose();
  }

  Widget _seg(String t, int idx) => Expanded(
        child: GestureDetector(
          onTap: () => setState(() => _tab = idx),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: _tab == idx
                  ? const Color(0xFF5B6BE1)
                  : const Color(0xFF161B29),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(idx == 0 ? 12 : 0),
                bottomLeft: Radius.circular(idx == 0 ? 12 : 0),
                topRight: Radius.circular(idx == 1 ? 12 : 0),
                bottomRight: Radius.circular(idx == 1 ? 12 : 0),
              ),
            ),
            child: Center(child: Text(t)),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final p = repo.currentPatient;

    return Scaffold(
      appBar: AppBar(title: const Text('Blood (EBV & PRBC)')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (p != null) Text('Patient: ${p.name} • ${p.id}'),
          const SizedBox(height: 12),
          Row(children: [
            _seg('EBV', 0),
            const SizedBox(width: 8),
            _seg('PRBC', 1),
          ]),
          const SizedBox(height: 12),
          if (_tab == 0) _ebvCard(context) else _prbcCard(context),
          if (_out != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0xFF161B29),
                  borderRadius: BorderRadius.circular(16)),
              child: Text(_out!),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save to Patient'),
              onPressed: (repo.selectedPatientId != null)
                  ? () {
                      repo.saveToCurrent(module: 'Blood', summary: _out!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Saved to patient timeline')),
                      );
                    }
                  : null,
            ),
          ],
        ],
      ),
    );
  }

  Widget _ebvCard(BuildContext context) {
    return _card(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estimated Blood Volume (EBV)',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        TextField(
            controller: _weight,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Weight (kg)')),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _ageBand,
          items: const [
            'Preterm neonate',
            'Term neonate (<1 mo)',
            'Child (>3 mo)',
            'Adolescent',
          ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (v) => setState(() => _ageBand = v ?? _ageBand),
          decoration: const InputDecoration(labelText: 'Age band'),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _sex,
          items: const ['Male', 'Female', 'Other']
              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
              .toList(),
          onChanged: (v) => setState(() => _sex = v ?? _sex),
          decoration: const InputDecoration(labelText: 'Sex'),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            final w = double.tryParse(_weight.text);
            if (w == null || w <= 0) {
              setState(() => _out = 'Enter a valid weight');
              return;
            }
            final ebv = ebvMl(weightKg: w, ageBand: _ageBand, sex: _sex);
            setState(() =>
                _out = 'EBV: ${ebv.toStringAsFixed(0)} mL ($_ageBand, $_sex)');
          },
          child: const Text('Calculate EBV'),
        ),
      ],
    ));
  }

  Widget _prbcCard(BuildContext context) {
    return _card(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Packed RBC Volume',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        TextField(
            controller: _weight,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Weight (kg)')),
        const SizedBox(height: 12),
        Row(children: [
          ChoiceChip(
              label: const Text('10 mL/kg'),
              selected: _preset == 10,
              onSelected: (_) => setState(() => _preset = 10)),
          const SizedBox(width: 8),
          ChoiceChip(
              label: const Text('15 mL/kg'),
              selected: _preset == 15,
              onSelected: (_) => setState(() => _preset = 15)),
          const SizedBox(width: 8),
          ChoiceChip(
              label: const Text('20 mL/kg'),
              selected: _preset == 20,
              onSelected: (_) => setState(() => _preset = 20)),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(
              child: TextField(
                  controller: _hbNow,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Hb now (g/dL)'))),
          const SizedBox(width: 12),
          Expanded(
              child: TextField(
                  controller: _hbTarget,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Target Hb (g/dL)'))),
        ]),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            final w = double.tryParse(_weight.text);
            if (w == null || w <= 0) {
              setState(() => _out = 'Enter a valid weight');
              return;
            }
            String result;
            if (_preset != null) {
              final v = prbcVolumePreset(weightKg: w, mlPerKg: _preset!);
              result =
                  'PRBC: ${v.toStringAsFixed(0)} mL (_preset mL/kg preset)';
            } else {
              final now = double.tryParse(_hbNow.text) ?? 0;
              final target = double.tryParse(_hbTarget.text) ?? now;
              final v = prbcVolumeForTarget(
                  weightKg: w, hbNow: now, hbTarget: target);
              result =
                  'PRBC: ${v.toStringAsFixed(0)} mL to raise Hb from ${now.toStringAsFixed(1)} → ${target.toStringAsFixed(1)} g/dL';
            }
            setState(() => _out = result);
          },
          child: const Text('Calculate PRBC'),
        ),
      ],
    ));
  }

  Widget _card(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFF161B29),
            borderRadius: BorderRadius.circular(16)),
        child: child,
      );
}
