import 'package:flutter/material.dart';
import 'package:youtube/features/presentations/widgets/theme/app_colors.dart';

class AppTheme {
  static final lightMode = ThemeData(
    highlightColor: Colors.transparent,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLightMode,
    brightness: Brightness.light,
  );
  static final darkMode = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDarkMode,
    brightness: Brightness.dark,
  );
}
