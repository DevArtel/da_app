import 'package:da_app/common/errors/app_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor.g.dart';

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

const _flavorChanel = MethodChannel('flavor_channel');

enum Flavor {
  prod,
  staging,
}

extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.prod:
        return 'prod';
      case Flavor.staging:
        return 'staging';
    }
  }
}

class FlavorDetector {
  late final Flavor _flavor;

  Flavor get flavor => _flavor;

  Future<void> init() async {
    _flavor = await _getFlavor();
  }

  Future<Flavor> _getFlavor() async {
    final flavor = await _flavorChanel.invokeMethod<String>('getFlavor');
    switch (flavor) {
      case 'staging':
        return Flavor.staging;
      case 'prod':
        return Flavor.prod;
      default:
        throw FlavorIsNotDefinedException();
    }
  }
}

class FlavorIsNotDefinedException extends AppException {
  FlavorIsNotDefinedException() : super('Flavor is not defined');
}
