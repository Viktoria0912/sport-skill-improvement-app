import 'package:flutter/material.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';

class RecentSportCard extends StatelessWidget {
  final String sportName;
  final double progress;
  final IconData iconData;
  final Color backgroundColor;

  const RecentSportCard({
    super.key,
    required this.sportName,
    required this.progress,
    required this.iconData,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final int progressPercent = (progress * 100).round();

    return GestureDetector(
      onTap: () {
        // TODO: Navigate to sport detail screen
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sport icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Sport name
              Text(
                sportName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 8),
              
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.lightGray,
                  color: AppColors.fludoGreen,
                  minHeight: 8,
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Progress text
              Text(
                '$progressPercent% Complete',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
