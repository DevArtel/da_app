abstract class AnalyticsEvent {}

abstract class AnalyticsUser {}

abstract interface class AnalyticsTracker {
  void setUser(AnalyticsUser? user);

  void addBreadcrumb(String breadcrumb);

  void trackEvent(AnalyticsEvent event);
}

class AnalyticsService implements AnalyticsTracker {
  final _trackers = <AnalyticsTracker>{};

  void registerTracker(AnalyticsTracker tracker) {
    _trackers.add(tracker);
  }

  @override
  void setUser(AnalyticsUser? user) {
    for (final tracker in _trackers) {
      tracker.setUser(user);
    }
  }

  @override
  void addBreadcrumb(String breadcrumb) {
    for (final tracker in _trackers) {
      tracker.addBreadcrumb(breadcrumb);
    }
  }

  @override
  void trackEvent(AnalyticsEvent event) {
    for (final tracker in _trackers) {
      tracker.trackEvent(event);
    }
  }
}
