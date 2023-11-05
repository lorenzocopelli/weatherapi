part of weatherapi_library;

// Types of API calls.
enum APIType { realtime, forecast, search }

// API types URLs.
Map<APIType, String> _apiTypeBaseUrls = {
  APIType.realtime: 'https://api.weatherapi.com/v1/current.json',
  APIType.forecast: 'https://api.weatherapi.com/v1/forecast.json',
  APIType.search: 'https://api.weatherapi.com/v1/search.json'
};

/*
 * A class for fetching weather data in JSON format.
 */
class WeatherRequest {
  final String _apiKey;
  final Language language;
  late final http.Client _httpClient;

  WeatherRequest(this._apiKey, {this.language = Language.english}) {
    _httpClient = http.Client();
  }

  // Fetch Realtime API data by location.
  Future<RealtimeWeather> getRealtimeWeatherByLocation(
      double latitude, double longitude,
      {bool airQualityIndex = false}) async {
    Map<String, dynamic>? jsonResponse =
        await _sendRequest<Map<String, dynamic>>(APIType.realtime,
            latitude: latitude,
            longitude: longitude,
            airQualityIndex: airQualityIndex);

    return RealtimeWeather(jsonResponse!);
  }

  // Fetch Realtime API data by city name.
  Future<RealtimeWeather> getRealtimeWeatherByCityName(String cityName,
      {bool airQualityIndex = false}) async {
    Map<String, dynamic>? jsonResponse =
        await _sendRequest<Map<String, dynamic>>(APIType.realtime,
            cityName: cityName, airQualityIndex: airQualityIndex);

    return RealtimeWeather(jsonResponse!);
  }

  // Fetch Forecast API data by location.
  Future<ForecastWeather> getForecastWeatherByLocation(
      double latitude, double longitude,
      {int forecastDays = 1,
      bool airQualityIndex = false,
      bool alerts = false}) async {
    Map<String, dynamic>? jsonResponse =
        await _sendRequest<Map<String, dynamic>>(APIType.forecast,
            latitude: latitude,
            longitude: longitude,
            forecastDays: forecastDays,
            airQualityIndex: airQualityIndex,
            alerts: alerts);

    return ForecastWeather(jsonResponse!);
  }

  // Fetch Forecast API data by city name.
  Future<ForecastWeather> getForecastWeatherByCityName(String cityName,
      {int forecastDays = 1,
      bool airQualityIndex = false,
      bool alerts = false}) async {
    Map<String, dynamic>? jsonResponse =
        await _sendRequest<Map<String, dynamic>>(APIType.forecast,
            cityName: cityName,
            forecastDays: forecastDays,
            airQualityIndex: airQualityIndex,
            alerts: alerts);

    return ForecastWeather(jsonResponse!);
  }

  // Fetch Search/Autocomplete API data by location.
  Future<SearchResults> getResultsByLocation(
      double latitude, double longitude) async {
    List<dynamic>? jsonResponse = await _sendRequest<List<dynamic>>(
        APIType.search,
        latitude: latitude,
        longitude: longitude);

    return SearchResults(jsonResponse!);
  }

  // Fetch Search/Autocomplete API data by city name.
  Future<SearchResults> getResultsByCityName(String cityName) async {
    List<dynamic>? jsonResponse =
        await _sendRequest<List<dynamic>>(APIType.search, cityName: cityName);

    return SearchResults(jsonResponse!);
  }

  Future<ReturnType?> _sendRequest<ReturnType>(APIType apiType,
      {String? cityName,
      double? latitude,
      double? longitude,
      bool airQualityIndex = false,
      int forecastDays = 1,
      bool alerts = false}) async {
    assert((cityName != null && cityName.isNotEmpty) ||
        (latitude != null && longitude != null));
    assert(
        forecastDays >= _minForecastDays && forecastDays <= _maxForecastDays);

    String url = _buildUrl(apiType, cityName, latitude, longitude,
        airQualityIndex, forecastDays, alerts);

    // Send HTTP get request.
    http.Response response = await _httpClient.get(Uri.parse(url));
    dynamic jsonBody = json.decode(response.body);

    if (response.statusCode != _httpStatusOk) {
      throw WeatherAPIException(jsonBody!['error']['message']);
    }

    return jsonBody as ReturnType;
  }

  String _buildUrl(APIType apiType, String? cityName, double? latitude,
      double? longitude, bool airQualityIndex, int forecastDays, bool alerts) {
    assert((cityName != null && cityName.isNotEmpty) ||
        (latitude != null && longitude != null));
    assert(
        forecastDays >= _minForecastDays && forecastDays <= _maxForecastDays);

    String url = '${_apiTypeBaseUrls[apiType]}?';
    url += 'key=$_apiKey';

    if (language != Language.english) {
      url += '&lang=${_languageCodes[language]}';
    }

    if (cityName != null) {
      url += '&q=$cityName';
    } else {
      url += '&q=$latitude,$longitude';
    }

    // Append other parameters based on the API type.

    if (apiType == APIType.realtime) {
      if (airQualityIndex == true) {
        url += '&aqi=yes';
      }
    } else if (apiType == APIType.forecast) {
      if (airQualityIndex == true) {
        url += '&aqi=yes';
      }

      url += '&days=$forecastDays';

      if (alerts == true) {
        url += '&alerts=yes';
      }
    }

    return url;
  }
}
