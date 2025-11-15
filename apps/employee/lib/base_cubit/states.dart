enum AppThemeMode { light, dark, system }

class BaseAppStats {
  final AppThemeMode appThemeMode;
  final bool isDarkMode;

  BaseAppStats({required this.appThemeMode, required this.isDarkMode});

  BaseAppStats copyWith({
    final AppThemeMode? appThemeMode,
    final bool? isDarkMode,
  }) {
    return BaseAppStats(
      appThemeMode: appThemeMode ?? this.appThemeMode,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
