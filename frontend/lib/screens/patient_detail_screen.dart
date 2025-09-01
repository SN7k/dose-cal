import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../models/patient.dart';
import '../models/encounter.dart';

class PatientDetailScreen extends StatefulWidget {
  final String patientId;
  const PatientDetailScreen({super.key, required this.patientId});

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 6, vsync: this);
    Repo().selectPatient(widget.patientId);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Patient? p = Repo().currentPatient;

    return Scaffold(
      appBar: AppBar(
        title: Text(p == null ? 'Patient' : '${p.name} (${p.id})'),
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          indicatorColor: const Color(0xFF5B6BE1),
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Dosing'),
            Tab(text: 'Fluids'),
            Tab(text: 'TPN/IV'),
            Tab(text: 'Timeline'),
            Tab(text: 'Discharge'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: const [
          _OverviewTab(),
          _OpenTool(route: '/dose_calc'),
          _OpenTool(route: '/fluids_calc'),
          _OpenTool(route: '/tpn_calc'),
          _TimelineTab(),
          _DischargeTab(),
        ],
      ),
    );
  }
}

class _OpenTool extends StatelessWidget {
  final String route;
  const _OpenTool({required this.route});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: const Text('Open tool'),
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab();

  @override
  Widget build(BuildContext context) {
    final p = Repo().currentPatient;
    if (p == null) return const Center(child: Text('No patient found.'));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _card([
          _kv('Name', p.name),
          _kv('ID', p.id),
          _kv('Guardian', p.parentName),
          _kv('Sex', p.sex),
          _kv('Age', '${p.ageMonths ~/ 12} y ${p.ageMonths % 12} m'),
          _kv('Weight', p.weightKg == null ? '–' : '${p.weightKg} kg'),
          _kv('Height', p.heightCm == null ? '–' : '${p.heightCm} cm'),
        ]),
        const SizedBox(height: 12),
        _card([
          _kv('Allergies',
              p.allergies.isEmpty ? 'None' : p.allergies.join(', ')),
          _kv('Ward/Bed', p.wardBed ?? '—'),
          _kv('Admission reason', p.admissionReason ?? '—'),
          _kv('Admitted', p.admissionTime.toString()),
        ]),
        const SizedBox(height: 12),
        const Text('Quick actions',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/dose_calc'),
              child: const Text('Dose'),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/fluids_calc'),
              child: const Text('Fluids'),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/tpn_calc'),
              child: const Text('TPN/IV'),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _card(List<Widget> children) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B29),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(children: children),
      );

  static Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(
                width: 150,
                child: Text(k, style: const TextStyle(color: Colors.white70))),
            Expanded(child: Text(v)),
          ],
        ),
      );
}

class _TimelineTab extends StatelessWidget {
  const _TimelineTab();

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final id = repo.selectedPatientId;
    final List<EncounterItem> items = id == null
        ? <EncounterItem>[]
        : repo.encountersFor(id).reversed.toList();

    if (items.isEmpty) {
      return const Center(child: Text('No encounters yet.'));
    }

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, i) {
        final e = items[i];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF161B29),
            child: _iconFor(e.module),
          ),
          title: Text('${e.module}: ${e.summary}',
              maxLines: 3, overflow: TextOverflow.ellipsis),
          subtitle: Text(e.ts.toString()),
        );
      },
    );
  }

  Widget _iconFor(String m) {
    final icon = {
          'Dose': Icons.medication,
          'Fluids': Icons.water_drop,
          'TPN': Icons.biotech,
          'Blood': Icons.bloodtype,
          'Growth': Icons.monitor_weight,
        }[m] ??
        Icons.note;
    return Icon(icon, size: 18);
  }
}

class _DischargeTab extends StatelessWidget {
  const _DischargeTab();

  @override
  Widget build(BuildContext context) {
    // Re-use the dedicated screen UI as an embedded view
    final repo = Repo();
    final p = repo.currentPatient;
    final id = repo.selectedPatientId;
    final items = id == null ? <EncounterItem>[] : repo.encountersFor(id);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF161B29),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Discharge Summary',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              Text('Patient: ${p?.name ?? '-'} (${p?.id ?? '-'})'),
              Text(
                  'Admitted: ${p?.admissionTime ?? '-'} | Ward: ${p?.wardBed ?? '-'}'),
              const Divider(),
              Text(
                  'Weight: ${p?.weightKg ?? '-'} kg, Height: ${p?.heightCm ?? '-'} cm'),
              const SizedBox(height: 8),
              const Text('Treatments / Plans'),
              const SizedBox(height: 6),
              ...items.map((e) => ListTile(
                    dense: true,
                    leading: const Icon(Icons.check_circle,
                        color: Colors.white70, size: 18),
                    title: Text('${e.module}: ${e.summary}', maxLines: 3),
                    subtitle: Text(e.ts.toString()),
                  )),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text('Export PDF'))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Share'))),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
