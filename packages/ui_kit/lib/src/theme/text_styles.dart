import 'package:flutter/material.dart';
import 'package:ui_kit/src/theme/colors.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  AppTextStyles(this.appColors);

  final AppColors appColors;

  TextStyle get _shared => TextStyle(
        color: appColors.textPrimary,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get title => _shared.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 32 / 28,
      );

  TextStyle get body => _shared.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 20 / 16,
      );

  @override
  ThemeExtension<AppTextStyles> copyWith() => this;

  @override
  ThemeExtension<AppTextStyles> lerp(ThemeExtension<AppTextStyles>? other, double t) => this;
}
