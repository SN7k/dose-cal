import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../models/patient.dart';
import '../models/encounter.dart';

class DischargeSummaryScreen extends StatelessWidget {
  const DischargeSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final Patient? p = repo.currentPatient;
    final String? id = repo.selectedPatientId;
    final List<EncounterItem> items =
        id == null ? <EncounterItem>[] : repo.encountersFor(id);

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        title: const Text('Discharge Summary'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Patient',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              _kv('Name', p?.name ?? '—'),
              _kv('ID', p?.id ?? '—'),
              _kv('Guardian',
                  p?.parentName.isNotEmpty == true ? p!.parentName : '—'),
              _kv('Sex', p?.sex ?? '—'),
              _kv(
                  'Age',
                  p == null
                      ? '—'
                      : '${p.ageMonths ~/ 12} y ${p.ageMonths % 12} m'),
              _kv('Weight', p?.weightKg == null ? '—' : '${p!.weightKg} kg'),
              _kv('Height', p?.heightCm == null ? '—' : '${p!.heightCm} cm'),
              _kv(
                  'Allergies',
                  p == null || p.allergies.isEmpty
                      ? 'None'
                      : p.allergies.join(', ')),
              _kv('Ward/Bed', p?.wardBed ?? '—'),
              _kv('Admission reason', p?.admissionReason ?? '—'),
              _kv('Admitted at', p?.admissionTime.toString() ?? '—'),
            ],
          )),
          const SizedBox(height: 12),
          _card(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Treatments / Encounters',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              if (items.isEmpty)
                const Text('No encounters recorded.',
                    style: TextStyle(color: Colors.white70))
              else
                ...items.map((e) => ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.check_circle,
                          color: Colors.white70, size: 18),
                      title: Text('${e.module}: ${e.summary}', maxLines: 4),
                      subtitle: Text(e.ts.toString()),
                    )),
            ],
          )),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Note: implement PDF export
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('PDF export is a TODO here.')),
                    );
                  },
                  child: const Text('Export PDF'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Note: implement secure share
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Secure share is a TODO here.')),
                    );
                  },
                  child: const Text('Share securely'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _card(Widget child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B29),
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );

  static Widget _kv(String k, String v) => Padding(
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
