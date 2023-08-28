import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.textPrimary,
    required this.textSecondary,
    required this.action,
    required this.primary,
    required this.background,
  });

  final Color textPrimary;
  final Color textSecondary;
  final Color action;
  final Color primary;
  final Color background;

  static const light = AppColors(
    textPrimary: AppPaletteLight.textPrimary,
    textSecondary: AppPaletteLight.textSecondary,
    action: AppPaletteLight.action,
    primary: AppPaletteLight.primary,
    background: AppPaletteLight.background,
  );

  static const dark = AppColors(
    textPrimary: AppPaletteDark.textPrimary,
    textSecondary: AppPaletteDark.textSecondary,
    action: AppPaletteDark.action,
    primary: AppPaletteDark.primary,
    background: AppPaletteDark.background,
  );

  @override
  ThemeExtension<AppColors> copyWith() => this;

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      action: Color.lerp(action, other.action, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}

class AppPaletteLight {
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color action = Color(0xFF2196F3);
  static const Color primary = Color(0xFF4CAF50);
  static const Color background = Color(0xFFFFFFFF);
}

class AppPaletteDark {
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFBDBDBD);
  static const Color action = Color(0xFFBB86FC);
  static const Color primary = Color(0xFF03DAC6);
  static const Color background = Color(0xFF121212);
}
