import 'package:flutter/material.dart';

class AppColors {
  static const bg = Color(0xFFF7F6F2);
  static const surface = Color(0xFFFFFFFF);
  static const card = Color(0xFFFFFFFF);
  static const border = Color(0xFFE0E2DA);
  static const accent = Color(0xFF244BD7);
  static const accent2 = Color(0xFF244BD7);
  static const text = Color(0xFF202922);
  static const muted = Color(0xFF626B64);
  static const tagBg = Color(0xFFEDF0E9);
  static const blueTint = Color(0xFFE8EDFF);
  static const sage = Color(0xFFE5EBD9);
}

ThemeData portfolioTheme() => ThemeData(
  useMaterial3: true,
  fontFamily: 'CupertinoSystemText',
  fontFamilyFallback: const [
    'SF Pro Text',
    'SF Pro Display',
    '-apple-system',
    'BlinkMacSystemFont',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ],
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.bg,
  colorScheme: const ColorScheme.light(
    primary: AppColors.accent,
    secondary: AppColors.accent2,
    surface: AppColors.surface,
    onSurface: AppColors.text,
    onPrimary: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 15, color: AppColors.text, height: 1.6),
    bodyLarge: TextStyle(fontSize: 17, color: AppColors.muted, height: 1.6),
    titleLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColors.text,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),
  dividerColor: AppColors.border,
);
