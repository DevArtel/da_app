import 'package:da_app/common/l10n/l10n.dart';
import 'package:da_app/features/startup/startup.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStartupError extends ConsumerWidget {
  const AppStartupError({
    required this.error,
    required this.retry,
    super.key,
  });

  final Object error;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context, WidgetRef ref) => StartupWidget(
        child: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error.toString()),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(appStartupProvider);
                  },
                  child: Text(AppLocalizations.of(context)!.retry),
                ),
              ],
            ),
          ),
        ),
      );
}
