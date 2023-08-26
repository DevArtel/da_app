import 'package:da_app/counter/provider/provider.dart';
import 'package:da_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.counterPageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterNotifier.increment,
        child: const Icon(Icons.plus_one),
      ),
      body: Builder(builder: (context) {
        final counterState = ref.watch(counterProvider);

        return Center(
          child: Text(AppLocalizations.of(context)!.counterValue(counterState)),
        );
      }),
    );
  }
}
