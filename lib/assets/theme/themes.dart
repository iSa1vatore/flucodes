import 'package:flucodes/assets/theme/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light {
    final theme = ThemeData(
      brightness: Brightness.light,
    );

    return theme.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: theme.appBarTheme.copyWith(
        centerTitle: false,
        titleSpacing: 20,
        elevation: 0,
        color: AppColors.background,
        titleTextStyle: const TextStyle(
          color: AppColors.text,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        backgroundColor: AppColors.bottomNavBarBackground,
      ),
      textTheme: theme.textTheme.apply(
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
      primaryTextTheme: theme.primaryTextTheme.apply(
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
    );
  }
}
