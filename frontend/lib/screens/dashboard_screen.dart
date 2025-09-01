import 'package:flutter/material.dart';
import '../data/repository.dart';
import 'auth/data/auth_service.dart';
import 'dose_calculator.dart';
import 'fluids_calculator.dart';
import 'blood_calculator.dart';
import 'growth_calculator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final List<Widget> _tabs = const [
    DoseCalculatorScreen(),
    FluidsCalculatorScreen(),
    SizedBox.shrink(), // middle notch for FAB
    BloodCalculatorScreen(),
    GrowthCalculatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final p = repo.currentPatient;

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        title: Text(p == null ? 'Dose-Cal' : '${p.name} • ${p.id}'),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF0B1220),
        child: ListView(
          children: [
            FutureBuilder<Map<String, String?>>(
              future: AuthService.getCurrentUser(),
              builder: (context, snapshot) {
                final user = snapshot.data ?? {};
                final name = user['name'] ?? 'Medical Professional';
                final role = user['role'] ?? 'doctor';
                final email = user['email'] ?? 'No email';
                
                return UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5B6BE1), Color(0xFF38BDF8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  accountName: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(
                    '${role.toUpperCase()} • $email',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : 'D',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            _item(context, Icons.people, 'Patient List', '/patients'),
            _item(context, Icons.description, 'Discharge Summaries',
                '/discharge'),
            const Divider(height: 1),
            _item(context, Icons.person, 'Profile', '/profile'),
            _item(context, Icons.settings, 'Settings', '/settings'),
            _item(context, Icons.info, 'App Info', '/appinfo'),
            _item(
                context, Icons.support_agent, 'Support / Contact', '/support'),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () => _showSignOutDialog(context),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex == 2 ? 0 : currentIndex,
        children: _tabs,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF5B6BE1),
        icon: const Icon(Icons.add),
        label: const Text('Add patient'),
        onPressed: () => Navigator.pushNamed(context, '/add_patient'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0B1220),
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        selectedItemColor: const Color(0xFF5B6BE1),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Dose'),
          BottomNavigationBarItem(
              icon: Icon(Icons.water_drop), label: 'Fluids'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bloodtype), label: 'Blood'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight), label: 'Growth'),
        ],
      ),
    );
  }

  ListTile _item(BuildContext ctx, IconData i, String t, String route) =>
      ListTile(
        leading: Icon(i, color: Colors.white),
        title: Text(t),
        onTap: () => Navigator.pushNamed(ctx, route),
      );

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF161B29),
          title: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Are you sure you want to sign out?',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close dialog
                
                // Show loading indicator
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF5B6BE1),
                    ),
                  ),
                );
                
                // Sign out
                await AuthService.signOut();
                
                // Navigate to sign in screen and clear navigation stack
                if (context.mounted) {
                  Navigator.of(context).pop(); // Close loading dialog
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login',
                    (route) => false,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }
}
