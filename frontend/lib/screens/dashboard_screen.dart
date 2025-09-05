import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

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
  final PageController _pageController = PageController();
  int _pageIndex = 0; // 0-3 for actual pages

  // 4 main tabs (middle 'Add' is not a tab)
  final List<Widget> _tabs = const [
    DoseCalculatorScreen(),
    FluidsCalculatorScreen(),
    BloodCalculatorScreen(),
    GrowthCalculatorScreen(),
  ];

  // Helper: Converts between PageView index and BottomBar index
  int pageToBar(int page) => page < 2 ? page : page + 1;
  int barToPage(int bar) => bar < 2 ? bar : bar - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repo = Repo();
    final p = repo.currentPatient;

    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        title: Text(p == null ? 'Dose-Cal' : '${p.name} • ${p.id}'),
        backgroundColor: Colors.transparent,
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
            _item(context, Icons.description, 'Discharge Summaries', '/discharge'),
            const Divider(height: 1),
            _item(context, Icons.person, 'Profile', '/profile'),
            _item(context, Icons.settings, 'Settings', '/settings'),
            _item(context, Icons.info, 'App Info', '/appinfo'),
            _item(context, Icons.support_agent, 'Support / Contact', '/support'),
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
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: _tabs,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
              icon: const Icon(Icons.medication),
              title: const Text('Dose'),
              backgroundColor: const Color(0xFF5B6BE1)),
          BottomBarItem(
              icon: const Icon(Icons.water_drop),
              title: const Text('Fluids'),
              backgroundColor: const Color(0xFF5B6BE1)),
          BottomBarItem(
              icon: const Icon(Icons.add),
              title: const Text('Add'),
              backgroundColor: const Color(0xFF5B6BE1)),
          BottomBarItem(
              icon: const Icon(Icons.bloodtype),
              title: const Text('Blood'),
              backgroundColor: const Color(0xFF5B6BE1)),
          BottomBarItem(
              icon: const Icon(Icons.monitor_weight),
              title: const Text('Growth'),
              backgroundColor: const Color(0xFF5B6BE1)),
        ],
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.fill,
          opacity: 0.3,
        ),
        backgroundColor: const Color(0xFF0B1220),
        currentIndex: pageToBar(_pageIndex),
        onTap: (barIndex) {
          if (barIndex == 2) {
            Navigator.pushNamed(context, '/add_patient');
            return;
          }
          int pageIndex = barToPage(barIndex);
          _pageController.animateToPage(
            pageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
          setState(() {
            _pageIndex = pageIndex;
          });
        },
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
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