import 'package:flutter/material.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';

class SkillModuleCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final int exerciseCount;
  final bool isLocked;
  final VoidCallback onTap;

  const SkillModuleCard({
    super.key,
    required this.title,
    required this.description,
    required this.progress,
    required this.exerciseCount,
    required this.isLocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Determine status based on progress and lock state
    String statusText;
    Color statusColor;
    IconData statusIcon;
    
    if (isLocked) {
      statusText = 'Locked';
      statusColor = AppColors.stoneGray;
      statusIcon = Icons.lock;
    } else if (progress >= 1.0) {
      statusText = 'Completed';
      statusColor = AppColors.fludoGreen;
      statusIcon = Icons.check_circle;
    } else if (progress > 0) {
      statusText = 'In Progress';
      statusColor = Colors.orange;
      statusIcon = Icons.sync;
    } else {
      statusText = 'Not Started';
      statusColor = AppColors.stoneGray;
      statusIcon = Icons.circle_outlined;
    }

    final int progressPercent = (progress * 100).round();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: AppColors.lightGray,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Status icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                  size: 24,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Module info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isLocked ? AppColors.stoneGray : AppColors.carbonBlack,
                      ),
                    ),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isLocked ? AppColors.stoneGray : null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Progress text
                    Text(
                      isLocked 
                          ? 'Complete previous modules to unlock' 
                          : '$exerciseCount exercises • ${progressPercent}% complete',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isLocked ? AppColors.stoneGray : null,
                      ),
                    ),
                    
                    // Progress bar for unlocked modules
                    if (!isLocked) ...[
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: AppColors.lightGray,
                          color: statusColor,
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
