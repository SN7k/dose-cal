import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final orgCtrl = TextEditingController();
  final kmcCtrl = TextEditingController();
  final idCtrl = TextEditingController();

  String _role =
      'Doctor (Pediatrics)'; // or PG/SS (Pediatrics) | Intern | Student
  bool _accepted = false;

  @override
  void dispose() {
    nameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    orgCtrl.dispose();
    kmcCtrl.dispose();
    idCtrl.dispose();
    super.dispose();
  }

  bool get _isPedsRole =>
      _role == 'Doctor (Pediatrics)' || _role == 'PG/SS (Pediatrics)';

  void _submit() {
    if (!_accepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept Terms & Privacy.')),
      );
      return;
    }
    if (_formKey.currentState?.validate() != true) return;

    final phone = phoneCtrl.text.trim();
    // Proceed to OTP, carrying phone as argument
    Navigator.pushReplacementNamed(context, '/verification', arguments: phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create your clinician account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final r in const [
                      'Doctor (Pediatrics)',
                      'PG/SS (Pediatrics)',
                      'Intern',
                      'Student'
                    ])
                      ChoiceChip(
                        label: Text(r),
                        selected: _role == r,
                        onSelected: (_) => setState(() => _role = r),
                      )
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Full name'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(labelText: 'Mobile (OTP)'),
                  keyboardType: TextInputType.phone,
                  validator: (v) {
                    final t = v?.trim() ?? '';
                    if (t.isEmpty) return 'Required';
                    if (t.length < 8) return 'Enter a valid phone';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: emailCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Email (optional)'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: orgCtrl,
                  decoration: InputDecoration(
                    labelText: _isPedsRole
                        ? 'Hospital / Department'
                        : 'College / Institute',
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                if (_isPedsRole) ...[
                  TextFormField(
                    controller: kmcCtrl,
                    decoration: const InputDecoration(labelText: 'KMC number'),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Required for pediatrics roles'
                        : null,
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Note: integrate file picker for KMC certificate
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('KMC upload: to be implemented')),
                      );
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload KMC certificate'),
                  ),
                ] else ...[
                  TextFormField(
                    controller: idCtrl,
                    decoration:
                        const InputDecoration(labelText: 'ID card number'),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Note: integrate file picker for ID card
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('ID card upload: to be implemented')),
                      );
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload ID card'),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _accepted,
                      onChanged: (v) => setState(() => _accepted = v ?? false),
                    ),
                    const Expanded(
                      child: Text(
                        'I accept the Terms of Service and Privacy Policy.',
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Register & Verify'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/verification'),
                  child: const Text('Already registered? Enter OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
