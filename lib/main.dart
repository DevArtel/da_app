import 'package:da_app/common/l10n/l10n.dart';
import 'package:da_app/common/navigation/router_scope.dart';
import 'package:da_app/features/counter/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_kit/ui_kit.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => RouterScope(
        initialLocation: const CounterRoute().location,
        builder: (context, router) => MaterialApp.router(
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            ...UiLocalizations.localizationsDelegates,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
        ),
      );
}
