import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness:  Brightness.light,
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor:  Colors.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor
      ),
      inputDecorationTheme: _getInputDecorationTheme(),

    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.themeColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: AppColors.themeColor
        ),
      inputDecorationTheme: _getInputDecorationTheme(),

    );
  }
  static InputDecorationTheme _getInputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor, width: 2)),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
}
