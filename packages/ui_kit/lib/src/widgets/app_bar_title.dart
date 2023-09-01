import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: context.appTheme.textStyles.title.copyWith(
          color: context.appTheme.colors.textPrimary,
        ),
      );
}
