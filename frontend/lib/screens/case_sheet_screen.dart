import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../data/local_db.dart';
import '../widgets/voice_dictation_widget.dart';
import '../widgets/template_selection_widget.dart';
import '../services/case_template_service.dart';

class CaseSheetScreen extends ConsumerStatefulWidget {
  final String patientId;
  
  const CaseSheetScreen({
    super.key,
    required this.patientId,
  });

  @override
  ConsumerState<CaseSheetScreen> createState() => _CaseSheetScreenState();
}

class _CaseSheetScreenState extends ConsumerState<CaseSheetScreen> {
  final _updateController = TextEditingController();
  final _scrollController = ScrollController();
  bool _isAddingUpdate = false;
  bool _showVoiceDictation = false;

  @override
  void dispose() {
    _updateController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final patientAsync = ref.watch(patientProvider(widget.patientId));
    final caseSheetAsync = ref.watch(caseSheetProvider(widget.patientId));
    
    return Scaffold(
      appBar: AppBar(
        title: patientAsync.when(
          data: (patient) => Text('Case Sheet - ${patient?.initials ?? 'Unknown'}'),
          loading: () => const Text('Case Sheet'),
          error: (_, __) => const Text('Case Sheet'),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.description),
            onPressed: _showTemplateSelection,
            tooltip: 'Templates',
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: _startVoiceDictation,
            tooltip: 'Voice Dictation',
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareCase,
            tooltip: 'Share Case',
          ),
        ],
      ),
      body: Column(
        children: [
          // Patient Info Header
          _buildPatientHeader(),
          
          // Case Updates List
          Expanded(
            child: caseSheetAsync.when(
              data: (caseSheet) {
                if (caseSheet == null) {
                  return const Center(
                    child: Text(
                      'No case sheet available',
                      style: TextStyle(color: Colors.white60),
                    ),
                  );
                }
                
                return _buildCaseUpdatesList(caseSheet.id);
              },
              loading: () => const Center(
                child: CircularProgressIndicator(color: Color(0xFF5B6BE1)),
              ),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 48,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Error loading case sheet',
                      style: TextStyle(color: Colors.white60),
                    ),
                    SizedBox(height: 8),
                    Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Add Update Section
          _buildAddUpdateSection(),
        ],
      ),
    );
  }

  Widget _buildPatientHeader() {
    final patientAsync = ref.watch(patientProvider(widget.patientId));
    
    return patientAsync.when(
      data: (patient) {
        if (patient == null) return const SizedBox.shrink();
        
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF161B29),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5B6BE1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        patient.initials ?? 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient.fullName ?? patient.initials ?? 'Unknown',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (patient.mrn != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            'MRN: ${patient.mrn}',
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Patient Details Row
              Row(
                children: [
                  if (patient.dob != null) ...[
                    _buildPatientDetail(
                      'Age',
                      _calculateAge(patient.dob!),
                    ),
                    const SizedBox(width: 16),
                  ],
                  if (patient.sex != null) ...[
                    _buildPatientDetail('Sex', patient.sex!),
                    const SizedBox(width: 16),
                  ],
                  if (patient.weightKg != null) ...[
                    _buildPatientDetail(
                      'Weight',
                      '${patient.weightKg!.toStringAsFixed(1)} kg',
                    ),
                  ],
                ],
              ),
              
              if (patient.allergies != null && patient.allergies!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Allergies: ${patient.allergies}',
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
      loading: () => const SizedBox(
        height: 120,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildPatientDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCaseUpdatesList(String caseId) {
    final caseUpdatesAsync = ref.watch(caseUpdatesProvider(caseId));
    
    return caseUpdatesAsync.when(
      data: (updates) {
        if (updates.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.note_add,
                  size: 64,
                  color: Colors.white30,
                ),
                SizedBox(height: 16),
                Text(
                  'No case updates yet',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Add your first update below',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }
        
        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: updates.length,
          itemBuilder: (context, index) {
            final update = updates[index];
            return _buildCaseUpdateCard(update);
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: Color(0xFF5B6BE1)),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          'Error loading updates: $error',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildCaseUpdateCard(CaseUpdate update) {
    final repository = ref.read(dataRepositoryProvider);
    final formattedUpdate = repository.formatCaseUpdate(update);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B29),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2A3441),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with doctor and timestamp
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B6BE1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    update.doctorName.split(' ').map((e) => e[0]).take(2).join(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      update.doctorName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      _formatTimestamp(update.createdAtUtc),
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Update content
          Text(
            formattedUpdate,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddUpdateSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF161B29),
        border: Border(
          top: BorderSide(color: Color(0xFF2A3441)),
        ),
      ),
      child: Column(
        children: [
          // Voice Dictation Toggle
          if (_showVoiceDictation) ...[
            VoiceDictationWidget(
              textController: _updateController,
              onTextChanged: () {
                setState(() {
                  // Text has been updated via voice dictation
                });
              },
            ),
            const SizedBox(height: 16),
          ],
          
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _updateController,
                  maxLines: 3,
                  minLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Add case update...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _showVoiceDictation = !_showVoiceDictation;
                      });
                    },
                    icon: Icon(
                      _showVoiceDictation ? Icons.keyboard : Icons.mic,
                      color: _showVoiceDictation 
                          ? const Color(0xFF5B6BE1)
                          : Colors.white60,
                    ),
                    tooltip: _showVoiceDictation 
                        ? 'Hide Voice Dictation' 
                        : 'Show Voice Dictation',
                  ),
                  IconButton(
                    onPressed: _isAddingUpdate ? null : _addCaseUpdate,
                    icon: _isAddingUpdate
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF5B6BE1),
                            ),
                          )
                        : const Icon(
                            Icons.send,
                            color: Color(0xFF5B6BE1),
                          ),
                  ),
                ],
              ),
            ],
          ),
          
          // Quick Action Buttons
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildQuickActionButton(
                  'Assessment',
                  Icons.assessment,
                  () => _insertQuickText('Assessment: '),
                ),
                const SizedBox(width: 8),
                _buildQuickActionButton(
                  'Plan',
                  Icons.schedule,
                  () => _insertQuickText('Plan: '),
                ),
                const SizedBox(width: 8),
                _buildQuickActionButton(
                  'Vitals',
                  Icons.favorite,
                  () => _insertQuickText('Vitals - BP: , HR: , Temp: , RR: , SpO2: '),
                ),
                const SizedBox(width: 8),
                _buildQuickActionButton(
                  'Medications',
                  Icons.medication,
                  () => _insertQuickText('Medications: '),
                ),
                const SizedBox(width: 8),
                _buildQuickActionButton(
                  'Follow-up',
                  Icons.update,
                  () => _insertQuickText('Follow-up: '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0B1220),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF2A3441)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF5B6BE1)),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _insertQuickText(String text) {
    final currentText = _updateController.text;
    final cursorPosition = _updateController.selection.start;
    
    String newText;
    if (cursorPosition == -1) {
      // No cursor position, append to end
      newText = currentText.isEmpty ? text : '$currentText\n$text';
    } else {
      // Insert at cursor position
      newText = currentText.substring(0, cursorPosition) + 
                text + 
                currentText.substring(cursorPosition);
    }
    
    _updateController.text = newText;
    _updateController.selection = TextSelection.fromPosition(
      TextPosition(offset: cursorPosition + text.length),
    );
  }

  String _calculateAge(DateTime dob) {
    final now = DateTime.now();
    final age = now.difference(dob).inDays;
    
    if (age < 30) {
      return '${age}d';
    } else if (age < 365) {
      return '${(age / 30).floor()}m';
    } else {
      return '${(age / 365).floor()}y';
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);
    
    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inHours < 1) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inDays < 1) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }

  Future<void> _addCaseUpdate() async {
    final text = _updateController.text.trim();
    if (text.isEmpty) return;
    
    setState(() {
      _isAddingUpdate = true;
    });
    
    try {
      final caseSheetAsync = ref.read(caseSheetProvider(widget.patientId));
      final caseSheet = caseSheetAsync.valueOrNull;
      
      if (caseSheet != null) {
        final caseNotifier = ref.read(caseNotifierProvider(caseSheet.id).notifier);
        final success = await caseNotifier.addUpdate(text);
        
        if (success) {
          _updateController.clear();
          // Scroll to bottom to show new update
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to add update'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isAddingUpdate = false;
      });
    }
  }

  void _startVoiceDictation() {
    setState(() {
      _showVoiceDictation = !_showVoiceDictation;
    });
    
    if (_showVoiceDictation) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Voice dictation panel opened. Tap the microphone to start.'),
          backgroundColor: Color(0xFF5B6BE1),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _shareCase() {
    // TODO: Implement case sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Case sharing coming soon!'),
        backgroundColor: Color(0xFF5B6BE1),
      ),
    );
  }

  void _showTemplateSelection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TemplateSelectionWidget(
        onTemplateSelected: (templateId) {
          final template = CaseTemplateService.getTemplateById(templateId);
          if (template != null) {
            final content = CaseTemplateService.generateTemplateContent(template);
            _updateController.text = content;
            
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Template "${template.name}" applied'),
                backgroundColor: const Color(0xFF5B6BE1),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
      ),
    );
  }
}
