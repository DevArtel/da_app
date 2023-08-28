import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CounterText extends StatelessWidget {
  const CounterText({
    required this.value,
    super.key,
  });

  final int value;

  @override
  Widget build(BuildContext context) => Text(
        UiLocalizations.of(context)!.counterValue(value),
        style: context.appTheme.textStyles.body.copyWith(
          color: context.appTheme.colors.textPrimary,
        ),
      );
}
