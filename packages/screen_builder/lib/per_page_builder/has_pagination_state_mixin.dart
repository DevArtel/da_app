
import 'package:screen_builder/per_page_builder/pagination_state.dart';

mixin HasPaginationStateMixin<S, T> {
  PaginationState<T>? get pageState;

  bool get isLoadingNextPage =>
      pageState == null || pageState?.hasNextPage == true && pageState?.isLoadingNextPage == true;

  bool get hasFailedLoadingNextPage => pageState?.error != null;

  bool get isEmpty {
    final pageStateChecked = pageState;
    if (pageStateChecked == null) {
      //page not loaded yet, hence no info if it's empty
      return false;
    }

    if (hasFailedLoadingNextPage) {
      //error is something other then empty
      return false;
    }

    return (pageStateChecked.items ?? []).isEmpty;
  }

  S copyWithPaginationState(PaginationState<T> pageState);
}
