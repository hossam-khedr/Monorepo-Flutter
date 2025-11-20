import 'package:core/constants/api_constants.dart';
import 'package:core/utils/cache_helper.dart';
import 'package:employee/base_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/routing/employee_route.dart';

class BaseCubit extends Cubit<BaseAppStats> {
  BaseCubit()
    : super(BaseAppStats(appThemeMode: AppThemeMode.system, isDarkMode: false)){
    _loadTheme();
  }

  Future<AppThemeMode> getSavedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saveTheme = prefs.getString('app_theme_mode');
      return AppThemeMode.values.firstWhere(
        (mode) => mode.name == saveTheme,
        orElse: () => AppThemeMode.system,
      );
    } catch (error) {
      return AppThemeMode.system;
    }
  }

  Future<void>saveMode(AppThemeMode mode)async{
    try{
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('app_theme_mode', mode.name);
    }catch(e){
      debugPrint('Error saving theme: $e');
    }
  }
  bool getSystemBrightness() {
    return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
  }

  Future<void>_loadTheme()async{
    final saveMode = await getSavedTheme();
    final isDark = _calculateIsDark(saveMode);
    emit(state.copyWith(appThemeMode: saveMode,isDarkMode: isDark));
  }

  Future<void>changeTheme(AppThemeMode mode)async{
final isDark = _calculateIsDark(mode);
emit(state.copyWith(isDarkMode: isDark,appThemeMode: mode));
await saveMode(mode);
  }

  void toggleTheme(){
    final newMode = state.isDarkMode?
        AppThemeMode.light
        :AppThemeMode.dark;
    changeTheme(newMode);
  }

  void updateSystemBrightness() {
    if (state.appThemeMode == AppThemeMode.system) {
      emit(state.copyWith(
        isDarkMode: getSystemBrightness(),
      ));
    }
  }

   ThemeMode toThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }


  bool _calculateIsDark(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return false;
      case AppThemeMode.dark:
        return true;
      case AppThemeMode.system:
        return getSystemBrightness();
    }
  }

  String? checedEmployeeLogdIin(){
    final token = CacheHelper.getString(ApiConstants.tokenKey);
    print(token);
    if (token != null) {
      return EmployeeRoute.root;
    } else{
      return EmployeeRoute.login;
    }
  }
}
