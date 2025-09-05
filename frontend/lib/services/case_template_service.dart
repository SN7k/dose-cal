import 'package:flutter/material.dart';

enum CaseTemplateType {
  admission,
  progress,
  discharge,
  procedure,
  consultation,
  emergency,
  icu,
  pediatric,
  surgical,
  medication,
}

class CaseTemplate {
  final String id;
  final String name;
  final String description;
  final CaseTemplateType type;
  final List<TemplateSection> sections;
  final Map<String, String> defaultValues;
  final IconData icon;
  final Color color;

  const CaseTemplate({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.sections,
    this.defaultValues = const {},
    required this.icon,
    required this.color,
  });
}

class TemplateSection {
  final String title;
  final String content;
  final bool isRequired;
  final List<String> prompts;

  const TemplateSection({
    required this.title,
    required this.content,
    this.isRequired = false,
    this.prompts = const [],
  });
}

class CaseTemplateService {
  static final List<CaseTemplate> _templates = [
    // Admission Template
    CaseTemplate(
      id: 'admission',
      name: 'Admission Note',
      description: 'Complete admission assessment and plan',
      type: CaseTemplateType.admission,
      icon: Icons.login,
      color: const Color(0xFF4CAF50),
      sections: [
        TemplateSection(
          title: 'Chief Complaint',
          content: 'CC: ',
          isRequired: true,
          prompts: ['Main reason for admission', 'Duration of symptoms'],
        ),
        TemplateSection(
          title: 'History of Present Illness',
          content: 'HPI: ',
          isRequired: true,
          prompts: ['Timeline of illness', 'Associated symptoms', 'Aggravating/relieving factors'],
        ),
        TemplateSection(
          title: 'Past Medical History',
          content: 'PMH: ',
          prompts: ['Previous hospitalizations', 'Chronic conditions', 'Surgeries'],
        ),
        TemplateSection(
          title: 'Medications',
          content: 'Medications: ',
          prompts: ['Current medications', 'Allergies', 'Dosages'],
        ),
        TemplateSection(
          title: 'Physical Exam',
          content: 'PE: \nVitals: BP ___ HR ___ Temp ___ RR ___ SpO2 ___\nGeneral: \nHEENT: \nCV: \nPulm: \nAbd: \nExt: \nNeuro: ',
          isRequired: true,
          prompts: ['Vital signs', 'System-based examination'],
        ),
        TemplateSection(
          title: 'Assessment & Plan',
          content: 'A&P: \n1. ',
          isRequired: true,
          prompts: ['Primary diagnosis', 'Differential diagnosis', 'Treatment plan'],
        ),
      ],
    ),

    // Progress Note Template
    CaseTemplate(
      id: 'progress',
      name: 'Progress Note',
      description: 'Daily progress assessment',
      type: CaseTemplateType.progress,
      icon: Icons.timeline,
      color: const Color(0xFF2196F3),
      sections: [
        TemplateSection(
          title: 'Subjective',
          content: 'S: ',
          prompts: ['How patient feels', 'Symptoms today', 'Sleep/appetite'],
        ),
        TemplateSection(
          title: 'Objective',
          content: 'O: \nVitals: BP ___ HR ___ Temp ___ RR ___ SpO2 ___\nExam: ',
          prompts: ['Vital signs', 'Physical findings', 'Lab results'],
        ),
        TemplateSection(
          title: 'Assessment',
          content: 'A: ',
          prompts: ['Current condition', 'Response to treatment'],
        ),
        TemplateSection(
          title: 'Plan',
          content: 'P: ',
          prompts: ['Continued treatment', 'New orders', 'Goals for today'],
        ),
      ],
    ),

    // Pediatric Template
    CaseTemplate(
      id: 'pediatric',
      name: 'Pediatric Note',
      description: 'Pediatric-specific assessment',
      type: CaseTemplateType.pediatric,
      icon: Icons.child_care,
      color: const Color(0xFFFF9800),
      sections: [
        TemplateSection(
          title: 'Patient Info',
          content: 'Age: ___ Weight: ___kg Height: ___cm\nParent/Guardian: ',
          isRequired: true,
          prompts: ['Age in months/years', 'Current weight/height', 'Guardian present'],
        ),
        TemplateSection(
          title: 'Chief Complaint',
          content: 'CC (per parent): ',
          isRequired: true,
          prompts: ['Main concern', 'Duration', 'Parental observations'],
        ),
        TemplateSection(
          title: 'Feeding/Development',
          content: 'Feeding: \nDevelopment: \nImmunizations: ',
          prompts: ['Breast/bottle feeding', 'Developmental milestones', 'Vaccination status'],
        ),
        TemplateSection(
          title: 'Physical Exam',
          content: 'PE: \nVitals: HR ___ RR ___ Temp ___ SpO2 ___ (age-appropriate)\nGeneral: Alert, active, appropriate for age\nHEENT: \nCV: \nPulm: \nAbd: \nSkin: \nNeuro: ',
          isRequired: true,
          prompts: ['Age-appropriate vitals', 'Growth parameters', 'Developmental assessment'],
        ),
        TemplateSection(
          title: 'Assessment & Plan',
          content: 'A&P: \n1. \n\nParent Education: \nFollow-up: ',
          isRequired: true,
          prompts: ['Pediatric-specific diagnosis', 'Weight-based dosing', 'Parent instructions'],
        ),
      ],
    ),

    // Emergency Template
    CaseTemplate(
      id: 'emergency',
      name: 'Emergency Note',
      description: 'Emergency department assessment',
      type: CaseTemplateType.emergency,
      icon: Icons.local_hospital,
      color: const Color(0xFFF44336),
      sections: [
        TemplateSection(
          title: 'Triage',
          content: 'Triage Level: ___ Time: ___\nCC: ',
          isRequired: true,
          prompts: ['Acuity level', 'Time of presentation', 'Chief complaint'],
        ),
        TemplateSection(
          title: 'HPI',
          content: 'HPI: \nOnset: \nSeverity: \nRadiation: \nTiming: \nContext: ',
          isRequired: true,
          prompts: ['OPQRST assessment', 'Associated symptoms'],
        ),
        TemplateSection(
          title: 'Vitals & Exam',
          content: 'Vitals: BP ___ HR ___ Temp ___ RR ___ SpO2 ___ Pain ___/10\nGeneral: \nExam: ',
          isRequired: true,
          prompts: ['Complete vital signs', 'Pain assessment', 'Focused examination'],
        ),
        TemplateSection(
          title: 'Tests & Results',
          content: 'Labs: \nImaging: \nECG: \nOther: ',
          prompts: ['Laboratory results', 'Radiology findings', 'Point-of-care tests'],
        ),
        TemplateSection(
          title: 'ED Course',
          content: 'ED Course: \nTreatment given: \nResponse: ',
          prompts: ['Interventions performed', 'Patient response', 'Complications'],
        ),
        TemplateSection(
          title: 'Disposition',
          content: 'Disposition: \nDischarge instructions: \nFollow-up: ',
          isRequired: true,
          prompts: ['Admit/discharge/transfer', 'Patient instructions', 'Return precautions'],
        ),
      ],
    ),

    // Medication Template
    CaseTemplate(
      id: 'medication',
      name: 'Medication Review',
      description: 'Medication reconciliation and review',
      type: CaseTemplateType.medication,
      icon: Icons.medication,
      color: const Color(0xFF9C27B0),
      sections: [
        TemplateSection(
          title: 'Current Medications',
          content: 'Current Medications:\n1. \n2. \n3. ',
          isRequired: true,
          prompts: ['Medication name', 'Dose and frequency', 'Indication'],
        ),
        TemplateSection(
          title: 'Allergies',
          content: 'Allergies: \nNKDA: [ ] \nReactions: ',
          isRequired: true,
          prompts: ['Drug allergies', 'Type of reaction', 'Severity'],
        ),
        TemplateSection(
          title: 'Changes Made',
          content: 'Medication Changes:\nStarted: \nStopped: \nDose changed: ',
          prompts: ['New medications', 'Discontinued drugs', 'Dose adjustments'],
        ),
        TemplateSection(
          title: 'Monitoring',
          content: 'Monitoring Plan:\nLabs to check: \nNext review: ',
          prompts: ['Required monitoring', 'Lab schedule', 'Follow-up timing'],
        ),
      ],
    ),

    // Procedure Template
    CaseTemplate(
      id: 'procedure',
      name: 'Procedure Note',
      description: 'Documentation for procedures',
      type: CaseTemplateType.procedure,
      icon: Icons.medical_services,
      color: const Color(0xFF607D8B),
      sections: [
        TemplateSection(
          title: 'Procedure Details',
          content: 'Procedure: \nIndication: \nDate/Time: \nLocation: ',
          isRequired: true,
          prompts: ['Procedure name', 'Medical indication', 'When performed'],
        ),
        TemplateSection(
          title: 'Consent & Preparation',
          content: 'Consent: \nTimeout performed: \nPrep: \nAnesthesia: ',
          isRequired: true,
          prompts: ['Informed consent', 'Safety checklist', 'Patient preparation'],
        ),
        TemplateSection(
          title: 'Procedure Description',
          content: 'Technique: \nFindings: \nComplications: None',
          isRequired: true,
          prompts: ['Step-by-step description', 'Notable findings', 'Any complications'],
        ),
        TemplateSection(
          title: 'Post-Procedure',
          content: 'Post-procedure status: \nSpecimens sent: \nPatient tolerated: \nPlan: ',
          prompts: ['Patient condition', 'Pathology sent', 'Recovery', 'Next steps'],
        ),
      ],
    ),
  ];

