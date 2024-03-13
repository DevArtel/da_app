import 'package:flutter/material.dart';
import 'package:screen_builder/page_state_builder/page_state.dart';
import 'package:screen_builder/state_banners/banner_error.dart';
import 'package:screen_builder/state_banners/banner_loader.dart';

class PageStateBuilder<T> extends StatelessWidget {
  const PageStateBuilder({
    required this.state,
    required this.dataBuilder,
    this.onRetryPressed,
    Key? key,
  }) : super(key: key);

  final PageState<T> state;
  final Widget Function(BuildContext, T) dataBuilder;
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: state.when(
        loading: () => const BannerLoader(),
        error: (error) => Center(
          child: BannerError(
            error: error,
            onRetryPressed: onRetryPressed,
          ),
        ),
        data: (data) => dataBuilder(context, data),
      ),
    );
  }
}
