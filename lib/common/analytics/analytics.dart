import 'package:logger/logger.dart';

typedef AnalyticsAttributes = Map<String, dynamic>;

abstract interface class AnalyticsTracker {
  void trackEvent(String name, [AnalyticsAttributes? attributes]);

  void setUser(String id, [AnalyticsAttributes? attributes]);

  void setMeta(AnalyticsAttributes attributes);

  Future<void> reset();
}

class AnalyticsService implements AnalyticsTracker {
  static const _tag = 'AnalyticsService';

  final _trackers = <AnalyticsTracker>{};

  void registerTracker(AnalyticsTracker tracker) {
    Log.i(_tag, 'Registered tracker: ${tracker.runtimeType}');

    _trackers.add(tracker);
  }

  @override
  void trackEvent(String name, [AnalyticsAttributes? attributes]) {
    Log.i(_tag, 'track event: $name $attributes');

    for (final tracker in _trackers) {
      tracker.trackEvent(name, attributes);
    }
  }

  @override
  void setUser(String id, [AnalyticsAttributes? attributes]) {
    Log.i(_tag, 'Set user: $id $attributes');

    for (final tracker in _trackers) {
      tracker.setUser(id, attributes);
    }
  }

  @override
  void setMeta(AnalyticsAttributes attributes) {
    Log.i(_tag, 'Set meta: $attributes');

    for (final tracker in _trackers) {
      tracker.setMeta(attributes);
    }
  }

  @override
  Future<void> reset() async {
    Log.i(_tag, 'Reset trackers');

    for (final tracker in _trackers) {
      await tracker.reset();
    }
  }
}
