import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class ErrorTracker {
  static void init() {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    PlatformDispatcher.instance.onError = (error, stack) {
      track(error, stack);
      return true;
    };
  }

  static void track(dynamic error, StackTrace stackTrace, [bool fatal = true]) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
  }
}
