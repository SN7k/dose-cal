import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyUserEmail = 'userEmail';
  static const String _keyUserRole = 'userRole';
  static const String _keyLoginTime = 'loginTime';
  static const String _keyUserName = 'userName';
  static const String _keyOnboardingComplete = 'onboardingComplete';

  // Check if onboarding is complete
  static Future<bool> isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyOnboardingComplete) ?? false;
  }

  // Mark onboarding as complete
  static Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboardingComplete, true);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Get current user data
  static Future<Map<String, String?>> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString(_keyUserEmail),
      'role': prefs.getString(_keyUserRole),
      'name': prefs.getString(_keyUserName),
      'loginTime': prefs.getString(_keyLoginTime),
    };
  }

  // Sign in user
  static Future<bool> signIn({
    required String email,
    required String password,
    String? name,
    String? role,
  }) async {
    try {
      // TODO: Replace with actual API call to your backend
      // For now, simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Simulate successful login for demo purposes
      // In production, validate with backend
      if (email.isNotEmpty && password.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_keyIsLoggedIn, true);
        await prefs.setString(_keyUserEmail, email);
        await prefs.setString(_keyUserRole, role ?? 'doctor');
        await prefs.setString(_keyUserName, name ?? 'Dr. User');
        await prefs.setString(_keyLoginTime, DateTime.now().toIso8601String());
        
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Sign out user
  static Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyIsLoggedIn);
    await prefs.remove(_keyUserEmail);
    await prefs.remove(_keyUserRole);
    await prefs.remove(_keyUserName);
    await prefs.remove(_keyLoginTime);
    
    // Clear any other cached data
    await prefs.remove('registrationData');
  }

  // Check if registration is complete
  static Future<bool> isRegistrationComplete() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final mobile = prefs.getString('mobile');
    
    return name != null && email != null && mobile != null;
  }

  // Get user role
  static Future<String> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserRole) ?? 'doctor';
  }

  // Update user profile
  static Future<void> updateUserProfile({
    String? name,
    String? role,
    String? email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (name != null) await prefs.setString(_keyUserName, name);
    if (role != null) await prefs.setString(_keyUserRole, role);
    if (email != null) await prefs.setString(_keyUserEmail, email);
  }

  // Session management
  static Future<bool> isSessionValid() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(_keyIsLoggedIn) ?? false;
    final loginTimeStr = prefs.getString(_keyLoginTime);
    
    if (!isLoggedIn || loginTimeStr == null) return false;
    
    try {
      final loginTime = DateTime.parse(loginTimeStr);
      final now = DateTime.now();
      final difference = now.difference(loginTime);
      
      // Session expires after 24 hours
      return difference.inHours < 24;
    } catch (e) {
      return false;
    }
  }

  // Refresh session
  static Future<void> refreshSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLoginTime, DateTime.now().toIso8601String());
  }
}
