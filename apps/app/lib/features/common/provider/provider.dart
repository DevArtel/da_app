import 'package:da_app/common/analytics/analytics.dart';
import 'package:da_app/common/analytics/tracker/firebase_tracker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
AnalyticsService analyticsService(AnalyticsServiceRef ref) =>
    AnalyticsService()..registerTracker(FirebaseTracker());
