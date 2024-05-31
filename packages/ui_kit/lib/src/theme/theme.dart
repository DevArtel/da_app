import 'package:flutter/material.dart';
import 'package:ui_kit/src/theme/colors.dart';
import 'package:ui_kit/src/theme/text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    const semanticColors = AppColors.light;

    return ThemeData.light()
        ._applyColors(semanticColors)
        ._applyExtensions(semanticColors);
  }

  static ThemeData get dark {
    const semanticColors = AppColors.dark;

    return ThemeData.dark()
        ._applyColors(semanticColors)
        ._applyExtensions(semanticColors);
  }
}

extension on ThemeData {
  /// Applies AppColors to Material theme
  ThemeData _applyColors(AppColors colors) => copyWith(
        scaffoldBackgroundColor: colors.background,
      );

  /// Adds custom properties to a Theme and provides them App wide,
  /// making theme available via extensions
  ThemeData _applyExtensions(AppColors appColors) {
    return copyWith(
      extensions: <ThemeExtension<dynamic>>[
        appColors,
        AppTextStyles(appColors),
      ],
    );
  }
}

extension ThemeDelegateExtension on BuildContext {
  ThemeDelegate get appTheme => ThemeDelegate(this);
}

/// Don't forget to register extension in app_theme.dart applyExtension() method
class ThemeDelegate {
  ThemeDelegate(this._context);

  final BuildContext _context;

  AppTextStyles get textStyles =>
      Theme.of(_context).extension<AppTextStyles>()!;

  AppColors get colors => Theme.of(_context).extension<AppColors>()!;
}
