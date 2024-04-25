typedef AnalyticsAttributes = Map<String, dynamic>;

abstract interface class AnalyticsTracker {
  void setUser(String userId, [AnalyticsAttributes? attributes]);

  void trackEvent(String name, [AnalyticsAttributes? attributes]);
}

class AnalyticsService implements AnalyticsTracker {
  final _trackers = <AnalyticsTracker>{};

  void registerTracker(AnalyticsTracker tracker) {
    _trackers.add(tracker);
  }

  @override
  void setUser(String userId, [Map<String, dynamic>? attributes]) {
    for (final tracker in _trackers) {
      tracker.setUser(userId, attributes);
    }
  }

  @override
  void trackEvent(String name, [AnalyticsAttributes? attributes]) {
    for (final tracker in _trackers) {
      tracker.trackEvent(name, attributes);
    }
  }
}
