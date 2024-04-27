import 'package:da_app/common/errors/error_tracker.dart';
import 'package:da_app/common/firebase_options.dart';
import 'package:da_app/common/utils/flavor.dart';
import 'package:da_app/common/utils/preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ErrorTracker.init();
}

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    startupProviders.forEach(ref.invalidate);
  });

  await initDependencies();

  for (final provider in startupProviders) {
    await ref.watch(provider.future);
  }
}
