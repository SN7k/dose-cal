import 'package:flutter/material.dart';
import '../utils/formulas.dart';
import '../data/repository.dart';

class FluidsCalculatorScreen extends StatefulWidget {
  const FluidsCalculatorScreen({super.key});
  @override
  State<FluidsCalculatorScreen> createState() => _FluidsCalculatorScreenState();
}

class _FluidsCalculatorScreenState extends State<FluidsCalculatorScreen> {
  final _weight = TextEditingController();
  final _dehydration = TextEditingController(); // %
  final _bolus = TextEditingController(); // mL already given
  bool _plan48h = false;

  Map<String, String>? _out;

  @override
  void dispose() {
    _weight.dispose();
    _dehydration.dispose();
    _bolus.dispose();
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
    final dehyd = double.tryParse(_dehydration.text) ?? 0;
    final bolus = double.tryParse(_bolus.text) ?? 0;
    if (w == null || w <= 0) {
      setState(() => _out = {'Error': 'Enter a valid weight'});
      return;
    }

    final maint24 = maintenanceFluidPer24h(w);
    final deficit = (dehyd.clamp(0, 15) / 100.0) * w * 1000.0;
    final total = maint24 + deficit - bolus;
    final hours = _plan48h ? 48.0 : 24.0;
    final mlPerHour = (total / hours).clamp(0, 9999);

    setState(() {
      _out = {
        'Hourly rate': '${mlPerHour.toStringAsFixed(1)} mL/h',
        'Maintenance (24h)': '${maint24.toStringAsFixed(0)} mL',
        'Deficit to replace': '${deficit.toStringAsFixed(0)} mL',
        'Prior bolus (subtract)': '${bolus.toStringAsFixed(0)} mL',
        'Plan duration': _plan48h ? '48 h' : '24 h',
        'Total plan volume':
            '${total.clamp(0, double.infinity).toStringAsFixed(0)} mL',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final p = repo.currentPatient;

    return Scaffold(
      appBar: AppBar(title: const Text('Maintenance Fluids')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (p != null)
            _card(Text(
                'Patient: ${p.name} • ${p.id}  ${p.weightKg != null ? "Wt ${p.weightKg} kg" : ""}')),
          const SizedBox(height: 12),
          _card(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Inputs',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextField(
                controller: _weight
                  ..text = _weight.text.isEmpty && p?.weightKg != null
                      ? '${p!.weightKg}'
                      : _weight.text,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _dehydration,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Dehydration (%)'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _bolus,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Prior boluses (mL)'),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                value: _plan48h,
                onChanged: (v) => setState(() => _plan48h = v),
                title: const Text('Plan over 48 hours (otherwise 24 h)'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _calc, child: const Text('Calculate')),
            ],
          )),
          const SizedBox(height: 12),
          if (_out != null)
            _card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _out!.entries
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 160,
                                child: Text(e.key,
                                    style: const TextStyle(
                                        color: Colors.white70))),
                            Expanded(child: Text(e.value)),
                          ],
                        ),
                      ))
                  .toList(),
            )),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save to Patient'),
            onPressed: (_out != null && repo.selectedPatientId != null)
                ? () {
                    repo.saveToCurrent(
                        module: 'Fluids',
                        summary: 'Rate ${_out!['Hourly rate']}, '
                            'Maint ${_out!['Maintenance (24h)']}, '
                            'Deficit ${_out!['Deficit to replace']} '
                            '(${_out!['Plan duration']})');
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
