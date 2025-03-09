import 'package:flutter/material.dart';
import 'package:sport_skill_improvement_app/screens/tutorial_screen.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';
import 'package:sport_skill_improvement_app/widgets/skill_module_card.dart';

class SportDetailScreen extends StatelessWidget {
  final String sportName;
  final IconData iconData;
  final Color backgroundColor;
  final double progress;

  const SportDetailScreen({
    super.key,
    required this.sportName,
    required this.iconData,
    required this.backgroundColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final int progressPercent = (progress * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: Text(sportName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sport header with icon and progress
            Container(
              height: 120,
              color: backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Sport icon
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        iconData,
                        size: 36,
                        color: backgroundColor,
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // Sport info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            sportName,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Fundamentals & Skills',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 8),
                          
                          // Progress bar
                          Stack(
                            children: [
                              // Background
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              
                              // Progress
                              FractionallySizedBox(
                                widthFactor: progress,
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColors.fludoGreen,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Progress text
                    Text(
                      '$progressPercent%',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Skill modules section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skill Modules',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // First module (completed)
                  SkillModuleCard(
                    title: 'Dribbling Basics',
                    description: 'Master control of the ball',
                    progress: 1.0,
                    exerciseCount: 6,
                    isLocked: false,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TutorialScreen(
                            sportName: sportName,
                            skillName: 'Dribbling Basics',
                            backgroundColor: backgroundColor,
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Second module (in progress)
                  SkillModuleCard(
                    title: 'Shooting Form',
                    description: 'Perfect your shooting technique',
                    progress: 0.5,
                    exerciseCount: 8,
                    isLocked: false,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TutorialScreen(
                            sportName: sportName,
                            skillName: 'Shooting Form',
                            backgroundColor: backgroundColor,
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Third module (locked)
                  SkillModuleCard(
                    title: 'Defensive Stance',
                    description: 'Learn proper defensive positioning',
                    progress: 0,
                    exerciseCount: 5,
                    isLocked: true,
                    onTap: () {
                      // Show locked message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Complete the previous skill modules to unlock this one!',
                          ),
                          backgroundColor: AppColors.darkCharcoal,
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Fourth module (locked)
                  SkillModuleCard(
                    title: 'Passing Techniques',
                    description: 'Essential passes for team play',
                    progress: 0,
                    exerciseCount: 7,
                    isLocked: true,
                    onTap: () {
                      // Show locked message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Complete the previous skill modules to unlock this one!',
                          ),
                          backgroundColor: AppColors.darkCharcoal,
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Fifth module (locked)
                  SkillModuleCard(
                    title: 'Advanced Moves',
                    description: 'Take your skills to the next level',
                    progress: 0,
                    exerciseCount: 9,
                    isLocked: true,
                    onTap: () {
                      // Show locked message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Complete the previous skill modules to unlock this one!',
                          ),
                          backgroundColor: AppColors.darkCharcoal,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            // Achievements section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achievements',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Achievements row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // First achievement
                      _buildAchievementBadge(
                        context,
                        title: 'Beginner',
                        iconData: Icons.star,
                        isUnlocked: true,
                        color: Colors.amber,
                      ),
                      
                      // Second achievement
                      _buildAchievementBadge(
                        context,
                        title: 'Consistent',
                        iconData: Icons.calendar_today,
                        isUnlocked: true,
                        color: Colors.green,
                      ),
                      
                      // Third achievement
                      _buildAchievementBadge(
                        context,
                        title: 'Expert',
                        iconData: Icons.emoji_events,
                        isUnlocked: false,
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildAchievementBadge(
    BuildContext context, {
    required String title,
    required IconData iconData,
    required bool isUnlocked,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: isUnlocked ? color : AppColors.lightGray,
            shape: BoxShape.circle,
            border: Border.all(
              color: isUnlocked ? color.withOpacity(0.6) : AppColors.stoneGray,
              width: 2,
            ),
          ),
          child: Icon(
            iconData,
            size: 40,
            color: isUnlocked ? Colors.white : AppColors.stoneGray,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: isUnlocked ? FontWeight.bold : FontWeight.normal,
            color: isUnlocked ? AppColors.carbonBlack : AppColors.stoneGray,
          ),
        ),
      ],
    );
  }
}
