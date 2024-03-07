import 'package:da_app/common/l10n/l10n.dart';
import 'package:da_app/common/utils/flavor.dart';
import 'package:da_app/features/counter/provider/provider.dart';
import 'package:da_app/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui_kit/ui_kit.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  Future<String> _getFlavor() async {
    final detector = FlavorDetector();
    await detector.init();

    return detector.flavor.name;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterNotifier = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(text: AppLocalizations.of(context)!.counterPageTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterNotifier.increment,
        child: const Icon(Icons.plus_one),
      ),
      body: FutureBuilder<String>(
        future: _getFlavor(),
        builder: (context, snapshot) {
          final flavor = snapshot.data ?? 'Loading';

          return Banner(
            message: flavor,
            location: BannerLocation.topEnd,
            child: Builder(
              builder: (context) {
                final counterState = ref.watch(counterProvider);

                return Center(
                  child: CounterText(value: counterState),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
