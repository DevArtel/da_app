import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterDataStoreProvider = Provider<CounterDataStore>((ref) {
  return CounterDataStore();
});

class CounterDataStore {
  var _counter = 0;

  int get counter => _counter;

  set counter(int value) => _counter = value;
}
