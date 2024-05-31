import 'package:da_app/common/errors/app_exception.dart';
import 'package:da_app/common/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class StartupWidget extends StatelessWidget {
  const StartupWidget({
    this.child,
    super.key,
  }) : router = null;

  const StartupWidget.router({
    required this.router,
    super.key,
  }) : child = null;

  static const debugShowCheckedModeBanner = false;
  static const supportedLocales = AppLocalizations.supportedLocales;
  static const localizationDelegates = [
    ...AppLocalizations.localizationsDelegates,
    ...UiLocalizations.localizationsDelegates,
  ];

  static final theme = AppTheme.light;
  static final darkTheme = AppTheme.dark;

  final WidgetBuilder? child;
  final RouterConfig<Object>? router;

  @override
  Widget build(BuildContext context) {
    final childBuilder = child;
    if (childBuilder != null) {
      return MaterialApp(
        localizationsDelegates: localizationDelegates,
        supportedLocales: supportedLocales,
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        home: Builder(
          builder: childBuilder,
        ),
      );
    } else if (router != null) {
      return MaterialApp.router(
        localizationsDelegates: localizationDelegates,
        supportedLocales: supportedLocales,
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routerConfig: router,
      );
    } else {
      throw const AppException('Either child ou router required');
    }
  }
}
