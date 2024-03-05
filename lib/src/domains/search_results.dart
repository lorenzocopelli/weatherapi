import 'structures.dart';

/// A class for storing Search/Autocomplete API response data.
class SearchResults {
  late final List<LocationResultData> _locations;

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

  List<LocationResultData> get locations => _locations;
}
