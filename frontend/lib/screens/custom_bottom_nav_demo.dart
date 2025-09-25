import 'package:flutter/material.dart';
import '../widgets/custom_animated_bottom_nav.dart';

class CustomBottomNavDemo extends StatefulWidget {
  const CustomBottomNavDemo({super.key});

  @override
  State<CustomBottomNavDemo> createState() => _CustomBottomNavDemoState();
}

class _CustomBottomNavDemoState extends State<CustomBottomNavDemo> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const _DemoPage(title: 'Home', color: Color(0xFF5B6BE1), icon: Icons.home),
    const _DemoPage(title: 'Account', color: Color(0xFF38BDF8), icon: Icons.account_circle),
    const _DemoPage(title: 'Cart', color: Color(0xFF34D399), icon: Icons.shopping_cart),
    const _DemoPage(title: 'Scan', color: Color(0xFFF59E0B), icon: Icons.qr_code_scanner),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        title: const Text('Animated Bubble Navigation Demo'),
        backgroundColor: const Color(0xFF0B1220),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomAnimatedBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        centerFAB: true, // Enable center FAB mode for bubble animation
        floatingActionButton: const Icon(Icons.add, color: Colors.white),
        onFloatingActionButtonPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add Button Pressed!'),
              backgroundColor: Color(0xFF5B6BE1),
            ),
          );
        },
        items: const [
          BottomNavItem(icon: Icons.home, label: 'Home'),
          BottomNavItem(icon: Icons.account_circle, label: 'Account'),
          BottomNavItem(icon: Icons.shopping_cart, label: 'Cart'),
          BottomNavItem(icon: Icons.qr_code_scanner, label: 'Scan'),
        ],
      ),
    );
  }
}

class _DemoPage extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const _DemoPage({
    required this.title,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.1),
            const Color(0xFF0B1220),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 50,
                color: color,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'This is the $title page',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: color.withOpacity(0.5)),
              ),
              child: Text(
                'Tap other tabs to see the smooth animation!',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
