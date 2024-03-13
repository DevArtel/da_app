import 'package:flutter_hooks/flutter_hooks.dart';

const _defaultThrottleDuration = Duration(milliseconds: 100);

Throttler useThrottler([Duration? duration]) {
  final throttlerRef = useRef(Throttler(duration: duration ?? _defaultThrottleDuration));

  return throttlerRef.value;
}

class Throttler {
  final Duration duration;
  DateTime? lastRunTime;

  Throttler({required this.duration});

  void run(Function() function) {
    if (!_shouldRun()) return;
    lastRunTime = DateTime.now();
    function();
  }

  bool _shouldRun() {
    final lastRunTimeChecked = lastRunTime;

    if (lastRunTimeChecked == null) return true;

    if (DateTime.now().isAfter(lastRunTimeChecked.add(duration))) return true;

    return false;
  }
}
