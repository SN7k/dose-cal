import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          _card(const ListTile(
            leading: Icon(Icons.info_outline, color: Colors.white70),
            title: Text('Welcome to Dose-Cal'),
            subtitle:
                Text('Precision pediatric calculations with offline support.'),
          )),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _tile(context, Icons.medication, 'Dose', '/dose_calc'),
              _tile(context, Icons.water_drop, 'Fluids', '/fluids_calc'),
              _tile(context, Icons.bloodtype, 'Blood', '/blood_calc'),
              _tile(context, Icons.monitor_weight, 'Growth', '/growth_calc'),
              _tile(context, Icons.biotech, 'TPN/IV', '/tpn_calc'),
              _tile(context, Icons.people, 'Patients', '/patients'),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _card(Widget child) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF161B29),
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );

  static Widget _tile(
      BuildContext ctx, IconData icon, String title, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(ctx, route),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF161B29),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: const Color(0xFF5B6BE1)),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
