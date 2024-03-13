import 'package:flutter/material.dart';
import 'package:screen_builder/page_state_builder/page_state.dart';
import 'package:screen_builder/state_banners/banner_error.dart';
import 'package:screen_builder/state_banners/banner_loader.dart';

class PageStateBuilderSliver<T> extends StatelessWidget {
  const PageStateBuilderSliver({
    required this.state,
    this.hasScrollBody = false,
    required this.dataBuilder,
    this.onRetryPressed,
    Key? key,
  }) : super(key: key);

  final PageState<T> state;
  final bool hasScrollBody;

  /// Builder for data state
  final Widget Function(BuildContext, T) dataBuilder;
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return state.when(
      loading: () => SliverFillRemaining(
        hasScrollBody: hasScrollBody,
        child: const BannerLoader(),
      ),
      error: (error) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: BannerError(
            error: error,
            onRetryPressed: onRetryPressed,
          ),
        ),
      ),
      data: (data) => dataBuilder(context, data),
    );
  }
}
