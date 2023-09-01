import 'package:da_app/common/l10n/l10n.dart';
import 'package:da_app/common/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_kit/ui_kit.dart';

// TODO: splash / app initializer
// TODO: Fastlane
// TODO: gh actions workflows
// TODO: gh pr templates
// TODO: deep links
// TODO: Generate icons font
// TODO: go_router_builder
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
          ...UiLocalizations.localizationsDelegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
      );
}
