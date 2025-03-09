import 'package:flutter/material.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';

class DailyStreakCard extends StatelessWidget {
  final int streakCount;
  final int goalComplete;
  final int goalTotal;

  const DailyStreakCard({
    super.key,
    required this.streakCount,
    required this.goalComplete,
    required this.goalTotal,
  });

  @override
  Widget build(BuildContext context) {
    final double goalProgress = goalTotal > 0 ? goalComplete / goalTotal : 0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9C4), // Light yellow background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFFD54F), // Darker yellow border
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Streak circle
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFD54F),
                border: Border.all(
                  color: const Color(0xFFFB8C00),
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    streakCount.toString(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.carbonBlack,
                    ),
                  ),
                  Text(
                    'DAYS',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 8,
                      color: AppColors.carbonBlack,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Streak info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Streak!',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Keep practicing daily to maintain your streak',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  
                  // Goal progress
                  Row(
                    children: [
                      Text(
                        'Today\'s Goals: $goalComplete/$goalTotal',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: goalProgress,
                      backgroundColor: AppColors.lightGray,
                      color: AppColors.fludoGreen,
                      minHeight: 8,
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
}
