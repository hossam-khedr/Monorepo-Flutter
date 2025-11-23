import 'package:flutter/material.dart';
import 'dart:ui';

/// Custom Dialog Theme Extension
class CustomDialogTheme extends ThemeExtension<CustomDialogTheme> {
  // Colors
  final Color backgroundColor;
  final Color barrierColor;
  final Color successColor;
  final Color errorColor;
  final Color warningColor;
  final Color infoColor;

  // Typography
  final TextStyle titleTextStyle;
  final TextStyle messageTextStyle;
  final TextStyle buttonTextStyle;

  // Shapes & Sizes
  final BorderRadius borderRadius;
  final double elevation;
  final double iconSize;
  final EdgeInsets padding;
  final EdgeInsets buttonPadding;

  // Shadows
  final List<BoxShadow> boxShadow;

  const CustomDialogTheme({
    required this.backgroundColor,
    required this.barrierColor,
    required this.successColor,
    required this.errorColor,
    required this.warningColor,
    required this.infoColor,
    required this.titleTextStyle,
    required this.messageTextStyle,
    required this.buttonTextStyle,
    required this.borderRadius,
    required this.elevation,
    required this.iconSize,
    required this.padding,
    required this.buttonPadding,
    required this.boxShadow,
  });

  /// Light Theme
  factory CustomDialogTheme.light() {
    return CustomDialogTheme(
      backgroundColor: Colors.white,
      barrierColor: Colors.black54,
      successColor: const Color(0xFF10B981),
      errorColor: const Color(0xFFEF4444),
      warningColor: const Color(0xFFF59E0B),
      infoColor: const Color(0xFF3B82F6),
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F2937),
        fontFamily: 'Cairo',
      ),
      messageTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
        height: 1.5,
        fontFamily: 'Cairo',
      ),
      buttonTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
      borderRadius: BorderRadius.circular(24),
      elevation: 0,
      iconSize: 48,
      padding: const EdgeInsets.all(24),
      buttonPadding: const EdgeInsets.symmetric(vertical: 16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  /// Dark Theme
  factory CustomDialogTheme.dark() {
    return CustomDialogTheme(
      backgroundColor: const Color(0xFF1F2937),
      barrierColor: Colors.black87,
      successColor: const Color(0xFF34D399),
      errorColor: const Color(0xFFF87171),
      warningColor: const Color(0xFFFBBF24),
      infoColor: const Color(0xFF60A5FA),
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Cairo',
      ),
      messageTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey[300],
        height: 1.5,
        fontFamily: 'Cairo',
      ),
      buttonTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
      borderRadius: BorderRadius.circular(24),
      elevation: 8,
      iconSize: 48,
      padding: const EdgeInsets.all(24),
      buttonPadding: const EdgeInsets.symmetric(vertical: 16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  @override
  CustomDialogTheme copyWith({
    Color? backgroundColor,
    Color? barrierColor,
    Color? successColor,
    Color? errorColor,
    Color? warningColor,
    Color? infoColor,
    TextStyle? titleTextStyle,
    TextStyle? messageTextStyle,
    TextStyle? buttonTextStyle,
    BorderRadius? borderRadius,
    double? elevation,
    double? iconSize,
    EdgeInsets? padding,
    EdgeInsets? buttonPadding,
    List<BoxShadow>? boxShadow,
  }) {
    return CustomDialogTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barrierColor: barrierColor ?? this.barrierColor,
      successColor: successColor ?? this.successColor,
      errorColor: errorColor ?? this.errorColor,
      warningColor: warningColor ?? this.warningColor,
      infoColor: infoColor ?? this.infoColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      messageTextStyle: messageTextStyle ?? this.messageTextStyle,
      buttonTextStyle: buttonTextStyle ?? this.buttonTextStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      iconSize: iconSize ?? this.iconSize,
      padding: padding ?? this.padding,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      boxShadow: boxShadow ?? this.boxShadow,
    );
  }

  @override
  CustomDialogTheme lerp(ThemeExtension<CustomDialogTheme>? other, double t) {
    if (other is! CustomDialogTheme) return this;

    return CustomDialogTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      barrierColor: Color.lerp(barrierColor, other.barrierColor, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      messageTextStyle: TextStyle.lerp(
        messageTextStyle,
        other.messageTextStyle,
        t,
      )!,
      buttonTextStyle: TextStyle.lerp(
        buttonTextStyle,
        other.buttonTextStyle,
        t,
      )!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
      iconSize: lerpDouble(iconSize, other.iconSize, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      buttonPadding: EdgeInsets.lerp(buttonPadding, other.buttonPadding, t)!,
      boxShadow: t < 0.5 ? boxShadow : other.boxShadow,
    );
  }

  /// Helper to get color by DialogType
  Color getColorByType(DialogType type) {
    switch (type) {
      case DialogType.success:
        return successColor;
      case DialogType.error:
        return errorColor;
      case DialogType.warning:
        return warningColor;
      case DialogType.info:
        return infoColor;
      case DialogType.confirm:
        return infoColor;
      case DialogType.custom:
        return infoColor;
    }
  }
}

enum DialogType { success, error, warning, info, confirm, custom }

/// Extension to easily access the theme
extension DialogThemeExtension on BuildContext {
  CustomDialogTheme get dialogTheme {
    return Theme.of(this).extension<CustomDialogTheme>() ??
        CustomDialogTheme.light();
  }
}
