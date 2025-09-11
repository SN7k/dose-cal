import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repository.dart';
import '../data/local_db.dart';
import '../providers/app_providers.dart';
import 'auth/data/auth_service.dart';
import 'dose_calculator.dart';
import 'blood_calculator.dart';
import 'growth_calculator.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});
  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentIndex = 0;

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

// Updated Home Screen Widget with Patient Search
class _HomeScreen extends ConsumerStatefulWidget {
  const _HomeScreen();

  @override
  ConsumerState<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<_HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _selectPatient(Patient patient) {
    // Navigate to patient detail or case sheet
    Navigator.pushNamed(
      context, 
      '/case_sheet',
      arguments: {'patientId': patient.id}
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(patientSearchProvider(_searchQuery));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient Search',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Enhanced Search Box
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF161B29),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF5B6BE1).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search by name, MRN, initials, or ID',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF5B6BE1),
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.white54,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            _onSearchChanged('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Search Results
            searchResults.when(
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: CircularProgressIndicator(
                    color: Color(0xFF5B6BE1),
                  ),
                ),
              ),
              error: (error, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error loading patients: ${error.toString()}',
                        style: const TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              data: (patients) {
                if (patients.isEmpty && _searchQuery.isNotEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            color: Colors.white54,
                            size: 48,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No patients found matching your search',
                            style: TextStyle(color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                
                if (patients.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: Colors.white54,
                            size: 48,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No patients available',
                            style: TextStyle(color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tap the + button to add a new patient',
                            style: TextStyle(color: Colors.white54, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _searchQuery.isEmpty 
                          ? 'Recent Patients (${patients.length})'
                          : 'Search Results (${patients.length})',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: patients.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final patient = patients[index];
                        return _PatientCard(
                          patient: patient,
                          onTap: () => _selectPatient(patient),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            
            const SizedBox(height: 32),
            
            // Quick Tools Section
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

// Patient Card Widget
class _PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback onTap;

  const _PatientCard({
    required this.patient,
    required this.onTap,
  });

  String _calculateAge(DateTime? dob) {
    if (dob == null) return 'Unknown';
    final now = DateTime.now();
    final age = now.difference(dob);
    final years = (age.inDays / 365).floor();
    final months = ((age.inDays % 365) / 30).floor();
    
    if (years > 0) {
      return '${years}y ${months}m';
    } else {
      return '${months}m';
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayName = patient.fullName?.isNotEmpty == true 
        ? patient.fullName! 
        : patient.initials?.isNotEmpty == true 
            ? patient.initials!
            : 'Unknown Patient';
    
    final initials = displayName.isNotEmpty 
        ? displayName[0].toUpperCase() 
        : 'U';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B29),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF5B6BE1).withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFF5B6BE1),
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Patient Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (patient.mrn?.isNotEmpty == true) ...[
                        Text(
                          'MRN: ${patient.mrn}',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                        if (patient.sex?.isNotEmpty == true || patient.dob != null)
                          const Text(' • ', style: TextStyle(color: Colors.white60)),
                      ],
                      if (patient.sex?.isNotEmpty == true) ...[
                        Text(
                          patient.sex!,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                        if (patient.dob != null)
                          const Text(' • ', style: TextStyle(color: Colors.white60)),
                      ],
                      if (patient.dob != null)
                        Text(
                          _calculateAge(patient.dob),
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                    ],
                  ),
                  if (patient.allergies?.isNotEmpty == true) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Allergies: ${patient.allergies}',
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            
            // Arrow
            const Icon(
              Icons.chevron_right,
              color: Colors.white54,
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