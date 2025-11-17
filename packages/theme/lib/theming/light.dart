import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/theming/colors/light_colors.dart';

import 'app_typo_graphy.dart';

class LightTheme{

  LightTheme._();

  static ThemeData getLightTheme(){

   final theme =  ThemeData(
      useMaterial3: true,
     scaffoldBackgroundColor: LightColors.background,
brightness: Brightness.light,
     appBarTheme: AppBarTheme(
       backgroundColor: LightColors.cardColor,
       centerTitle: true,
       elevation: 2,
     ),
     cardTheme: CardThemeData(
       color: LightColors.cardColor,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(16)
       )
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style:ElevatedButton.styleFrom(
         backgroundColor: LightColors.blow,
         padding: EdgeInsets.symmetric(
           vertical: 12,
           horizontal: 24
         ),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8)
         )
       )
     ),
     textTheme:  TextTheme(
     headlineLarge: AppTypography.titleLarge(LightColors.fontColor),
     headlineMedium: AppTypography.titleMedium(LightColors.fontColor),
     headlineSmall: AppTypography.titleSmall(LightColors.fontColor),
     bodyLarge: AppTypography.bodyLarge(LightColors.fontColor),
     bodyMedium: AppTypography.bodyMedium(LightColors.fontColor),
     bodySmall: AppTypography.bodySmall(LightColors.fontColor),
     labelSmall: AppTypography.caption(LightColors.fontColor),
   ),
     inputDecorationTheme: InputDecorationTheme(
       hintStyle: AppTypography.bodyMedium(LightColors.fontColor),
       labelStyle: AppTypography.bodyMedium(LightColors.fontColor),
       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: LightColors.gray),
       ),
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: LightColors.gray),
       ),
       focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: LightColors.blow),
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