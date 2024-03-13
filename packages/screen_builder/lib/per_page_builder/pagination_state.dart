
part 'pagination_state.freez.dart';

class PaginationState<T> with _$PaginationState<T> {
  const PaginationState._();

  factory PaginationState({
    List<T>? items,
    bool isLoadingNextPage,
    bool hasNextPage,
    Object? error,
    String? cursor,
  }) = _PaginationState;
}
