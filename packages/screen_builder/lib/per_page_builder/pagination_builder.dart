import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:screen_builder/page_state_builder/page_state.dart';
import 'package:screen_builder/page_state_builder/page_state_builder.dart';
import 'package:screen_builder/page_state_builder/page_state_builder_sliver.dart';
import 'package:screen_builder/per_page_builder/has_pagination_state_mixin.dart';
import 'package:screen_builder/per_page_builder/internal/sliver_fill_remaining_center.dart';
import 'package:screen_builder/per_page_builder/internal/throttler.dart';
import 'package:screen_builder/state_banners/banner_loader.dart';

const _scrollExtentThreshold = 500.0;

/// Observes given scrollController and triggers [onLoadNextPage] when scroll approaching end of page.
/// Facilitated rendering of following states:
/// 1. Full screen loading
/// 2. Full screen error
/// 3. Full screen empty view
/// 4. Data
/// 5. Data with loading
/// 6. Data with error
class PaginationBuilder<T extends HasPaginationStateMixin> extends HookWidget {
  const PaginationBuilder._({
    required this.isSliver,
    required this.pageState,
    required this.dataBuilder,
    required this.scrollController,
    this.hasScrollBody = false,
    this.emptyViewBuilder,
    this.errorViewBuilder,
    this.onRetryPressed,
    this.onLoadNextPage,
    Key? key,
  }) : super(key: key);

  factory PaginationBuilder.box({
    required PageState<T> pageState,
    @Deprecated('Use pageState.isLoadingNextPage')
    @Deprecated('Use pageState.hasError')
    required Widget Function(
      BuildContext context,
      T state,
      bool showFooterLoader,
      bool showFooterError,
    ) dataBuilder,
    Widget Function(BuildContext context)? emptyViewBuilder,
    Widget Function(BuildContext context, Object error)? errorViewBuilder,
    ScrollController? scrollController,
    VoidCallback? onRetryPressed,
    VoidCallback? onLoadNextPage,
    Key? key,
  }) =>
      PaginationBuilder._(
        isSliver: false,
        pageState: pageState,
        dataBuilder: dataBuilder,
        emptyViewBuilder: emptyViewBuilder,
        errorViewBuilder: errorViewBuilder,
        scrollController: scrollController,
        onRetryPressed: onRetryPressed,
        onLoadNextPage: onLoadNextPage,
      );

  factory PaginationBuilder.sliver({
    required PageState<T> pageState,
    required Widget Function(BuildContext context, T state, bool showFooterLoader, bool showFooterError) dataBuilder,
    Widget Function(BuildContext context)? emptyViewBuilder,
    Widget Function(BuildContext context, Object error)? errorViewBuilder,
    bool hasScrollBody = false,
    ScrollController? scrollController,
    VoidCallback? onRetryPressed,
    VoidCallback? onLoadNextPage,
    Key? key,
  }) =>
      PaginationBuilder._(
        isSliver: true,
        pageState: pageState,
        dataBuilder: dataBuilder,
        emptyViewBuilder: emptyViewBuilder,
        errorViewBuilder: errorViewBuilder,
        hasScrollBody: hasScrollBody,
        scrollController: scrollController,
        onRetryPressed: onRetryPressed,
        onLoadNextPage: onLoadNextPage,
      );


  // Sliver fields
  final bool hasScrollBody;

  // Common fields
  final bool isSliver;
  final PageState<T> pageState;
  final Widget Function(BuildContext context)? emptyViewBuilder;
  final Widget Function(BuildContext context, Object error)? errorViewBuilder;
  final Widget Function(BuildContext context, T state, bool showFooterLoader, bool showFooterError) dataBuilder;
  final ScrollController? scrollController;
  final VoidCallback? onRetryPressed;
  final VoidCallback? onLoadNextPage;

  @override
  Widget build(BuildContext context) {
    final throttler = useThrottler();
    final checkedScrollController = scrollController;

    if (checkedScrollController != null) {
      useEffect(() {
        void listener() {
          if (_shouldLoadNextPage(checkedScrollController.positions.first)) {
            throttler.run(() => onLoadNextPage?.call());
          }
        }

        checkedScrollController.addListener(listener);

        return () => checkedScrollController.removeListener(listener);
      }, [onLoadNextPage, checkedScrollController]);
    }

    if (isSliver) {
      return PageStateBuilderSliver(
        state: pageState,
        hasScrollBody: hasScrollBody,
        dataBuilder: _paginationDataBuilder,
        onRetryPressed: onRetryPressed,
      );
    } else {
      return PageStateBuilder(
        state: pageState,
        dataBuilder: _paginationDataBuilder,
        onRetryPressed: onRetryPressed,
      );
    }
  }

  /// Returns
  Widget _paginationDataBuilder(BuildContext context, T data) {
    final checkedEmptyBuilder = emptyViewBuilder;
    final checkedErrorBuilder = errorViewBuilder;

    final isLoadingNextPage = data.isLoadingNextPage;
    final hasError = data.hasFailedLoadingNextPage;
    final isEmpty = data.isEmpty;

    if (checkedErrorBuilder != null && (data.pageState?.items ?? []).isEmpty && hasError) {
      final errorWidget = checkedErrorBuilder.call(context, data.pageState?.error ?? Exception('unexpected'));
      return isSliver ? SliverFillRemainingCenter(child: errorWidget) : errorWidget;
    }

    if (checkedEmptyBuilder != null && isEmpty && !isLoadingNextPage) {
      final emptyWidget = checkedEmptyBuilder.call(context);
      return isSliver ? SliverFillRemainingCenter(child: emptyWidget) : emptyWidget;
    }

    if (isEmpty && isLoadingNextPage) {
      const emptyWidget = BannerLoader();
      return isSliver ? const SliverFillRemainingCenter(child: emptyWidget) : emptyWidget;
    }

    return dataBuilder(context, data, isLoadingNextPage, hasError);
  }

  bool _shouldLoadNextPage(ScrollPosition scrollPosition) {
    if (!scrollPosition.hasViewportDimension) {
      return false;
    }
    final offset = scrollPosition.pixels;
    final maxScroll = scrollPosition.maxScrollExtent;

    return offset >= (maxScroll - _scrollExtentThreshold);
  }
}
