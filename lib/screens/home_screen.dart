import 'package:flutter/material.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';
import 'package:sport_skill_improvement_app/widgets/daily_streak_card.dart';
import 'package:sport_skill_improvement_app/widgets/recent_sport_card.dart';
import 'package:sport_skill_improvement_app/widgets/sport_category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const ExploreContent(),
    const ProfileContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

/// Home tab content
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              
              // App header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sport Skills',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {
                      // TODO: Show notifications
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Welcome message
              Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Continue your training journey',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.stoneGray,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Daily streak card
              const DailyStreakCard(
                streakCount: 7,
                goalComplete: 2,
                goalTotal: 3,
              ),
              
              const SizedBox(height: 32),
              
              // Continue learning section
              Text(
                'Continue Learning',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Recent sports horizontal list
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    RecentSportCard(
                      sportName: 'Basketball',
                      progress: 0.65,
                      iconData: Icons.sports_basketball,
                      backgroundColor: Color(0xFFFFCCCC),
                    ),
                    SizedBox(width: 16),
                    RecentSportCard(
                      sportName: 'Tennis',
                      progress: 0.25,
                      iconData: Icons.sports_tennis,
                      backgroundColor: Color(0xFFCCFFCC),
                    ),
                    SizedBox(width: 16),
                    RecentSportCard(
                      sportName: 'Swimming',
                      progress: 0.40,
                      iconData: Icons.pool,
                      backgroundColor: Color(0xFFCCCCFF),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Discover new skills section
              Text(
                'Discover New Skills',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Sport categories grid
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: const [
                  SportCategoryCard(
                    categoryName: 'Team Sports',
                    iconData: Icons.group,
                  ),
                  SportCategoryCard(
                    categoryName: 'Individual',
                    iconData: Icons.person,
                  ),
                  SportCategoryCard(
                    categoryName: 'Racket',
                    iconData: Icons.sports_tennis,
                  ),
                  SportCategoryCard(
                    categoryName: 'Water',
                    iconData: Icons.water,
                  ),
                  SportCategoryCard(
                    categoryName: 'Fitness',
                    iconData: Icons.fitness_center,
                  ),
                  SportCategoryCard(
                    categoryName: 'Running',
                    iconData: Icons.directions_run,
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// Explore tab content - placeholder for now
class ExploreContent extends StatelessWidget {
  const ExploreContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.explore,
            size: 80,
            color: AppColors.fludoGreen,
          ),
          const SizedBox(height: 16),
          Text(
            'Explore Sports',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Find new sports and skills to learn',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

/// Profile tab content - placeholder for now
class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.lightGray,
            child: Icon(
              Icons.person,
              size: 60,
              color: AppColors.stoneGray,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Your Profile',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Track your progress and achievements',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
