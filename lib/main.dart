import 'dart:async';

import 'package:da_app/common/firebase_options.dart';
import 'package:da_app/common/l10n/l10n.dart';
import 'package:da_app/common/navigation/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_kit/ui_kit.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      );
}
