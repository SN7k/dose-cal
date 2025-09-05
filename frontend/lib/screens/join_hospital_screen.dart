import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';

class JoinHospitalScreen extends ConsumerStatefulWidget {
  const JoinHospitalScreen({super.key});

  @override
  ConsumerState<JoinHospitalScreen> createState() => _JoinHospitalScreenState();
}

class _JoinHospitalScreenState extends ConsumerState<JoinHospitalScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hospitalUidController = TextEditingController();
  final _accessCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();
  
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _hospitalUidController.dispose();
    _accessCodeController.dispose();
    _nameController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Hospital Workspace'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF161B29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.local_hospital,
                      color: Color(0xFF5B6BE1),
                      size: 32,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Join Hospital Workspace',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Enter the hospital UID and access code provided by your administrator',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Hospital UID Input
              const Text(
                'Hospital UID',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _hospitalUidController,
                decoration: const InputDecoration(
                  hintText: 'e.g., AIIMS-DEL-2024',
                  prefixIcon: Icon(Icons.business, color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Hospital UID is required';
                  }
                  if (value.trim().length < 3) {
                    return 'Hospital UID must be at least 3 characters';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 24),
              
              // Access Code Input
              const Text(
                'Access Code',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _accessCodeController,
                decoration: const InputDecoration(
                  hintText: 'Enter access code',
                  prefixIcon: Icon(Icons.lock, color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Access code is required';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 24),
              
              // Doctor Name Input
              const Text(
                'Your Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Dr. John Smith',
                  prefixIcon: Icon(Icons.person, color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 24),
              
              // Role Selection
              const Text(
                'Role',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _roleController.text.isEmpty ? null : _roleController.text,
                decoration: const InputDecoration(
                  hintText: 'Select your role',
                  prefixIcon: Icon(Icons.work, color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
                dropdownColor: const Color(0xFF161B29),
                items: const [
                  DropdownMenuItem(value: 'resident', child: Text('Resident Doctor')),
                  DropdownMenuItem(value: 'attending', child: Text('Attending Physician')),
                  DropdownMenuItem(value: 'consultant', child: Text('Consultant')),
                  DropdownMenuItem(value: 'fellow', child: Text('Fellow')),
                  DropdownMenuItem(value: 'nurse', child: Text('Nurse Practitioner')),
                ],
                onChanged: (value) {
                  setState(() {
                    _roleController.text = value ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Role is required';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 32),
              
              // Error Message
              if (_errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              
              // Join Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _joinHospital,
                  child: _isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text('Joining...'),
                          ],
                        )
                      : const Text('Join Hospital Workspace'),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Continue as Individual
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _isLoading ? null : _continueAsIndividual,
                  child: const Text('Continue as Individual Doctor'),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Help Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF161B29).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need Help?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Contact your hospital administrator for the Hospital UID and Access Code\n'
                      '• Make sure you have permission to access the hospital workspace\n'
                      '• If you\'re not part of a hospital, you can continue as an individual doctor',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _joinHospital() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      // TODO: Implement actual hospital joining logic
      // This would typically involve:
      // 1. Validate hospital UID and access code with backend
      // 2. Create user account in hospital workspace
      // 3. Store user credentials and hospital association
      
      // For now, simulate the process
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulate validation
      final hospitalUid = _hospitalUidController.text.trim();
      final accessCode = _accessCodeController.text.trim();
      
      if (hospitalUid.length < 5 || accessCode.length < 6) {
        throw Exception('Invalid hospital UID or access code');
      }
      
      // Save to settings to mark completion
      final settingsNotifier = ref.read(settingsProvider.notifier);
      await settingsNotifier.setSetting('hospital_uid', hospitalUid);
      await settingsNotifier.setSetting('user_name', _nameController.text.trim());
      await settingsNotifier.setSetting('user_role', _roleController.text);
      await settingsNotifier.setSetting('workspace_type', 'hospital');
      await settingsNotifier.setSetting('onboarding_complete', 'true');
      
      if (mounted) {
        // Navigate to dashboard
        Navigator.of(context).pushReplacementNamed('/dashboard');
      }
      
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _continueAsIndividual() async {
    final settingsNotifier = ref.read(settingsProvider.notifier);
    await settingsNotifier.setSetting('workspace_type', 'individual');
    await settingsNotifier.setSetting('onboarding_complete', 'true');
    
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }
}
