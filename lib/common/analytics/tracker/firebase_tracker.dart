import 'package:da_app/common/analytics/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseTracker implements AnalyticsTracker {
  final _analytics = FirebaseAnalytics.instance;

  @override
  void trackEvent(String name, [AnalyticsAttributes? attributes]) {
    _analytics.logEvent(name: name, parameters: attributes);
  }

  @override
  void setUser(String id, [AnalyticsAttributes? attributes]) {
    _analytics.setUserId(id: id);

    attributes?.forEach((name, value) {
      _analytics.setUserProperty(name: name, value: value.toString());
    });
  }

  @override
  void setMeta(AnalyticsAttributes attributes) {
    _analytics.setDefaultEventParameters(attributes);
  }

  @override
  Future<void> reset() => _analytics.resetAnalyticsData();
}
