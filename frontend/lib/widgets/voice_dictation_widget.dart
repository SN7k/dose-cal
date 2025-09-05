import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/voice_dictation_service.dart';

// Provider for voice dictation service
final voiceDictationServiceProvider = Provider<VoiceDictationService>((ref) {
  return VoiceDictationService();
});

// Provider for voice dictation state
final voiceDictationStateProvider = StateNotifierProvider<VoiceDictationNotifier, VoiceDictationState>((ref) {
  final service = ref.read(voiceDictationServiceProvider);
  return VoiceDictationNotifier(service);
});

class VoiceDictationState {
  final bool isInitialized;
  final bool isListening;
  final bool isSpeaking;
  final String currentText;
  final String? error;

  const VoiceDictationState({
    this.isInitialized = false,
    this.isListening = false,
    this.isSpeaking = false,
    this.currentText = '',
    this.error,
  });

  VoiceDictationState copyWith({
    bool? isInitialized,
    bool? isListening,
    bool? isSpeaking,
    String? currentText,
    String? error,
  }) {
    return VoiceDictationState(
      isInitialized: isInitialized ?? this.isInitialized,
      isListening: isListening ?? this.isListening,
      isSpeaking: isSpeaking ?? this.isSpeaking,
      currentText: currentText ?? this.currentText,
      error: error,
    );
  }
}

class VoiceDictationNotifier extends StateNotifier<VoiceDictationState> {
  final VoiceDictationService _service;

  VoiceDictationNotifier(this._service) : super(const VoiceDictationState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final initialized = await _service.initialize();
      state = state.copyWith(
        isInitialized: initialized,
        error: initialized ? null : 'Failed to initialize voice service',
      );

      // Listen to service streams
      _service.transcriptionStream.listen((text) {
        state = state.copyWith(currentText: text);
      });

      _service.listeningStream.listen((listening) {
        state = state.copyWith(isListening: listening);
      });

      _service.speakingStream.listen((speaking) {
        state = state.copyWith(isSpeaking: speaking);
      });
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> startListening() async {
    if (!state.isInitialized) return;
    
    try {
      await _service.startListening();
      state = state.copyWith(error: null);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> stopListening() async {
    await _service.stopListening();
  }

  Future<void> speak(String text) async {
    if (!state.isInitialized) return;
    
    try {
      await _service.speak(text);
      state = state.copyWith(error: null);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> stopSpeaking() async {
    await _service.stopSpeaking();
  }

  Future<String> processText(String text) async {
    return await _service.processMedicalDictation(text);
  }

  void clearText() {
    state = state.copyWith(currentText: '');
  }
}

class VoiceDictationWidget extends ConsumerStatefulWidget {
  final TextEditingController textController;
  final String? hintText;
  final VoidCallback? onTextChanged;
  final bool showProcessingIndicator;

  const VoiceDictationWidget({
    super.key,
    required this.textController,
    this.hintText,
    this.onTextChanged,
    this.showProcessingIndicator = true,
  });

  @override
  ConsumerState<VoiceDictationWidget> createState() => _VoiceDictationWidgetState();
}

class _VoiceDictationWidgetState extends ConsumerState<VoiceDictationWidget>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  
  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dictationState = ref.watch(voiceDictationStateProvider);
    final dictationNotifier = ref.read(voiceDictationStateProvider.notifier);

    // Update text controller when dictation text changes
    if (dictationState.currentText.isNotEmpty && 
        dictationState.currentText != widget.textController.text) {
      widget.textController.text = dictationState.currentText;
      widget.onTextChanged?.call();
    }

    // Control pulse animation
    if (dictationState.isListening) {
      if (!_pulseController.isAnimating) {
        _pulseController.repeat(reverse: true);
      }
    } else {
      _pulseController.stop();
      _pulseController.reset();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B29),
        borderRadius: BorderRadius.circular(16),
        border: dictationState.isListening
            ? Border.all(color: const Color(0xFF5B6BE1), width: 2)
            : null,
      ),
      child: Column(
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.mic,
                color: dictationState.isListening 
                    ? const Color(0xFF5B6BE1)
                    : Colors.white60,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  dictationState.isListening
                      ? 'Listening... Speak clearly'
                      : 'Voice Dictation',
                  style: TextStyle(
                    color: dictationState.isListening 
                        ? const Color(0xFF5B6BE1)
                        : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (dictationState.isSpeaking)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Color(0xFF38BDF8),
                  ),
                ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Start/Stop Listening Button
              AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: dictationState.isListening ? _pulseAnimation.value : 1.0,
                    child: ElevatedButton.icon(
                      onPressed: dictationState.isInitialized
                          ? (dictationState.isListening
                              ? () => dictationNotifier.stopListening()
                              : () => dictationNotifier.startListening())
                          : null,
                      icon: Icon(
                        dictationState.isListening ? Icons.stop : Icons.mic,
                        size: 20,
                      ),
                      label: Text(
                        dictationState.isListening ? 'Stop' : 'Start',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dictationState.isListening
                            ? Colors.red
                            : const Color(0xFF5B6BE1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              // Clear Text Button
              OutlinedButton.icon(
                onPressed: dictationState.currentText.isNotEmpty
                    ? () {
                        dictationNotifier.clearText();
                        widget.textController.clear();
                        widget.onTextChanged?.call();
                      }
                    : null,
                icon: const Icon(Icons.clear, size: 18),
                label: const Text('Clear'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
              
              // Process Text Button
              OutlinedButton.icon(
                onPressed: dictationState.currentText.isNotEmpty
                    ? () async {
                        final processed = await dictationNotifier.processText(
                          dictationState.currentText,
                        );
                        widget.textController.text = processed;
                        widget.onTextChanged?.call();
                      }
                    : null,
                icon: const Icon(Icons.auto_fix_high, size: 18),
                label: const Text('Format'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
          
          // Current transcription display
          if (dictationState.currentText.isNotEmpty && widget.showProcessingIndicator) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF0B1220),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF2A3441)),
              ),
              child: Text(
                dictationState.currentText,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
          
          // Error display
          if (dictationState.error != null) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      dictationState.error!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          // Initialization status
          if (!dictationState.isInitialized) ...[
            const SizedBox(height: 12),
            const Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Color(0xFF5B6BE1),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Initializing voice service...',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
