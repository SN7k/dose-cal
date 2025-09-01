import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../models/patient.dart';
import 'patient_detail_screen.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});
  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final List<Patient> results = repo.allPatients.where((p) {
      final s = ('${p.id} ${p.name}').toLowerCase();
      return s.contains(_q.toLowerCase());
    }).toList()
      ..sort((a, b) => b.admissionTime.compareTo(a.admissionTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by Patient ID or Name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) => setState(() => _q = v),
            ),
          ),
        ),
      ),
      body: results.isEmpty
          ? const _Empty()
          : ListView.separated(
              itemCount: results.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final p = results[i];
                final initials =
                    (p.name.isNotEmpty ? p.name[0] : p.id[0]).toUpperCase();
                final age = '${p.ageMonths ~/ 12}y ${p.ageMonths % 12}m';
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF161B29),
                    child: Text(initials),
                  ),
                  title: Text(p.name.isEmpty ? '(Unnamed)' : p.name),
                  subtitle: Text('${p.id} • ${p.sex} • $age'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Repo().selectPatient(p.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PatientDetailScreen(patientId: p.id),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF5B6BE1),
        icon: const Icon(Icons.add),
        label: const Text('Add patient'),
        onPressed: () => Navigator.pushNamed(context, '/add_patient'),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF161B29),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(Icons.people_outline,
                  size: 64, color: Colors.white54),
            ),
            const SizedBox(height: 16),
            const Text('No patients yet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const Text('Tap the + button to add your first patient.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
