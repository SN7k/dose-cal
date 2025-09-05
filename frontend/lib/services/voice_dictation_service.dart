import 'dart:async';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceDictationService {
  static final VoiceDictationService _instance = VoiceDictationService._internal();
  factory VoiceDictationService() => _instance;
  VoiceDictationService._internal();

  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  
  bool _isInitialized = false;
  bool _isListening = false;
  bool _isSpeaking = false;
  String _lastWords = '';
  
  // Stream controllers for real-time updates
  final StreamController<String> _transcriptionController = StreamController<String>.broadcast();
  final StreamController<bool> _listeningController = StreamController<bool>.broadcast();
  final StreamController<bool> _speakingController = StreamController<bool>.broadcast();
  
  // Getters
  bool get isInitialized => _isInitialized;
  bool get isListening => _isListening;
  bool get isSpeaking => _isSpeaking;
  String get lastWords => _lastWords;
  
  // Streams
  Stream<String> get transcriptionStream => _transcriptionController.stream;
  Stream<bool> get listeningStream => _listeningController.stream;
  Stream<bool> get speakingStream => _speakingController.stream;

  /// Initialize the voice service
  Future<bool> initialize() async {
    if (_isInitialized) return true;
    
    try {
      // Request microphone permission
      final permission = await Permission.microphone.request();
      if (permission != PermissionStatus.granted) {
        throw Exception('Microphone permission not granted');
      }

      // Initialize speech-to-text
      final sttAvailable = await _speechToText.initialize(
        onStatus: _onSpeechStatus,
        onError: _onSpeechError,
        debugLogging: false,
      );

      if (!sttAvailable) {
        throw Exception('Speech recognition not available');
      }

      // Initialize text-to-speech
      await _flutterTts.setLanguage('en-US');
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setVolume(0.8);
      await _flutterTts.setPitch(1.0);
      
      // Set TTS completion handler
      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
        _speakingController.add(false);
      });

      _isInitialized = true;
      return true;
    } catch (e) {
      debugPrint('VoiceDictationService initialization error: $e');
      return false;
    }
  }

  /// Start listening for voice input
  Future<bool> startListening({
    String? localeId,
    Duration? timeout,
  }) async {
    if (!_isInitialized) {
      final initialized = await initialize();
      if (!initialized) return false;
    }

    if (_isListening) {
      await stopListening();
    }

    try {
      final available = await _speechToText.initialize();
      if (!available) return false;

      _lastWords = '';
      _transcriptionController.add('');

      await _speechToText.listen(
        onResult: _onSpeechResult,
        listenFor: timeout ?? const Duration(minutes: 5),
        pauseFor: const Duration(seconds: 3),
        partialResults: true,
        localeId: localeId ?? 'en_US',
        onSoundLevelChange: null,
        cancelOnError: true,
        listenMode: ListenMode.confirmation,
      );

      _isListening = true;
      _listeningController.add(true);
      return true;
    } catch (e) {
      debugPrint('Error starting speech recognition: $e');
      return false;
    }
  }

  /// Stop listening for voice input
  Future<void> stopListening() async {
    if (_speechToText.isListening) {
      await _speechToText.stop();
    }
    _isListening = false;
    _listeningController.add(false);
  }

  /// Speak text using TTS
  Future<void> speak(String text) async {
    if (!_isInitialized) {
      final initialized = await initialize();
      if (!initialized) return;
    }

    if (_isSpeaking) {
      await _flutterTts.stop();
    }

    try {
      _isSpeaking = true;
      _speakingController.add(true);
      await _flutterTts.speak(text);
    } catch (e) {
      debugPrint('Error speaking text: $e');
      _isSpeaking = false;
      _speakingController.add(false);
    }
  }

  /// Stop speaking
  Future<void> stopSpeaking() async {
    if (_isSpeaking) {
      await _flutterTts.stop();
      _isSpeaking = false;
      _speakingController.add(false);
    }
  }

  /// Get available languages for speech recognition
  Future<List<LocaleName>> getAvailableLanguages() async {
    if (!_isInitialized) {
      final initialized = await initialize();
      if (!initialized) return [];
    }
    
    return await _speechToText.locales();
  }

  /// Speech recognition result handler
  void _onSpeechResult(result) {
    _lastWords = result.recognizedWords;
    _transcriptionController.add(_lastWords);
  }

  /// Speech status change handler
  void _onSpeechStatus(String status) {
    debugPrint('Speech status: $status');
    
    if (status == 'listening') {
      _isListening = true;
      _listeningController.add(true);
    } else if (status == 'notListening' || status == 'done') {
      _isListening = false;
      _listeningController.add(false);
    }
  }

  /// Speech error handler
  void _onSpeechError(error) {
    debugPrint('Speech error: ${error.errorMsg}');
    _isListening = false;
    _listeningController.add(false);
  }

  /// Medical dictation helpers
  Future<String> processMedicalDictation(String rawText) async {
    // Process common medical abbreviations and formatting
    String processed = rawText;
    
    // Common medical dictation patterns
    final medicalReplacements = {
      'bee pee': 'BP',
      'blood pressure': 'BP',
      'heart rate': 'HR',
      'temperature': 'temp',
      'celsius': '°C',
      'fahrenheit': '°F',
      'milligrams': 'mg',
      'micrograms': 'mcg',
      'milliliters': 'ml',
      'liters': 'L',
      'kilograms': 'kg',
      'grams': 'g',
      'beats per minute': 'bpm',
      'respirations per minute': 'rpm',
      'oxygen saturation': 'SpO2',
      'percent': '%',
      'semicolon': ';',
      'period': '.',
      'comma': ',',
      'new line': '\n',
      'new paragraph': '\n\n',
    };

    for (final entry in medicalReplacements.entries) {
      processed = processed.replaceAll(
        RegExp(entry.key, caseSensitive: false),
        entry.value,
      );
    }

    // Capitalize first letter of sentences
    processed = processed.replaceAllMapped(
      RegExp(r'(?:^|[.!?]\s+)([a-z])'),
      (match) => match.group(0)!.toUpperCase(),
    );

    return processed.trim();
  }

  /// Quick medical phrases for TTS feedback
  Future<void> speakConfirmation(String action) async {
    final confirmations = {
      'start': 'Starting dictation',
      'stop': 'Dictation stopped',
      'save': 'Note saved',
      'clear': 'Text cleared',
      'error': 'Sorry, there was an error',
    };
    
    final text = confirmations[action] ?? 'Command executed';
    await speak(text);
  }

  /// Dispose resources
  void dispose() {
    _transcriptionController.close();
    _listeningController.close();
    _speakingController.close();
    _speechToText.cancel();
    _flutterTts.stop();
  }
}
