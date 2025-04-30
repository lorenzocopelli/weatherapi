/// Custom exception for the library. An exception of this type is thrown
/// whenever the API responds with an error.
class WeatherAPIException implements Exception {
  /// Exception cause string.
  final String _cause;

  /// Class constructor.
  WeatherAPIException(this._cause);

  /// Override of the toString() method to display the exception cause.
  @override
  String toString() {
    return '$runtimeType: $_cause';
  }
}
