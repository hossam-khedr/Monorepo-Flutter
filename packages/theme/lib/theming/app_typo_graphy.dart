import 'package:flutter/material.dart';

class AppTypography {
  // Prevent instantiation
  AppTypography._();

  // Helper method to apply optional color
  static TextStyle _applyColor(TextStyle style, [Color? color]) {
    return style.copyWith(color: color);
  }

  /// Titles
  static TextStyle titleLarge([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ), color);

  static TextStyle titleMedium([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ), color);

  static TextStyle titleSmall([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.3,
      ), color);

  /// Body
  static TextStyle bodyLarge([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.4,
      ), color);

  static TextStyle bodyMedium([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.4,
      ), color);

  static TextStyle bodySmall([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.4,
      ), color);

  /// Caption / Notes
  static TextStyle caption([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w300,
        height: 1.3,
      ), color);

  /// Button Text
  static TextStyle button([Color? color]) =>
      _applyColor(const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 0.5,
      ), color);
}

