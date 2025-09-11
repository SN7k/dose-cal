import 'package:flutter/material.dart';
import '../data/repository.dart';
import 'auth/data/auth_service.dart';
import 'dose_calculator.dart';
import 'blood_calculator.dart';
import 'growth_calculator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const _HomeScreen(),
    const DoseCalculatorScreen(),
    const SizedBox.shrink(), // Placeholder for the middle button
    const BloodCalculatorScreen(),
    const GrowthCalculatorScreen(),
  ];

  void _onTabTapped(int index) {
    // Prevent selection of the middle placeholder tab
    if (index == 2) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final p = repo.currentPatient;

    // Simplified logic to get the correct body index.
    // Skips index 2.
    int bodyIndex = _currentIndex > 2 ? _currentIndex -1 : _currentIndex;


    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        title: Text(p == null ? 'Dose-Cal' : '${p.name} • ${p.id}'),
        backgroundColor: const Color(0xFF0B1220),
        elevation: 0,
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
        index: bodyIndex,
        children: const [
           _HomeScreen(),
           DoseCalculatorScreen(),
           BloodCalculatorScreen(),
           GrowthCalculatorScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF5B6BE1),
        onPressed: () => Navigator.pushNamed(context, '/add_patient'),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0B1220),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: const Color(0xFF5B6BE1),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Dose'),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''), // Placeholder
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
                Navigator.of(context).pop();
                
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF5B6BE1),
                    ),
                  ),
                );
                
                await AuthService.signOut();
                
                if (context.mounted) {
                  Navigator.of(context).pop();
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

// Updated Home Screen Widget
class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    // Use SingleChildScrollView to prevent overflow
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient Management',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Patient ID',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF161B29),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement Search
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B6BE1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Search'),
                  ),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 32),
            const Text(
              'Quick Tools',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _ToolButton(
                  icon: Icons.medication,
                  label: 'Dosage Calculator',
                  onTap: () {
                    // TODO: Implement navigation
                  },
                ),
                _ToolButton(
                  icon: Icons.calculate,
                  label: 'BMI Calculator',
                  onTap: () {
                    // TODO: Navigate to BMI Calculator
                  },
                ),
                _ToolButton(
                  icon: Icons.info_outline,
                  label: 'Drug Information',
                  onTap: () {
                    // TODO: Navigate to Drug Information
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ToolButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF161B29),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF5B6BE1)),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}