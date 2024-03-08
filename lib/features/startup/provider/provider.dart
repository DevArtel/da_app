import 'package:da_app/common/utils/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'provider.g.dart';

final startupProviders = [
  flavorProvider,
  sharedPreferencesProvider,
];

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    startupProviders.forEach(ref.invalidate);
  });

  await _initDependencies();

  for (final provider in startupProviders) {
    await ref.watch(provider.future);
  }
}

Future<void> _initDependencies() async {
  // await Firebase.initializeApp( //todo enable web
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) => SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
Future<Flavor> flavor(FlavorRef ref) async {
  if (kIsWeb) {
    return kDebugMode ? Flavor.staging : Flavor.prod;
  } else {
    final detector = FlavorDetector();
    await detector.init();

    return detector.flavor;
  }
}
