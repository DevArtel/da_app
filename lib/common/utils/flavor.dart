import 'package:flutter/services.dart';

const _flavorChanel = MethodChannel('flavor_channel');

enum Flavor {
  prod,
  staging,
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
        throw Exception('Flavor is not defined');
    }
  }
}
