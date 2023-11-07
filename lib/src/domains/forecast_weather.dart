part of weatherapi_library;

/// A class for storing Forecast API response data.
class ForecastWeather {
  late final LocationData _location;
  late final CurrentWeatherData _current;
  late final List<ForecastDayData> _forecast;
  late final List<AlertData> _alerts;

  ForecastWeather(Map<String, dynamic> jsonData) {
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

    // - Forecast.

    Map<String, dynamic>? jsonForecast = jsonData['forecast'];

    // -- Forecast Day.

    List<dynamic>? jsonForecastDays = jsonForecast?['forecastday'];

    _forecast = [];

    jsonForecastDays?.forEach((jsonForecastDay) {
      // --- Day.

      Map<String, dynamic>? jsonDay = jsonForecastDay['day'];

      // ---- Condition.

      Map<String, dynamic>? jsonDayCondition = jsonDay?['condition'];

      DayConditionData dayCondition =
          DayConditionData(jsonDayCondition?['icon']);

      DayData day = DayData(
          jsonDay?['maxtemp_c'],
          jsonDay?['mintemp_c'],
          jsonDay?['totalsnow_cm'],
          jsonDay?['daily_chance_of_rain'],
          dayCondition);

      // --- Astro.

      Map<String, dynamic>? jsonDayAstro = jsonForecastDay?['astro'];

      AstroData astro = AstroData(
          jsonDayAstro?['sunrise'],
          jsonDayAstro?['sunset'],
          jsonDayAstro?['is_moon_up'],
          jsonDayAstro?['is_sun_up']);

      // --- Hour.

      List<dynamic>? jsonForecastHour = jsonForecastDay?['hour'];
      List<HourData> hours = [];

      jsonForecastHour?.forEach((jsonHour) {
        // ---- Condition.

        Map<String, dynamic>? jsonHourCondition = jsonHour['condition'];

        DayConditionData hourCondition =
            DayConditionData(jsonHourCondition?['icon']);

        HourData hour =
            HourData(jsonHour['time'], jsonHour['temp_c'], hourCondition);

        hours.add(hour);
      });

      ForecastDayData forecast =
          ForecastDayData(jsonForecastDay?['date'], day, astro, hours);

      _forecast.add(forecast);
    });

    // - Alerts.

    Map<String, dynamic>? jsonAlerts = jsonData['alerts'];

    // -- Alert.

    List<dynamic>? jsonAlertList = jsonAlerts?['alert'];

    _alerts = [];

    jsonAlertList?.forEach((jsonAlert) {
      AlertData alert = AlertData(
          jsonAlert['headline'],
          jsonAlert['msgtype'],
          jsonAlert['severity'],
          jsonAlert['urgency'],
          jsonAlert['areas'],
          jsonAlert['category'],
          jsonAlert['certainty'],
          jsonAlert['event'],
          jsonAlert['note'],
          jsonAlert['effective'],
          jsonAlert['expires'],
          jsonAlert['desc'],
          jsonAlert['instruction']);

      _alerts.add(alert);
    });
  }

  LocationData get location => _location;
  CurrentWeatherData get current => _current;
  List<ForecastDayData> get forecast => _forecast;
  List<AlertData> get alerts => _alerts;
}
