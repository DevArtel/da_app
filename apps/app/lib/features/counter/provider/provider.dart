import 'package:da_app/features/counter/model/data_store.dart';
import 'package:da_app/features/counter/model/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterDataStoreProvider =
    Provider<CounterDataStore>((ref) => CounterDataStore());

final counterRepositoryProvider = Provider<CounterRepository>(
  (ref) => CounterRepositoryImpl(
    dataStore: ref.read(counterDataStoreProvider),
  ),
);

final counterProvider =
    StateNotifierProvider.autoDispose<CounterController, int>(
  CounterController.new,
);

class CounterController extends StateNotifier<int> {
  CounterController(this.ref)
      : super(ref.read(counterRepositoryProvider).counter);

  final Ref ref;

  void increment() {
    final repository = ref.read(counterRepositoryProvider);
    repository.increment();
    state = repository.counter;
  }
}
