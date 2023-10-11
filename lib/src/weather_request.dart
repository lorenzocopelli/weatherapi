part of weatherapi_library;

// Types of API calls.
enum APIType
{
    realtime,
    forecast,
    search
}

// API types URLs.
Map<APIType, String> _apiTypeBaseUrls =
{
    APIType.realtime: 'https://api.weatherapi.com/v1/current.json',
    APIType.forecast: 'https://api.weatherapi.com/v1/forecast.json',
    APIType.search: 'https://api.weatherapi.com/v1/search.json'
};

/*
 * A class for fetching weather data in JSON format.
 */
class WeatherRequest
{
    final String _apiKey;
    final Language language;
    late http.Client _httpClient;

    WeatherRequest(this._apiKey, {this.language = Language.english})
    {
        _httpClient = http.Client();
    }

    // Fetch Realtime API data by location.
    Future<RealtimeWeather> getRealtimeWeatherByLocation(double latitude,
        double longitude, {bool airQualityIndex = false}) async
    {
        Map<String, dynamic>? jsonResponse = await _sendRequest(
            APIType.realtime, latitude: latitude, longitude: longitude,
            airQualityIndex: airQualityIndex);

        return RealtimeWeather(jsonResponse!);
    }

    // Fetch Realtime API data by city name.
    Future<RealtimeWeather> getRealtimeWeatherByCityName(String cityName,
        {bool airQualityIndex = false}) async
    {
        Map<String, dynamic>? jsonResponse = await _sendRequest(
            APIType.realtime, cityName: cityName,
            airQualityIndex: airQualityIndex);

        return RealtimeWeather(jsonResponse!);
    }

    Future<Map<String, dynamic>?> _sendRequest(APIType apiType,
        {String? cityName, double? latitude, double? longitude,
        bool airQualityIndex = false, int forecastDays = 1,
        bool alerts = false}) async
    {
        assert((cityName != null && cityName.isNotEmpty) ||
            (latitude != null && longitude != null));
        assert(forecastDays >= 1 && forecastDays <= 10);

        String url = _buildUrl(apiType, cityName, latitude, longitude,
            airQualityIndex, forecastDays, alerts);

        // Send HTTP get request.
        http.Response response = await _httpClient.get(Uri.parse(url));
        Map<String, dynamic>? jsonBody = json.decode(response.body);

        if (response.statusCode != 200)
        {
            throw WeatherAPIException(jsonBody!['error']['message']);
        }

        return jsonBody;
    }

    String _buildUrl(APIType apiType, String? cityName, double? latitude,
        double? longitude, bool airQualityIndex, int forecastDays, bool alerts)
    {
        assert((cityName != null && cityName.isNotEmpty) ||
            (latitude != null && longitude != null));
        assert(forecastDays >= 1 && forecastDays <= 10);

        String url = '${_apiTypeBaseUrls[apiType]}?';
        url += 'key=$_apiKey';
        
        if (language != Language.english)
        {
            url += '&lang=${_languageCodes[language]}';
        }

        if (cityName != null)
        {
            url += '&q=$cityName';
        }
        else
        {
            url += '&q=$latitude,$longitude';
        }

        // Append other parameters based on the API type.

        if (apiType == APIType.realtime)
        {
            if (airQualityIndex == true)
            {
                url += '&aqi=yes';
            }
        }
        else if (apiType == APIType.forecast)
        {
            if (airQualityIndex == true)
            {
                url += '&aqi=yes';
            }

            url += '&days=$forecastDays';

            if (alerts == true)
            {
                url += '&alerts=yes';
            }
        }

        return url;
    }
}
