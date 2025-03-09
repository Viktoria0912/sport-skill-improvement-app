import 'package:flutter/material.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';

class SportCategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData iconData;

  const SportCategoryCard({
    super.key,
    required this.categoryName,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to category detail screen
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 30,
              color: AppColors.fludoGreen,
            ),
            const SizedBox(height: 8),
            Text(
              categoryName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
