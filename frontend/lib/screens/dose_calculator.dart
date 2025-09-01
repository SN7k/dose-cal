import 'package:flutter/material.dart';
import '../utils/formulas.dart';
import '../data/repository.dart';
import '../models/drugs.dart';

class DoseCalculatorScreen extends StatefulWidget {
  const DoseCalculatorScreen({super.key});
  @override
  State<DoseCalculatorScreen> createState() => _DoseCalculatorScreenState();
}

class _DoseCalculatorScreenState extends State<DoseCalculatorScreen> {
  final _weight = TextEditingController();
  String? _drug = drugDatabase.keys.first;
  String _freq = 'q6h';
  String? _concLabel; // "120 mg/5 mL"
  String? _tabletStrength; // "250 mg"
  Map<String, dynamic>? _res;

  @override
  void dispose() {
    _weight.dispose();
    super.dispose();
  }

  Widget _card(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B29),
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );

  void _calculate() {
    final w = double.tryParse(_weight.text);
    if (_drug == null || w == null || w <= 0) {
      setState(() => _res = {'error': 'Enter a valid weight.'});
      return;
    }
    final dosesPerDay = kDosesPerDay[_freq] ?? 4;

    final calc = computeDoseWithGuards(
      drug: _drug!,
      weightKg: w,
      dosesPerDay: dosesPerDay,
    );

    double? mgPerMl;
    if (_concLabel != null && _concLabel!.isNotEmpty) {
      mgPerMl = mgPerMlFromLabel(_concLabel!);
    }

    Map<String, dynamic>? tabInfo;
    if (_tabletStrength != null && _tabletStrength!.isNotEmpty) {
      final mg = double.tryParse(
        _tabletStrength!.toLowerCase().replaceAll('mg', '').trim(),
      );
      if (mg != null && mg > 0) {
        tabInfo = {
          'min': tabletsFromMg(mg: calc['minDoseMg'], tabletStrengthMg: mg),
          'max': tabletsFromMg(mg: calc['maxDoseMg'], tabletStrengthMg: mg),
        };
      }
    }

    setState(() => _res = {
          ...calc,
          if (mgPerMl != null)
            'ml': {
              'min': mlFromMg(mg: calc['minDoseMg'], mgPerMl: mgPerMl),
              'max': mlFromMg(mg: calc['maxDoseMg'], mgPerMl: mgPerMl),
            },
          if (tabInfo != null) 'tabs': tabInfo,
        });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final p = repo.currentPatient;

    final drugList = drugDatabase.keys.toList();
    final concs = (_drug != null)
        ? (drugDatabase[_drug!]?['commonConcentrations'] as List?)
                ?.cast<String>() ??
            <String>[]
        : <String>[];
    final tabs = (_drug != null)
        ? (drugDatabase[_drug!]?['tabletStrengths'] as List?)?.cast<String>() ??
            <String>[]
        : <String>[];

    return Scaffold(
      appBar: AppBar(title: const Text('Drug Dose Calculator')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (p != null)
            _card(Row(
              children: [
                const Icon(Icons.person, size: 18, color: Colors.white70),
                const SizedBox(width: 8),
                Expanded(child: Text('${p.name} • ${p.id}')),
                if (p.weightKg != null)
                  Text('Wt: ${p.weightKg} kg',
                      style: const TextStyle(color: Colors.white70)),
              ],
            )),
          const SizedBox(height: 12),
          _card(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Inputs',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _drug,
                items: drugList
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (v) => setState(() {
                  _drug = v;
                  _concLabel = null;
                  _tabletStrength = null;
                }),
                decoration: const InputDecoration(labelText: 'Drug'),
              ),
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
              DropdownButtonFormField<String>(
                initialValue: _freq,
                items: kDosesPerDay.keys
                    .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                    .toList(),
                onChanged: (v) => setState(() => _freq = v ?? 'q6h'),
                decoration: const InputDecoration(labelText: 'Frequency'),
              ),
              const SizedBox(height: 12),
              if (concs.isNotEmpty)
                DropdownButtonFormField<String>(
                  initialValue: _concLabel,
                  items: concs
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setState(() => _concLabel = v),
                  decoration: const InputDecoration(
                      labelText: 'Liquid concentration (optional)'),
                ),
              const SizedBox(height: 12),
              if (tabs.isNotEmpty)
                DropdownButtonFormField<String>(
                  initialValue: _tabletStrength,
                  items: tabs
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setState(() => _tabletStrength = v),
                  decoration: const InputDecoration(
                      labelText: 'Tablet strength (optional)'),
                ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: _calculate, child: const Text('Calculate')),
            ],
          )),
          const SizedBox(height: 12),
          if (_res != null) _card(_ResultView(res: _res!)),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save to Patient'),
            onPressed: (repo.selectedPatientId != null && _res != null)
                ? () {
                    repo.saveToCurrent(
                        module: 'Dose',
                        summary: _res!['summary'] ?? 'Dose saved');
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

class _ResultView extends StatelessWidget {
  final Map<String, dynamic> res;
  const _ResultView({required this.res});

  @override
  Widget build(BuildContext context) {
    final min = res['minDoseMg'] as double?;
    final max = res['maxDoseMg'] as double?;
    final dailyMin = res['dailyMinMg'] as double?;
    final dailyMax = res['dailyMaxMg'] as double?;
    final ml = res['ml'] as Map<String, dynamic>?;
    final tabs = res['tabs'] as Map<String, dynamic>?;
    final severity = res['severity'];

    Color? bg;
    IconData icon = Icons.check_circle;
    if (severity == 'warning') {
      bg = const Color(0xFF3B2F0B);
      icon = Icons.warning;
    }
    if (severity == 'danger') {
      bg = const Color(0xFF3B0B0B);
      icon = Icons.error;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (bg != null)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: bg, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Icon(icon, color: Colors.white70),
                const SizedBox(width: 8),
                Expanded(child: Text(res['summary'] ?? '', maxLines: 6)),
              ],
            ),
          ),
        if (bg == null) Text(res['summary'] ?? ''),
        const SizedBox(height: 12),
        if (min != null && max != null)
          Row(
            children: [
              _pill('Per dose',
                  '${min.toStringAsFixed(1)}–${max.toStringAsFixed(1)} mg'),
              const SizedBox(width: 8),
              if (ml != null) _pill('mL', '${ml['min']}–${ml['max']} mL'),
            ],
          ),
        const SizedBox(height: 8),
        if (dailyMin != null && dailyMax != null)
          _pill('Daily total',
              '${dailyMin.toStringAsFixed(1)}–${dailyMax.toStringAsFixed(1)} mg/day'),
        const SizedBox(height: 8),
        if (tabs != null)
          _pill('Tablets',
              '${(tabs['min'] as Map)['advice']} to ${(tabs['max'] as Map)['advice']}'),
      ],
    );
  }

  Widget _pill(String k, String v) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Text('$k: ', style: const TextStyle(color: Colors.white70)),
          Text(v),
        ]),
      );
}
