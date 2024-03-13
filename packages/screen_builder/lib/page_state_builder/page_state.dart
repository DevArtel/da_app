import 'package:flutter/material.dart';

class PageState<T> {
  PageState._({this.data, this.error, this.loading}) {
    assert(data == null || error == null && loading == null, "Only one parameter can be not null");
    assert(error == null || data == null && loading == null, "Only one parameter can be not null");
    assert(loading == null || error == null && data == null, "Only one parameter can be not null");
  }

  final T? data;
  final Object? error;
  final bool? loading;

  factory PageState.data(T data) => PageState._(data: data);

  factory PageState.loading() => PageState._(loading: true);

  factory PageState.error(Object error, [StackTrace? stackTrace]) => PageState._(error: error);

  Widget when({
    required Widget Function() loading,
    required Widget Function(Object error) error,
    required Widget Function(T data) data,
  }) {
    final dataValue = this.data;
    final errorValue = this.error;
    final loadingValue = this.loading;

    if (dataValue != null) {
      return data(dataValue);
    } else if (errorValue != null) {
      return error(errorValue);
    } else if (loadingValue == true) {
      return loading();
    } else {
      throw Exception('Illegal state one of [this.data, this.error, this.loading] must not be null');
    }
  }
}
