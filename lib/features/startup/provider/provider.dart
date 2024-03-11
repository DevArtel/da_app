import 'package:da_app/common/utils/flavor.dart';
import 'package:da_app/common/utils/preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'provider.g.dart';

/// Register providers that must be initialized before the app startup
final startupProviders = [
  flavorProvider,
  sharedPreferencesProvider,
];

/// Run initialization of non-provider components that must be initialized
/// before the app startup. E.g. Firebase SDK.
Future<void> initDependencies() async {
  // TODO: add dependencies initializing
}

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    startupProviders.forEach(ref.invalidate);
  });

  await _initDependencies();

  for (final provider in startupProviders) {
    await ref.watch(provider.future);
  }

  await initDependencies();
}

Future<void> _initDependencies() async {}
