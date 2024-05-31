import 'dart:async';

import 'package:da_app/common/navigation/navigation.dart';
import 'package:da_app/features/startup/startup.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: AppStartup(
        appBuilder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => StartupWidget.router(
        router: ref.watch(routerProvider),
      );
}
