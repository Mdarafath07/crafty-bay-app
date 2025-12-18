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
      )

    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.themeColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: AppColors.themeColor
        )

    );
  }
}
