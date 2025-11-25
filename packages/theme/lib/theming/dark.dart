import 'package:flutter/material.dart';

import 'package:theme/theming/colors/dark_colors.dart';

import 'app_typo_graphy.dart';
import 'custom_theme_extension.dart';

class DarkTheme {
  DarkTheme._();

  static ThemeData getDarkTheme() {
    final theme = ThemeData(
      useMaterial3: true,
      extensions: [CustomDialogTheme.dark()],
      scaffoldBackgroundColor: DarkColors.darkBackground,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: DarkColors.cardColorDark,
        centerTitle: true,
        elevation: 2,
      ),
      cardTheme: CardThemeData(
        color: DarkColors.cardColorDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: DarkColors.blow,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: AppTypography.titleLarge(DarkColors.fontColorDark),
        titleMedium: AppTypography.titleMedium(DarkColors.fontColorDark),
        titleSmall: AppTypography.titleSmall(DarkColors.fontColorDark),
        bodyLarge: AppTypography.bodyLarge(DarkColors.fontColorDark),
        bodyMedium: AppTypography.bodyMedium(DarkColors.fontColorDark),
        bodySmall: AppTypography.bodySmall(DarkColors.fontColorDark),
        labelSmall: AppTypography.caption(DarkColors.fontColorDark),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTypography.bodyMedium(DarkColors.fontColorDark),
        labelStyle: AppTypography.bodyMedium(DarkColors.fontColorDark),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: DarkColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: DarkColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: DarkColors.blow),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: DarkColors.read),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: DarkColors.cardColorDark,
        selectedItemColor: DarkColors.blow,
        unselectedItemColor: DarkColors.gray,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 20),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );

    return theme;
  }
}
