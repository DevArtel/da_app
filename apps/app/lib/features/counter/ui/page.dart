import 'package:da_app/common/l10n/l10n.dart';
import 'package:da_app/common/utils/flavor.dart';
import 'package:da_app/features/common/common.dart';
import 'package:da_app/features/counter/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_kit/ui_kit.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.read(counterProvider.notifier);
    final analyticsService = ref.read(analyticsServiceProvider);

    return Banner(
      message: ref.watch(flavorProvider).requireValue.name,
      location: BannerLocation.topEnd,
      child: Scaffold(
        appBar: AppBar(
          title:
              AppBarTitle(text: AppLocalizations.of(context).counterPageTitle),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            analyticsService.trackEvent('on_increment_pressed');
            counterNotifier.increment();
          },
          child: const Icon(Icons.plus_one),
        ),
        body: Builder(
          builder: (context) {
            final counterState = ref.watch(counterProvider);

            return Center(
              child: CounterText(value: counterState),
            );
          },
        ),
      ),
    );
  }
}
