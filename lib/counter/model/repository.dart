import 'package:da_app/counter/model/data_store.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final counterRepositoryProvider = Provider<CounterRepository>(
  (ref) => CounterRepositoryImpl(
    dataStore: ref.read(counterDataStoreProvider),
  ),
);

abstract class CounterRepository {
  int get counter;

  void increment();
}

class CounterRepositoryImpl implements CounterRepository {
  CounterRepositoryImpl({
    required this.dataStore,
  });

  static const String _tag = 'CounterRepository';

  final CounterDataStore dataStore;

  @override
  int get counter => dataStore.counter;

  @override
  void increment() {
    Log.d(_tag, 'call increment()');
    dataStore.counter += 1;
  }
}
