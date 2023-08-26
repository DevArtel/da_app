import 'package:da_app/counter/counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(this.ref)
      : super(ref.read(counterRepositoryProvider).counter);

  final Ref ref;

  void increment() {
    final repository = ref.read(counterRepositoryProvider);
    repository.increment();
    state = repository.counter;
  }
}
