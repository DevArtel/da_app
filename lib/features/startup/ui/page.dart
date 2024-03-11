import 'package:da_app/features/startup/provider/provider.dart';
import 'package:da_app/features/startup/ui/error.dart';
import 'package:da_app/features/startup/ui/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AppBuilder = WidgetBuilder;

typedef LoadingBuilder = WidgetBuilder;

typedef ErrorBuilder = Widget Function(BuildContext context, Object error, StackTrace stackTrace, VoidCallback retry);

class AppStartup extends ConsumerWidget {
  const AppStartup({
    required this.appBuilder,
    super.key,
  });

  final AppBuilder appBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);

    return appStartupState.when(
      data: (_) => appBuilder(context),
      error: (error, stackTrace) {
        return AppStartupError(
          error: error,
          retry: () => ref.invalidate(appStartupProvider),
        );
      },
      loading: AppStartupLoading.new,
    );
  }
}
