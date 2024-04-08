import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: AppBarTitle)
Widget defaultAppBarTitleUseCase(BuildContext context) => Center(
      child: AppBarTitle(
        text: context.knobs.string(label: 'Text', initialValue: 'Title'),
      ),
    );

@widgetbook.UseCase(name: 'default', type: CounterText)
Widget defaultCounterTextUseCase(BuildContext context) => Center(
      child: CounterText(
        value: context.knobs.double.input(label: 'Value', initialValue: 0).toInt(),
      ),
    );
