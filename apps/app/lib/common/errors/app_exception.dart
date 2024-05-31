/// Base class for all exceptions thrown by the application.
class AppException implements Exception {
  const AppException([this.message = '']);

  final String message;

  @override
  String toString() => 'AppException: $message';
}
