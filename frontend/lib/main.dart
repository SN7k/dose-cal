import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ======== PROVIDERS ========
import 'providers/app_providers.dart';

// ======== SCREENS ========
import 'screens/auth/screens/login_screen.dart';
import 'screens/auth/screens/registration_screen.dart';
import 'screens/auth/screens/verification_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';

import 'screens/dashboard_screen.dart';
import 'screens/add_patient_screen.dart';
import 'screens/patient_list_screen.dart';
import 'screens/patient_detail_screen.dart';
import 'screens/discharge_summary_screen.dart';

import 'screens/dose_calculator.dart';
import 'screens/fluids_calculator.dart';
import 'screens/blood_calculator.dart';
import 'screens/growth_calculator.dart';
import 'screens/tpn_calculator.dart';

import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/app_info_screen.dart';
import 'screens/support_screen.dart';
import 'screens/error_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: DoseCalApp()));
}

class DoseCalApp extends ConsumerWidget {
  const DoseCalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0B1220),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF5B6BE1),
        secondary: Color(0xFF38BDF8),
        surface: Color(0xFF0B1220),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0B1220),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF161B29),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white38),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B6BE1),
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF5B6BE1)),
          foregroundColor: const Color(0xFF5B6BE1),
          minimumSize: const Size.fromHeight(48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xFF161B29),
        contentTextStyle: TextStyle(color: Colors.white),
        behavior: SnackBarBehavior.floating,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dose-Cal',
      theme: theme,
      home: const AuthGate(),
      routes: {
        '/onboarding': (_) => const OnboardingScreen(),
        '/signin': (_) => const LoginScreen(),
        '/login': (_) => const LoginScreen(),
        '/splash': (_) => const SplashScreen(),
        '/register': (_) => const RegistrationScreen(),

        // OTP reads phone number from Navigator arguments (optional)
        '/otp': (ctx) {
          final phone = ModalRoute.of(ctx)!.settings.arguments as String?;
          return VerificationScreen(phone: phone);
        },
        '/verification': (ctx) {
          final phone = ModalRoute.of(ctx)!.settings.arguments as String?;
          return VerificationScreen(phone: phone);
        },

        '/dashboard': (_) => const DashboardScreen(),
        '/add_patient': (_) => const AddPatientScreen(),
        '/patients': (_) => const PatientListScreen(),

        // Pass patientId when navigating:
        // Navigator.pushNamed(context, '/patient_detail', arguments: 'ID123');
        '/patient_detail': (ctx) {
          final id = ModalRoute.of(ctx)!.settings.arguments as String;
          return PatientDetailScreen(patientId: id);
        },

        '/discharge': (_) => const DischargeSummaryScreen(),
        '/dose_calc': (_) => const DoseCalculatorScreen(),
        '/fluids_calc': (_) => const FluidsCalculatorScreen(),
        '/blood_calc': (_) => const BloodCalculatorScreen(),
        '/growth_calc': (_) => const GrowthCalculatorScreen(),
        '/tpn_calc': (_) => const TpnCalculatorScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/settings': (_) => const SettingsScreen(),
        '/appinfo': (_) => const AppInfoScreen(),
        '/support': (_) => const SupportScreen(),
      },
      onUnknownRoute: (_) =>
          MaterialPageRoute(builder: (_) => const ErrorScreen()),
    );
  }
}

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch providers for authentication and onboarding status
    final isLoggedInAsync = ref.watch(isLoggedInProvider);
    final settingsNotifier = ref.watch(settingsProvider.notifier);

    return FutureBuilder<String?>(
      future: settingsNotifier.getSetting('onboarding_complete'),
      builder: (context, onboardingSnapshot) {
        if (onboardingSnapshot.connectionState == ConnectionState.waiting) {
          return const _LoadingScreen();
        }

        final onboardingComplete = onboardingSnapshot.data == 'true';

        if (!onboardingComplete) {
          return const OnboardingScreen();
        }

        // Check login status
        return isLoggedInAsync.when(
          data: (isLoggedIn) {
            if (isLoggedIn) {
              return const DashboardScreen();
            } else {
              return const LoginScreen();
            }
          },
          loading: () => const _LoadingScreen(),
          error: (error, stackTrace) {
            // On error, go to login
            return const LoginScreen();
          },
        );
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0B1220),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Color(0xFF5B6BE1),
            ),
            SizedBox(height: 24),
            Text(
              'DoseCal',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B6BE1),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Hospital Workspace',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
