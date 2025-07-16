import 'package:flutter/material.dart';
import 'package:ynba/core/colors/colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primaryDark,
      fontFamily: 'Roboto',

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryLight,
        primary: AppColors.primaryDark,
        secondary: AppColors.primaryLight,
        background: AppColors.background,
        brightness: Brightness.light,
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16.0, color: AppColors.textPrimary),
        bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.textSecondary),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 16),
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryDark,
        ),
      ),
    );
  }
}
