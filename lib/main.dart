import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sport_skill_improvement_app/screens/home_screen.dart';
import 'package:sport_skill_improvement_app/screens/onboarding_screen.dart';
import 'package:sport_skill_improvement_app/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Flag to enable Firebase integration
// Set this to false during initial development if Firebase is not set up yet
const bool useFirebase = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Initialize Firebase if enabled
  if (useFirebase) {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      print('Failed to initialize Firebase: $e');
      // Continue with the app, but without Firebase functionality
    }
  }
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showOnboarding = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeUser();
  }

  // Check if the user has completed onboarding
  Future<void> _checkFirstTimeUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final showOnboarding = prefs.getBool('showOnboarding') ?? true;
      
      setState(() {
        _showOnboarding = showOnboarding;
        _isLoading = false;
      });
    } catch (e) {
      // If there's an error, default to showing onboarding
      setState(() {
        _showOnboarding = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport Skill Improvement',
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: _isLoading
          ? const LoadingScreen()
          : _showOnboarding
              ? const OnboardingScreen()
              : const HomeScreen(),
    );
  }
}

/// Simple loading screen shown while checking user state
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo placeholder
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.sports,
                size: 80,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Sport Skill Improvement',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
