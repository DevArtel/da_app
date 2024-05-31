import 'package:flutter/material.dart';
import 'package:storybook/src/widgetbook.directories.g.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _textScaleAddon = TextScaleAddon(
  scales: [1.0, 1.5, 2.0],
);

final _deviceFrameAddon = DeviceFrameAddon(
  devices: [
    Devices.ios.iPhone13,
    Devices.ios.iPhoneSE,
  ],
  initialDevice: Devices.ios.iPhone13,
);

final _themeAddon = MaterialThemeAddon(
  themes: [
    WidgetbookTheme(
      name: 'Light',
      data: AppTheme.light,
    ),
    WidgetbookTheme(
      name: 'Dark',
      data: AppTheme.dark,
    ),
  ],
);

final _localizationAddon = LocalizationAddon(
  locales: UiLocalizations.supportedLocales,
  localizationsDelegates: UiLocalizations.localizationsDelegates,
);

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) => Widgetbook.material(
        directories: directories,
        addons: [
          _textScaleAddon,
          _deviceFrameAddon,
          _themeAddon,
          _localizationAddon,
        ],
      );
}
