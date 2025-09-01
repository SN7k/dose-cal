import 'package:flutter/material.dart';
import '../utils/formulas.dart';
import '../data/repository.dart';

class GrowthCalculatorScreen extends StatefulWidget {
  const GrowthCalculatorScreen({super.key});
  @override
  State<GrowthCalculatorScreen> createState() => _GrowthCalculatorScreenState();
}

class _GrowthCalculatorScreenState extends State<GrowthCalculatorScreen> {
  final _ageMonths = TextEditingController();
  final _height = TextEditingController();
  final _weight = TextEditingController();
  String _sex = 'Male';
  double? _bmi;
  String? _cat;

  @override
  void dispose() {
    _ageMonths.dispose();
    _height.dispose();
    _weight.dispose();
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
    final h = double.tryParse(_height.text);
    final w = double.tryParse(_weight.text);
    if (h == null || h <= 0 || w == null || w <= 0) {
      setState(() => _bmi = null);
      return;
    }
    final b = bmiFrom(w, h);
    setState(() {
      _bmi = b;
      _cat = roughBmiCategory(b);
    });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final p = repo.currentPatient;

    return Scaffold(
      appBar: AppBar(title: const Text('Growth / BMI')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (p != null) _card(Text('Patient: ${p.name} • ${p.id}')),
          const SizedBox(height: 12),
          _card(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Inputs',
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
              TextField(
                controller: _ageMonths,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age (months)'),
              ),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: TextField(
                  controller: _height,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Height (cm)'),
                )),
                const SizedBox(width: 12),
                Expanded(
                    child: TextField(
                  controller: _weight
                    ..text = _weight.text.isEmpty && p?.weightKg != null
                        ? '${p!.weightKg}'
                        : _weight.text,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Weight (kg)'),
                )),
              ]),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _calc, child: const Text('Calculate')),
            ],
          )),
          const SizedBox(height: 12),
          if (_bmi != null)
            _card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('BMI: ${_bmi!.toStringAsFixed(1)}'),
                const SizedBox(height: 6),
                Text('Category: ${_cat ?? '-'}',
                    style: const TextStyle(color: Colors.white70)),
              ],
            )),
        ],
      ),
    );
  }
}
