import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_skill_improvement_app/screens/home_screen.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 3;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "Learn Sports Skills",
      description: "Get step-by-step guidance with video tutorials to improve your technique in any sport.",
      imageName: "onboarding1", // Placeholder as image assets aren't created yet
      iconData: Icons.sports_basketball,
    ),
    OnboardingPage(
      title: "Track Your Progress",
      description: "Monitor your improvement with detailed progress tracking and achievement badges.",
      imageName: "onboarding2",
      iconData: Icons.bar_chart,
    ),
    OnboardingPage(
      title: "Stay Motivated",
      description: "Build daily streaks, compete with friends, and unlock rewards to stay consistent.",
      imageName: "onboarding3",
      iconData: Icons.emoji_events,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _completeOnboarding() async {
    // Save that the user has completed onboarding
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showOnboarding', false);
    
    if (mounted) {
      // Navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: _completeOnboarding,
                  child: const Text("Skip"),
                ),
              ),
            ),
            
            // Page content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _numPages,
                itemBuilder: (context, index) {
                  return _buildPageContent(_pages[index]);
                },
              ),
            ),
            
            // Dots indicator
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _numPages,
                  (index) => _buildDotIndicator(index),
                ),
              ),
            ),
            
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button (hidden on first page)
                  _currentPage == 0
                      ? const SizedBox(width: 85)
                      : OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(85, 50),
                          ),
                          child: const Text("Back"),
                        ),
                  
                  // Next/Get Started button
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _numPages - 1) {
                        _completeOnboarding();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                    ),
                    child: Text(
                      _currentPage == _numPages - 1 ? "Get Started" : "Next",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image placeholder
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              page.iconData,
              size: 120,
              color: AppColors.fludoGreen,
            ),
          ),
          const SizedBox(height: 40),
          
          // Title
          Text(
            page.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          // Description
          Text(
            page.description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? AppColors.fludoGreen
            : AppColors.lightGray,
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String imageName;
  final IconData iconData;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imageName,
    required this.iconData,
  });
}
