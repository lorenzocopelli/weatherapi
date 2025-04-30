import 'structures.dart';

/// A class for storing Search/Autocomplete API response data.
class SearchResults {
  /// Locations result data list.
  late final List<LocationResultData> _locations;

  /// Class constructor.
  SearchResults(List<dynamic> jsonData) {
    _locations = [];

    for (dynamic location in jsonData) {
      LocationResultData result = LocationResultData(
          location['id'],
          location['name'],
          location['region'],
          location['country'],
          location['lat'],
          location['lon'],
          location['url']);

      _locations.add(result);
    }
  }

  /// Getter for location result data list.
  List<LocationResultData> get locations => _locations;
}
