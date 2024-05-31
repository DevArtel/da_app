import 'package:da_app/features/counter/model/data_store.dart';
import 'package:logger/logger.dart';

abstract class CounterRepository {
  int get counter;

  void increment();
}

class CounterRepositoryImpl implements CounterRepository {
  CounterRepositoryImpl({
    required this.dataStore,
  });

  static const String _tag = 'CounterRepositoryImpl';

  final CounterDataStore dataStore;

  @override
  int get counter => dataStore.counter;

  @override
  void increment() {
    Log.d(_tag, 'call increment()');
    dataStore.counter += 1;
  }
}
