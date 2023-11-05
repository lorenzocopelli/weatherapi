part of weatherapi_library;

/*
 * A class for storing Realtime API response data.
 */
class RealtimeWeather {
  late final LocationData _location;
  late final CurrentWeatherData _current;

  RealtimeWeather(Map<String, dynamic> jsonData) {
    // - Location.

    Map<String, dynamic>? jsonLocation = jsonData['location'];

    _location = LocationData(
        jsonLocation?['name'],
        jsonLocation?['region'],
        jsonLocation?['country'],
        jsonLocation?['lat'],
        jsonLocation?['lon'],
        jsonLocation?['tz_id'],
        jsonLocation?['localtime_epoch'],
        jsonLocation?['localtime']);

    // - Current.

    Map<String, dynamic>? jsonCurrentWeather = jsonData['current'];

    // -- Condition.

    Map<String, dynamic>? jsonCurrentWeatherCondition =
        jsonCurrentWeather?['condition'];

    ConditionData condition = ConditionData(
        jsonCurrentWeatherCondition?['text'],
        jsonCurrentWeatherCondition?['icon']);

    // -- Air Quality.

    Map<String, dynamic>? jsonCurrentWeatherAirQuality =
        jsonCurrentWeather?['air_quality'];

    AirQualityData airQuality = AirQualityData(
        jsonCurrentWeatherAirQuality?['co'],
        jsonCurrentWeatherAirQuality?['no2'],
        jsonCurrentWeatherAirQuality?['o3'],
        jsonCurrentWeatherAirQuality?['so2'],
        jsonCurrentWeatherAirQuality?['pm2_5'],
        jsonCurrentWeatherAirQuality?['pm10'],
        jsonCurrentWeatherAirQuality?['us-epa-index'],
        jsonCurrentWeatherAirQuality?['gb-defra-index']);

    _current = CurrentWeatherData(
        jsonCurrentWeather?['temp_c'],
        condition,
        jsonCurrentWeather?['wind_kph'],
        jsonCurrentWeather?['wind_dir'],
        jsonCurrentWeather?['pressure_mb'],
        jsonCurrentWeather?['precip_mm'],
        jsonCurrentWeather?['humidity'],
        jsonCurrentWeather?['cloud'],
        jsonCurrentWeather?['feelslike_c'],
        jsonCurrentWeather?['uv'],
        airQuality);
  }

  LocationData get location => _location;
  CurrentWeatherData get current => _current;
}
