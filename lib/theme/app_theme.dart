import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App theme configuration
class AppTheme {
  /// Get the light theme for the app
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.fludoGreen,
        onPrimary: AppColors.carbonBlack,
        secondary: AppColors.darkGray,
        onSecondary: AppColors.lightGray,
        error: AppColors.alertRed,
        onError: Colors.white,
        background: AppColors.lightBeige,
        onBackground: AppColors.carbonBlack,
        surface: AppColors.lightGray,
        onSurface: AppColors.carbonBlack,
      ),
      scaffoldBackgroundColor: AppColors.lightBeige,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBeige,
        foregroundColor: AppColors.carbonBlack,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.fludoGreen,
          foregroundColor: AppColors.carbonBlack,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkGray,
          side: const BorderSide(color: AppColors.darkGray, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkGray,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.lightGray,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.stoneGray, width: 0.5),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.fludoGreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.alertRed, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: AppColors.darkGray,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: AppColors.carbonBlack,
        ),
        bodyMedium: TextStyle(
          color: AppColors.carbonBlack,
        ),
        bodySmall: TextStyle(
          color: AppColors.stoneGray,
        ),
        labelLarge: TextStyle(
          color: AppColors.carbonBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightGray,
        thickness: 1,
        space: 24,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.fludoGreen,
        foregroundColor: AppColors.carbonBlack,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightGray,
        selectedItemColor: AppColors.fludoGreen,
        unselectedItemColor: AppColors.stoneGray,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.fludoGreen,
        unselectedLabelColor: AppColors.stoneGray,
        indicatorColor: AppColors.fludoGreen,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.fludoGreen,
        linearTrackColor: AppColors.lightGray,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkCharcoal,
        contentTextStyle: const TextStyle(color: AppColors.lightGray),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      fontFamily: 'Roboto',
    );
  }

  /// Get the dark theme for the app
  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.fludoGreen,
        onPrimary: AppColors.carbonBlack,
        secondary: AppColors.lightGray,
        onSecondary: AppColors.carbonBlack,
        error: AppColors.alertRed,
        onError: Colors.white,
        background: AppColors.carbonBlack,
        onBackground: AppColors.lightGray,
        surface: AppColors.darkGray,
        onSurface: AppColors.lightGray,
      ),
      scaffoldBackgroundColor: AppColors.carbonBlack,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.carbonBlack,
        foregroundColor: AppColors.lightGray,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.fludoGreen,
          foregroundColor: AppColors.carbonBlack,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightGray,
          side: const BorderSide(color: AppColors.lightGray, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.lightGray,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.darkGray,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.stoneGray, width: 0.5),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.fludoGreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.alertRed, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: AppColors.lightBeige,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: AppColors.lightGray,
        ),
        bodyMedium: TextStyle(
          color: AppColors.lightGray,
        ),
        bodySmall: TextStyle(
          color: AppColors.stoneGray,
        ),
        labelLarge: TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.stoneGray,
        thickness: 1,
        space: 24,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.fludoGreen,
        foregroundColor: AppColors.carbonBlack,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGray,
        selectedItemColor: AppColors.fludoGreen,
        unselectedItemColor: AppColors.stoneGray,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: AppColors.fludoGreen,
        unselectedLabelColor: AppColors.stoneGray,
        indicatorColor: AppColors.fludoGreen,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.fludoGreen,
        linearTrackColor: AppColors.darkGray,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkCharcoal,
        contentTextStyle: const TextStyle(color: AppColors.lightGray),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      fontFamily: 'Roboto',
    );
  }
}
