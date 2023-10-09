part of weatherapi_library;

/*
 * A class for fetching weather data in JSON format.
 */
class WeatherRequest
{
    String _apiKey;
    late Language language;
    late http.Client _httpClient;

    WeatherRequest(this._apiKey, {this.language = Language.english})
    {
        _httpClient = http.Client();
    }

    // Fetch Realtime API weather.
    
}
