import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';

final textsFolder = WidgetbookFolder(
  name: 'Texts',
  children: [
    appBarTitleComponent,
    counterTextComponent,
  ],
);

final appBarTitleComponent = WidgetbookComponent(
  name: 'AppBar Title',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => Center(
        child: AppBarTitle(
          text: context.knobs.string(label: 'Text', initialValue: 'Title'),
        ),
      ),
    ),
  ],
);

final counterTextComponent = WidgetbookComponent(
  name: 'Counter Text',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => Center(
        child: CounterText(
          value: context.knobs.double.input(label: 'Value', initialValue: 0).toInt(),
        ),
      ),
    ),
  ],
);
