import 'package:da_app/common/utils/flavor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'provider.g.dart';

final startupProviders = [
  flavorProvider,
  sharedPreferencesProvider,
  stubProvider,
];

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    startupProviders.forEach(ref.invalidate);
  });

  for (final provider in startupProviders) {
    await ref.watch(provider.future);
  }
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) => SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
Future<Flavor> flavor(FlavorRef ref) async {
  final detector = FlavorDetector();
  await detector.init();

  return detector.flavor;
}

@Riverpod(keepAlive: true)
Future<void> stub(StubRef ref) => Future.delayed(const Duration(seconds: 1), () {});
