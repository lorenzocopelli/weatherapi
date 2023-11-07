# WeatherAPI example

First you need an API key from WeatherAPI.com, which can be acquired for free [here](https://www.weatherapi.com/signup.aspx/).

```dart
import 'package:flutter/foundation.dart';
import 'package:weatherapi/weatherapi.dart';

void main() async
{
    // Create a new request (default language: English).
    WeatherRequest wr = WeatherRequest('YOUR_API_KEY');

    String cityName = 'Parma';
    double latitude = 44.8;
    double longitude = 10.33;

    /* Realtime API. */

    // Get realtime weather by city name.
    RealtimeWeather realtimeWeatherCN = await wr.getRealtimeWeatherByCityName(cityName);
    debugPrint('Condition: ${realtimeWeatherCN.current.condition.text}');

    // Get realtime weather by latitude and longitude.
    RealtimeWeather realtimeWeatherLL = await wr.getRealtimeWeatherByLocation(latitude, longitude);
    debugPrint('Condition: ${realtimeWeatherLL.current.condition.text}');

    /* Forecast API. */

    // Get forecast weather by city name.
    ForecastWeather forecastWeatherCN = await wr.getForecastWeatherByCityName(cityName);
    debugPrint('Tomorrow sunrise: ${forecastWeatherCN.forecast[1].astro.sunrise}');

    // Get forecast weather by latitude and longitude.
    ForecastWeather forecastWeatherLL = await wr.getForecastWeatherByLocation(latitude, longitude);
    debugPrint('Tomorrow sunrise: ${forecastWeatherLL.forecast[1].astro.sunrise}');

    /* Search/Autocomplete API. */

    // Get location results by city name.
    SearchResults lrCN = await wr.getResultsByCityName(cityName);
    debugPrint('First result: ${lrCN.locations[0].name}');

    // Get location results by latitude and longitude.
    SearchResults lrLL = await wr.getResultsByLocation(latitude, longitude);
    debugPrint('First result: ${lrCN.locations[0].name}');

    /* Multi-language requests. */

    // Create a new request using Italian as language.
    WeatherRequest wrIT = WeatherRequest('YOUR_API_KEY', language: Language.italian);
    
    RealtimeWeather realtimeWeatherIT = await wrIT.getRealtimeWeatherByCityName(cityName);
    debugPrint('Condition: ${realtimeWeatherIT.current.condition.text}');
}
```