  static List<CaseTemplate> getAllTemplates() => _templates;

  static List<CaseTemplate> getTemplatesByType(CaseTemplateType type) {
    return _templates.where((template) => template.type == type).toList();
  }

  static CaseTemplate? getTemplateById(String id) {
    try {
      return _templates.firstWhere((template) => template.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<CaseTemplate> searchTemplates(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _templates.where((template) {
      return template.name.toLowerCase().contains(lowercaseQuery) ||
             template.description.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  static String generateTemplateContent(CaseTemplate template) {
    final buffer = StringBuffer();
    
    final now = DateTime.now();
    buffer.writeln('--- ${template.name.toUpperCase()} ---');
    buffer.writeln('Date: ${now.toString().split(' ')[0]}');
    buffer.writeln('Time: ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}');
    buffer.writeln();

    for (final section in template.sections) {
      buffer.writeln('${section.title.toUpperCase()}:');
      buffer.writeln(section.content);
      buffer.writeln();
    }

    return buffer.toString();
  }

  static Map<String, dynamic> getTemplateAnalytics() {
    return {
      'total_templates': _templates.length,
      'templates_by_type': {
        for (var type in CaseTemplateType.values)
          type.name: _templates.where((t) => t.type == type).length
      },
      'required_sections': _templates
          .map((t) => t.sections.where((s) => s.isRequired).length)
          .reduce((a, b) => a + b),
    };
  }
}
