typedef AnalyticsAttributes = Map<String, dynamic>;

abstract interface class AnalyticsTracker {
  void trackEvent(String name, [AnalyticsAttributes? attributes]);

  void setUser(String userId, [AnalyticsAttributes? attributes]);

  void setMeta(AnalyticsAttributes attributes);

  Future<void> reset();
}

class AnalyticsService implements AnalyticsTracker {
  final _trackers = <AnalyticsTracker>{};

  void registerTracker(AnalyticsTracker tracker) {
    _trackers.add(tracker);
  }

  @override
  void trackEvent(String name, [AnalyticsAttributes? attributes]) {
    for (final tracker in _trackers) {
      tracker.trackEvent(name, attributes);
    }
  }

  @override
  void setUser(String userId, [AnalyticsAttributes? attributes]) {
    for (final tracker in _trackers) {
      tracker.setUser(userId, attributes);
    }
  }

  @override
  void setMeta(AnalyticsAttributes attributes) {
    for (final tracker in _trackers) {
      tracker.setMeta(attributes);
    }
  }

  @override
  Future<void> reset() async {
    for (final tracker in _trackers) {
      await tracker.reset();
    }
  }
}
