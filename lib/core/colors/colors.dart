import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryDark = Color(0xFF42224A);
  static const Color primaryLight = Color(0xFF9D51B0);

  static const Color background = Color(0xFFF9F8FD);
  static const Color textPrimary = Colors.black87;
  static const Color white = Colors.white;
  static const Color textSecondary = Colors.black54;

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryLight, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
