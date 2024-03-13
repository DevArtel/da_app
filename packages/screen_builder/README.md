# Revised README for `screen_builder` Package

The `screen_builder` package is designed to streamline the development of Flutter screens by handling different UI
states (loading, error, data) efficiently, when using Riverpod alongside with `AsyncValue`.

## Features

- **PageStateBuilder & PageStateBuilderSliver**: Widgets for rendering UI based on page state (loading, error, data).
- **PaginationBuilder**: Manages pagination UI and logic.
- **State Banners**: Display loading and error states.

## Getting Started

Add `screen_builder` as a dependency in your `pubspec.yaml`:

```yaml
dependencies:
  screen_builder: ^1.0.0
```

Ensure Riverpod is added to your project, as `screen_builder` uses it for state management.

## Usage

### PageStateBuilder

`PageStateBuilder` requires a `PageState` object and renders UI based on the current state.

Define a `PageState`:

```dart
final myPageStateProvider = StateProvider<PageState<MyDataType>>((ref) {
  return PageState.loading();
});
```


Use `PageStateBuilder` in your widget tree:
```dart
PageStateBuilder<MyDataType>(
state: ref.watch(myPageStateProvider),
onRetryPressed: () {
// Retry logic
},
dataBuilder: (context, data) {
// Data widget
},
);
```


### `.toPageState` Extension

The `.toPageState` extension converts `AsyncValue` to `PageState`, simplifying state management with Riverpod.

```dart
extension PageStateAsyncValueExt<T> on AsyncValue<T> {
  PageState<T> get toPageState =>
      when(
        data: (data) => PageState.data(data),
        error: (error,) => PageState.error(error), loading: PageState.loading,);
}
```

Use `.toPageState` with `PageStateBuilder`:

```dart
final myDataState = ref.watch(myDataProvider);
PageStateBuilder<MyDataType>(
state
:
myDataState
.
toPageState
, // Other parameters...);
```

## Contributing

Contributions are welcome. Feel free to open issues or submit pull requests on the repository.

## License

`screen_builder` is available under the MIT License.