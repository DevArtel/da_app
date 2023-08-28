import 'package:flutter/material.dart';
import 'package:storybook/text.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Widgetbook(
        directories: [
          WidgetbookCategory(
            name: 'Widgets',
            children: [
              textsFolder,
            ],
          )
        ],
        addons: [
          DeviceFrameAddon(
            devices: [
              Devices.ios.iPhone13,
              Devices.ios.iPhoneSE,
            ],
            initialDevice: Devices.ios.iPhone13,
          ),
          TextScaleAddon(
            scales: [1.0, 1.5, 2.0],
          ),
        ],
        appBuilder: (context, child) => MaterialApp(
          localizationsDelegates: UiLocalizations.localizationsDelegates,
          supportedLocales: UiLocalizations.supportedLocales,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: Scaffold(body: child),
        ),
      );
}
