import 'package:da_app/common/analytics/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseTracker implements AnalyticsTracker {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void setUser(String id, [AnalyticsAttributes? attributes]) {
    analytics.setUserId(id: id);

    attributes?.forEach((name, value) {
      analytics.setUserProperty(name: name, value: value.toString());
    });
  }

  @override
  void trackEvent(String name, [AnalyticsAttributes? attributes]) {
    analytics.logEvent(name: name, parameters: attributes);
  }
}
