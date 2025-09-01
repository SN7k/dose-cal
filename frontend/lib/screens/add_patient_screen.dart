import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../models/patient.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});
  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final _form = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _name = TextEditingController();
  final _parent = TextEditingController();
  final _ageMonths = TextEditingController();
  final _weight = TextEditingController();
  final _height = TextEditingController();
  final _allergies = TextEditingController();
  final _ward = TextEditingController();
  final _reason = TextEditingController();
  String _sex = 'Male';

  @override
  void dispose() {
    _id.dispose();
    _name.dispose();
    _parent.dispose();
    _ageMonths.dispose();
    _weight.dispose();
    _height.dispose();
    _allergies.dispose();
    _ward.dispose();
    _reason.dispose();
    super.dispose();
  }

  InputDecoration _dec(String label, {String? hint}) => InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFF161B29),
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white38),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      );

  void _save() {
    if (!_form.currentState!.validate()) return;
    final p = Patient(
      id: _id.text.trim(),
      name: _name.text.trim(),
      parentName: _parent.text.trim(),
      sex: _sex,
      ageMonths: int.tryParse(_ageMonths.text) ?? 0,
      weightKg: double.tryParse(_weight.text),
      heightCm: double.tryParse(_height.text),
      allergies: _allergies.text.isEmpty
          ? []
          : _allergies.text.split(',').map((e) => e.trim()).toList(),
      wardBed: _ward.text.trim().isEmpty ? null : _ward.text.trim(),
      admissionReason: _reason.text.trim().isEmpty ? null : _reason.text.trim(),
    );
    Repo().addPatient(p);
    Navigator.pushReplacementNamed(context, '/patient_detail', arguments: p.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(title: const Text('Add Patient')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF161B29),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  TextFormField(
                    controller: _id,
                    decoration: _dec('Patient ID *'),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _name,
                    decoration: _dec('Patient name'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _parent,
                    decoration: _dec('Parent/Guardian'),
                  ),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: _ageMonths,
                        keyboardType: TextInputType.number,
                        decoration: _dec('Age (months)'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _sex,
                        items: const ['Male', 'Female', 'Other']
                            .map((s) =>
                                DropdownMenuItem(value: s, child: Text(s)))
                            .toList(),
                        onChanged: (v) => setState(() => _sex = v ?? 'Male'),
                        decoration: _dec('Sex'),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: _weight,
                        keyboardType: TextInputType.number,
                        decoration: _dec('Weight (kg)'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _height,
                        keyboardType: TextInputType.number,
                        decoration: _dec('Height (cm)'),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _allergies,
                    decoration: _dec(
                      'Allergies (comma-separated)',
                      hint: 'e.g., penicillin, peanuts',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _ward,
                    decoration: _dec('Ward / Bed'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _reason,
                    decoration: _dec('Admission reason'),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  child: const Text('Save & Open'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
