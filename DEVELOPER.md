# Developer Guide for Sport Skill Improvement App

This document contains technical information for developers working on the Sport Skill Improvement App.

## Project Structure

```
lib/
├── main.dart             # App entry point
├── screens/              # App screens
│   ├── home_screen.dart
│   ├── onboarding_screen.dart
│   ├── sport_detail_screen.dart
│   └── tutorial_screen.dart
├── theme/                # Styling configuration
│   ├── app_colors.dart
│   └── app_theme.dart
├── widgets/              # Reusable UI components
│   ├── daily_streak_card.dart
│   ├── recent_sport_card.dart
│   ├── skill_module_card.dart
│   └── sport_category_card.dart
├── models/               # Data models (to be added)
├── services/             # Backend services (to be added)
└── utils/                # Helper functions (to be added)
```

## Color Palette

The app uses a consistent color palette defined in `lib/theme/app_colors.dart`:

- **Fludo Green (#c4ff58)** - Primary accent color
- **Dark Gray (#3f3f3f)** - Secondary text and UI
- **Light Gray (#dddddd)** - Backgrounds and cards
- **Alert Red (#fe5344)** - Notifications and errors
- **Dark Charcoal (#272925)** - Alert backgrounds
- **Sage Gray (#5c6057)** - Secondary alert elements
- **Carbon Black (#101010)** - Primary text
- **Stone Gray (#797872)** - Disabled state
- **Light Beige (#cdc9b9)** - Background variations

## Setup Instructions

1. Ensure you have Flutter installed on your development machine
   ```
   flutter --version
   ```

2. Clone the repository
   ```
   git clone https://github.com/Viktoria0912/sport-skill-improvement-app.git
   ```

3. Install dependencies
   ```
   cd sport-skill-improvement-app
   flutter pub get
   ```

4. Run the app
   ```
   flutter run
   ```

## Development Workflow

### Adding New Screens

1. Create a new Dart file in the `lib/screens` directory
2. Use existing screens as templates for consistency
3. Add navigation to the new screen where appropriate

### Adding New Widgets

1. Create a new Dart file in the `lib/widgets` directory
2. Follow the pattern of existing widgets for props and styling
3. Keep widgets focused on a single responsibility

### Firebase Integration

Firebase integration is currently disabled for initial development. To enable it:

1. Update `useFirebase` flag in `lib/main.dart` to `true`
2. Configure Firebase using the Firebase CLI and FlutterFire
3. Create the necessary Firebase configuration files

## Planned Features

### Phase 1 (Current)
- Basic UI implementation
- Navigation flow
- Theming and styling

### Phase 2
- User Authentication
- Firebase Integration
- Data Models
- Content Storage

### Phase 3
- Video Playback
- Progress Tracking
- Gamification Elements
- Social Features

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Flutter Documentation](https://firebase.flutter.dev/docs/overview/)
- [Material Design Guidelines](https://material.io/design)
