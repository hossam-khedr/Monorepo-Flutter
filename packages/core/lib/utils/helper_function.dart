import'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';
double roundToMaxDecimalDigit(double number) {
  int integerPart = number.truncate();
  String decimalStr = number.toString().split('.').last;

  int maxDigit = decimalStr
      .split('')
      .map(int.parse)
      .reduce((a, b) => a > b ? a : b);

  return integerPart + (maxDigit / 10);
}


Color? getLeaveStatusColor(String status) {
  switch (status) {
    case 'approved':
      return LightColors.green;
    case 'pending':
      return LightColors.orange;
    case 'rejected':
      return LightColors.read;
  }
  return null;

}

String getLeaveNameType(String status) {
  switch (status) {
    case 'approved':
      return 'مقبوله';
    case 'pending':
      return 'قيد المراجعه';
    case 'rejected':
      return 'مرفوضه';
  }
  return '';

}

Color? getLeaveStatusContanerColor(String status) {
  switch ( status) {
    case  'approved':
      return LightColors.green.withAlpha(50);
    case 'pending':
      return LightColors.orange.withAlpha(50);
    case 'rejected':
      return LightColors.read.withAlpha(50);
  }
  return null;

}