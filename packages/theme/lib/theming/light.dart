import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/theming/colors/light_colors.dart';
import 'package:theme/theming/custom_theme_extension.dart';

import 'app_typo_graphy.dart';
import 'colors/app_colors.dart';

class LightTheme {
  LightTheme._();

  static ThemeData getLightTheme() {
    final theme = ThemeData(
      useMaterial3: true,
      extensions: [CustomDialogTheme.light()],
      scaffoldBackgroundColor: AppColors.backgroundColor,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whit,
        titleTextStyle: AppTypography.titleSmall(AppColors.textPrimary),
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 2,
      ),
      cardTheme: CardThemeData(
        color: AppColors.whit,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: AppTypography.titleLarge(LightColors.fontColor),
        titleMedium: AppTypography.titleMedium(LightColors.fontColor),
        titleSmall: AppTypography.titleSmall(LightColors.fontColor),
        bodyLarge: AppTypography.bodyLarge(LightColors.fontColor),
        bodyMedium: AppTypography.bodyMedium(LightColors.fontColor),
        bodySmall: AppTypography.bodySmall(AppColors.gry600),
        labelSmall: AppTypography.caption(LightColors.fontColor),
        headlineSmall: AppTypography.headlineSmall(AppColors.textPrimary),
        labelLarge: AppTypography.labelLarge(AppColors.gry600)
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTypography.bodyMedium(AppColors.gry400),
        labelStyle: AppTypography.bodyMedium(LightColors.fontColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gry400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gry400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.buttonBackground),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: LightColors.read),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: LightColors.cardColor,
        selectedItemColor: LightColors.blow,
        unselectedItemColor: LightColors.gray,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 20),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );

    return theme;
  }
}
