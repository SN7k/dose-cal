import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../data/data_repository.dart';
import '../data/local_db.dart';

class BackgroundSyncService {
  static final BackgroundSyncService _instance = BackgroundSyncService._internal();
  factory BackgroundSyncService() => _instance;
  BackgroundSyncService._internal();

  final Dio _dio = Dio();
  Timer? _syncTimer;
  bool _isSyncing = false;
  bool _isInitialized = false;
  String? _authToken;

  // Sync configuration
  static const Duration _syncInterval = Duration(minutes: 5);

  // Sync status streams
  final StreamController<SyncStatus> _syncStatusController = 
      StreamController<SyncStatus>.broadcast();
  final StreamController<SyncProgress> _syncProgressController = 
      StreamController<SyncProgress>.broadcast();

  Stream<SyncStatus> get syncStatusStream => _syncStatusController.stream;
  Stream<SyncProgress> get syncProgressStream => _syncProgressController.stream;

  bool get isInitialized => _isInitialized;
  bool get isSyncing => _isSyncing;

  /// Initialize the sync service
  Future<void> initialize({
    required String baseUrl,
    String? authToken,
  }) async {
    _authToken = authToken;
    
    // Configure Dio
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 30);
    
    // Add auth interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (_authToken != null) {
          options.headers['Authorization'] = 'Bearer $_authToken';
        }
        options.headers['Content-Type'] = 'application/json';
        handler.next(options);
      },
      onError: (error, handler) {
        debugPrint('Sync API Error: ${error.message}');
        handler.next(error);
      },
    ));

    _isInitialized = true;
    
    // Start periodic sync
    startPeriodicSync();
  }

  /// Start periodic background sync
  void startPeriodicSync() {
    if (_syncTimer?.isActive == true) return;
    
    _syncTimer = Timer.periodic(_syncInterval, (_) {
      if (!_isSyncing) {
        _performSync();
      }
    });
    
    // Perform initial sync
    _performSync();
  }

  /// Stop periodic sync
  void stopPeriodicSync() {
    _syncTimer?.cancel();
    _syncTimer = null;
  }

  /// Perform manual sync
  Future<bool> performManualSync() async {
    if (!_isInitialized) {
      throw Exception('Sync service not initialized');
    }
    
    return await _performSync();
  }

  /// Update authentication token
  void updateAuthToken(String token) {
    _authToken = token;
  }

  /// Internal sync method
  Future<bool> _performSync() async {
    if (_isSyncing) return false;
    
    _isSyncing = true;
    _syncStatusController.add(SyncStatus.syncing);
    
    try {
      final repository = DataRepository.instance;
      final pendingItems = await repository.getPendingSyncItems();
      
      if (pendingItems.isEmpty) {
        _syncStatusController.add(SyncStatus.upToDate);
        return true;
      }

      debugPrint('Starting sync of ${pendingItems.length} items');
      
      int completed = 0;
      int failed = 0;
      
      for (final item in pendingItems) {
        _syncProgressController.add(SyncProgress(
          current: completed + failed + 1,
          total: pendingItems.length,
          currentItem: item.endpoint,
        ));
        
        try {
          final success = await _syncItem(item);
          if (success) {
            await repository.markSyncItemCompleted(item.id);
            completed++;
          } else {
            await repository.incrementSyncAttempts(item.id, 'Sync failed');
            failed++;
          }
        } catch (e) {
          await repository.incrementSyncAttempts(item.id, e.toString());
          failed++;
        }
        
        // Small delay between requests to avoid overwhelming server
        await Future.delayed(const Duration(milliseconds: 100));
      }
      
      debugPrint('Sync completed: $completed successful, $failed failed');
      
      if (failed == 0) {
        _syncStatusController.add(SyncStatus.upToDate);
      } else {
        _syncStatusController.add(SyncStatus.error);
      }
      
      return failed == 0;
      
    } catch (e) {
      debugPrint('Sync error: $e');
      _syncStatusController.add(SyncStatus.error);
      return false;
    } finally {
      _isSyncing = false;
    }
  }

  /// Sync individual item
  Future<bool> _syncItem(SyncQueueData item) async {
    try {
      // Check network connectivity
      if (!await _hasNetworkConnection()) {
        return false;
      }

      final payload = jsonDecode(item.payloadJson);
      
      Response response;
      switch ('POST') { // Default to POST for now
        case 'GET':
          response = await _dio.get(item.endpoint);
          break;
        case 'POST':
          response = await _dio.post(item.endpoint, data: payload);
          break;
        case 'PUT':
          response = await _dio.put(item.endpoint, data: payload);
          break;
        case 'PATCH':
          response = await _dio.patch(item.endpoint, data: payload);
          break;
        case 'DELETE':
          response = await _dio.delete(item.endpoint);
          break;
        default:
          response = await _dio.post(item.endpoint, data: payload);
      }
      
      return response.statusCode != null && 
             response.statusCode! >= 200 && 
             response.statusCode! < 300;
      
    } catch (e) {
      debugPrint('Failed to sync item ${item.id}: $e');
      return false;
    }
  }

  /// Check network connectivity
  Future<bool> _hasNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Download and sync data from server
  Future<bool> downloadServerData() async {
    if (!_isInitialized) return false;
    
    try {
      _syncStatusController.add(SyncStatus.syncing);
      
      // Download hospitals data
      final hospitalsResponse = await _dio.get('/v1/hospitals');
      if (hospitalsResponse.statusCode == 200) {
        // TODO: Process and store hospitals data
      }
      
      // Download users data
      final usersResponse = await _dio.get('/v1/users');
      if (usersResponse.statusCode == 200) {
        // TODO: Process and store users data
      }
      
      // Download patients data
      final patientsResponse = await _dio.get('/v1/patients');
      if (patientsResponse.statusCode == 200) {
        // TODO: Process and store patients data
      }
      
      // Download case sheets data
      final casesResponse = await _dio.get('/v1/cases');
      if (casesResponse.statusCode == 200) {
        // TODO: Process and store case sheets data
      }
      
      _syncStatusController.add(SyncStatus.upToDate);
      return true;
      
    } catch (e) {
      debugPrint('Download error: $e');
      _syncStatusController.add(SyncStatus.error);
      return false;
    }
  }

  /// Handle sync conflicts
  Future<ConflictResolution> resolveConflict({
    required String entityType,
    required String entityId,
    required Map<String, dynamic> localData,
    required Map<String, dynamic> serverData,
  }) async {
    // For now, implement simple last-write-wins
    // In production, this would involve user interaction or sophisticated merging
    
    final localTimestamp = DateTime.tryParse(localData['updated_at'] ?? '');
    final serverTimestamp = DateTime.tryParse(serverData['updated_at'] ?? '');
    
    if (localTimestamp == null || serverTimestamp == null) {
      return ConflictResolution.useServer;
    }
    
    if (localTimestamp.isAfter(serverTimestamp)) {
      return ConflictResolution.useLocal;
    } else {
      return ConflictResolution.useServer;
    }
  }

  /// Clean up completed sync items older than specified duration
  Future<void> cleanupOldSyncItems([Duration age = const Duration(days: 7)]) async {
    // TODO: Implement cleanup logic
  }

  /// Get sync statistics
  Future<SyncStatistics> getSyncStatistics() async {
    final repository = DataRepository.instance;
    final pendingItems = await repository.getPendingSyncItems();
    
    return SyncStatistics(
      pendingItems: pendingItems.length,
      lastSyncTime: DateTime.now(), // TODO: Store actual last sync time
      isOnline: await _hasNetworkConnection(),
    );
  }

  /// Dispose resources
  void dispose() {
    stopPeriodicSync();
    _syncStatusController.close();
    _syncProgressController.close();
    _dio.close();
  }
}

enum SyncStatus {
  idle,
  syncing,
  upToDate,
  error,
  offline,
}

enum ConflictResolution {
  useLocal,
  useServer,
  merge,
  askUser,
}

class SyncProgress {
  final int current;
  final int total;
  final String currentItem;

  SyncProgress({
    required this.current,
    required this.total,
    required this.currentItem,
  });

  double get percentage => total > 0 ? (current / total) * 100 : 0.0;
}

class SyncStatistics {
  final int pendingItems;
  final DateTime lastSyncTime;
  final bool isOnline;

  SyncStatistics({
    required this.pendingItems,
    required this.lastSyncTime,
    required this.isOnline,
  });
}
