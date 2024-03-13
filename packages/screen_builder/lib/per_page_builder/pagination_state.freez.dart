// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

/// Defines an immutable data-class.
///
/// This will consider all properties of the object as immutable.
const freezedTmp = _Freezed();

class _Freezed {
  /// {@template freezed_annotation.freezedTmp}
  const _Freezed();
}

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezedTmp and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezedTmp#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationState<T> {
  List<T>? get items => throw _privateConstructorUsedError;

  bool get isLoadingNextPage => throw _privateConstructorUsedError;

  bool get hasNextPage => throw _privateConstructorUsedError;

  Object? get error => throw _privateConstructorUsedError;

  String? get cursor => throw _privateConstructorUsedError;

  $PaginationStateCopyWith<T, PaginationState<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<T, $Res> {
  factory $PaginationStateCopyWith(PaginationState<T> value, $Res Function(PaginationState<T>) then) =
      _$PaginationStateCopyWithImpl<T, $Res, PaginationState<T>>;

  $Res call({List<T>? items, bool isLoadingNextPage, bool hasNextPage, Object? error, String? cursor});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<T, $Res, $Val extends PaginationState<T>>
    implements $PaginationStateCopyWith<T, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezedTmp,
    Object? isLoadingNextPage = null,
    Object? hasNextPage = null,
    Object? error = freezedTmp,
    Object? cursor = freezedTmp,
  }) {
    return _then(_value.copyWith(
      items: freezedTmp == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezedTmp == error ? _value.error : error,
      cursor: freezedTmp == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationStateCopyWith<T, $Res> implements $PaginationStateCopyWith<T, $Res> {
  factory _$$_PaginationStateCopyWith(_$_PaginationState<T> value, $Res Function(_$_PaginationState<T>) then) =
      __$$_PaginationStateCopyWithImpl<T, $Res>;

  @override
  $Res call({List<T>? items, bool isLoadingNextPage, bool hasNextPage, Object? error, String? cursor});
}

/// @nodoc
class __$$_PaginationStateCopyWithImpl<T, $Res> extends _$PaginationStateCopyWithImpl<T, $Res, _$_PaginationState<T>>
    implements _$$_PaginationStateCopyWith<T, $Res> {
  __$$_PaginationStateCopyWithImpl(_$_PaginationState<T> _value, $Res Function(_$_PaginationState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezedTmp,
    Object? isLoadingNextPage = null,
    Object? hasNextPage = null,
    Object? error = freezedTmp,
    Object? cursor = freezedTmp,
  }) {
    return _then(_$_PaginationState<T>(
      items: freezedTmp == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      isLoadingNextPage: null == isLoadingNextPage
          ? _value.isLoadingNextPage
          : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezedTmp == error ? _value.error : error,
      cursor: freezedTmp == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PaginationState<T> extends _PaginationState<T> {
  _$_PaginationState(
      {final List<T>? items, this.isLoadingNextPage = true, this.hasNextPage = true, this.error, this.cursor})
      : _items = items,
        super._();

  final List<T>? _items;

  @override
  List<T>? get items {
    final value = _items;
    if (value == null) return null;
    return _items;
  }

  @override
  final bool isLoadingNextPage;
  @override
  final bool hasNextPage;
  @override
  final Object? error;
  @override
  final String? cursor;

  @override
  String toString() {
    return 'PaginationState<$T>(items: $items, isLoadingNextPage: $isLoadingNextPage, hasNextPage: $hasNextPage, error: $error, cursor: $cursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationState<T> &&
            other._items == _items &&
            (identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage) &&
            (identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage) &&
            other.error == error &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, _items, isLoadingNextPage, hasNextPage, error, cursor);

  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationStateCopyWith<T, _$_PaginationState<T>> get copyWith =>
      __$$_PaginationStateCopyWithImpl<T, _$_PaginationState<T>>(this, _$identity);
}

abstract class _PaginationState<T> extends PaginationState<T> {
  factory _PaginationState(
      {final List<T>? items,
      final bool isLoadingNextPage,
      final bool hasNextPage,
      final Object? error,
      final String? cursor}) = _$_PaginationState<T>;

  _PaginationState._() : super._();

  @override
  List<T>? get items;

  @override
  bool get isLoadingNextPage;

  @override
  bool get hasNextPage;

  @override
  Object? get error;

  @override
  String? get cursor;

  @override
  _$$_PaginationStateCopyWith<T, _$_PaginationState<T>> get copyWith => throw _privateConstructorUsedError;
}
