import 'package:flutter/material.dart';
import 'package:sport_skill_improvement_app/theme/app_colors.dart';

class TutorialScreen extends StatefulWidget {
  final String sportName;
  final String skillName;
  final Color backgroundColor;

  const TutorialScreen({
    super.key,
    required this.sportName,
    required this.skillName,
    required this.backgroundColor,
  });

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _currentStep = 0;
  final int _totalSteps = 4;

  final List<TutorialStep> steps = [
    TutorialStep(
      title: "Position your feet",
      description: "Stand with your feet shoulder-width apart for a stable base.",
      isComplete: true,
    ),
    TutorialStep(
      title: "Hold the ball correctly",
      description: "Place your shooting hand behind the ball with fingers spread, support with other hand.",
      isComplete: true,
    ),
    TutorialStep(
      title: "Prepare your shot",
      description: "Bend your knees and prepare for an upward motion.",
      isComplete: false,
    ),
    TutorialStep(
      title: "Follow through",
      description: "Extend your arm and snap your wrist forward, hold the follow-through position.",
      isComplete: false,
    ),
  ];

  void _goToNextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Show completion dialog
      _showCompletionDialog();
    }
  }

  void _goToPreviousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.celebration,
              color: AppColors.fludoGreen,
            ),
            const SizedBox(width: 8),
            const Text('Congratulations!'),
          ],
        ),
        content: const Text(
          'You have completed this tutorial. Keep practicing to master this skill!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Return to sport detail screen
            },
            child: const Text('Back to Skills'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.skillName),
        backgroundColor: widget.backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Video placeholder
          Container(
            height: 200,
            color: Colors.black,
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 60,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),

          // Tutorial title and steps
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    steps[_currentStep].title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Steps list
                  Expanded(
                    child: ListView.builder(
                      itemCount: steps.length,
                      itemBuilder: (context, index) {
                        final step = steps[index];
                        final bool isActive = index == _currentStep;
                        final bool isCompleted = index < _currentStep || step.isComplete;
                        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Step number indicator
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isCompleted 
                                      ? AppColors.fludoGreen 
                                      : (isActive ? widget.backgroundColor : AppColors.lightGray),
                                ),
                                child: Center(
                                  child: isCompleted
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      : Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: isActive ? Colors.white : AppColors.stoneGray,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                              
                              const SizedBox(width: 12),
                              
                              // Step content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      step.title,
                                      style: TextStyle(
                                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                                        color: isActive 
                                            ? AppColors.carbonBlack 
                                            : (isCompleted ? AppColors.carbonBlack : AppColors.stoneGray),
                                      ),
                                    ),
                                    if (isActive)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          step.description,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  
                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous button
                      _currentStep > 0
                          ? OutlinedButton(
                              onPressed: _goToPreviousStep,
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(100, 50),
                              ),
                              child: const Text('Previous'),
                            )
                          : const SizedBox(width: 100),
                      
                      // Progress indicator
                      Text(
                        'Step ${_currentStep + 1} of $_totalSteps',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      
                      // Next button
                      ElevatedButton(
                        onPressed: _goToNextStep,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          backgroundColor: AppColors.fludoGreen,
                        ),
                        child: Text(
                          _currentStep < _totalSteps - 1 ? 'Next' : 'Complete',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TutorialStep {
  final String title;
  final String description;
  final bool isComplete;

  TutorialStep({
    required this.title,
    required this.description,
    required this.isComplete,
  });
}
