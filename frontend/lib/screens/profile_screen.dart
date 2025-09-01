import 'package:flutter/material.dart';
import 'auth/data/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String?> _userData = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final userData = await AuthService.getCurrentUser();
      setState(() {
        _userData = userData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final name = _userData['name'] ?? 'Medical Professional';
    final email = _userData['email'] ?? 'No email';
    final role = _userData['role'] ?? 'doctor';

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(children: [
              CircleAvatar(
                radius: 44,
                backgroundColor: const Color(0xFF5B6BE1),
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : 'D',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '${role.toUpperCase()} • DoseCal verified',
                style: const TextStyle(color: Colors.white70),
              ),
            ]),
          ),
          const SizedBox(height: 16),
          _card(children: [
            _kv('Email', email),
            _kv('Role', role.toUpperCase()),
            _kv('Login Time', _formatLoginTime()),
          ]),
          const SizedBox(height: 12),
          _card(children: [
            _tile(Icons.notifications, 'Notification'),
            _tile(Icons.lock, 'Security'),
            _tile(Icons.language, 'Language'),
            _tile(Icons.dark_mode, 'Dark Mode',
                trailing: Switch(value: true, onChanged: (_) {})),
          ]),
          const SizedBox(height: 12),
          _card(children: [
            _tile(Icons.help_center, 'Help Center',
                route: '/support', context: context),
            _tile(Icons.info, 'App Info', route: '/appinfo', context: context),
          ]),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showSignOutDialog(context),
            icon: const Icon(Icons.logout),
            label: const Text('Sign Out'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  String _formatLoginTime() {
    final loginTimeStr = _userData['loginTime'];
    if (loginTimeStr == null) return 'Unknown';
    
    try {
      final loginTime = DateTime.parse(loginTimeStr);
      final now = DateTime.now();
      final difference = now.difference(loginTime);
      
      if (difference.inDays > 0) {
        return '${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minutes ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

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

  static Widget _card({required List<Widget> children}) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFF161B29),
            borderRadius: BorderRadius.circular(16)),
        child: Column(children: children),
      );

  static Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [
          SizedBox(
              width: 130,
              child: Text(k, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(v)),
        ]),
      );

  static Widget _tile(IconData i, String t,
          {Widget? trailing, String? route, BuildContext? context}) =>
      ListTile(
          leading: Icon(i),
          title: Text(t),
          trailing: trailing,
          onTap: route == null
              ? null
              : () => Navigator.pushNamed(context!, route));
}
