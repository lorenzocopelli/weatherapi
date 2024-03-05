/// Custom Exception for the library.
/// An exception of this type is thrown whenever the API responds with an
/// error.
class WeatherAPIException implements Exception {
  final String _cause;

  WeatherAPIException(this._cause);

  @override
  String toString() {
    return '$runtimeType: $_cause';
  }
}
