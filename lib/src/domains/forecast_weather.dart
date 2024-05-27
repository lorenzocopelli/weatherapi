import 'structures.dart';

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
        jsonCurrentWeatherCondition?['icon'],
        jsonCurrentWeatherCondition?['code']);

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
        jsonCurrentWeather?['last_updated_epoch'],
        jsonCurrentWeather?['last_updated'],
        jsonCurrentWeather?['temp_c'],
        jsonCurrentWeather?['temp_f'],
        jsonCurrentWeather?['is_day'],
        condition,
        jsonCurrentWeather?['wind_mph'],
        jsonCurrentWeather?['wind_kph'],
        jsonCurrentWeather?['wind_degree'],
        jsonCurrentWeather?['wind_dir'],
        jsonCurrentWeather?['pressure_mb'],
        jsonCurrentWeather?['pressure_in'],
        jsonCurrentWeather?['precip_mm'],
        jsonCurrentWeather?['precip_in'],
        jsonCurrentWeather?['humidity'],
        jsonCurrentWeather?['cloud'],
        jsonCurrentWeather?['feelslike_c'],
        jsonCurrentWeather?['feelslike_f'],
        jsonCurrentWeather?['vis_km'],
        jsonCurrentWeather?['vis_miles'],
        jsonCurrentWeather?['uv'],
        jsonCurrentWeather?['gust_mph'],
        jsonCurrentWeather?['gust_kph'],
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

      ConditionData dayCondition = ConditionData(jsonDayCondition?['text'],
          jsonDayCondition?['icon'], jsonDayCondition?['code']);

      DayData day = DayData(
          jsonDay?['maxtemp_c'],
          jsonDay?['maxtemp_f'],
          jsonDay?['mintemp_c'],
          jsonDay?['mintemp_f'],
          jsonDay?['avgtemp_c'],
          jsonDay?['avgtemp_f'],
          jsonDay?['maxwind_mph'],
          jsonDay?['maxwind_kph'],
          jsonDay?['totalprecip_mm'],
          jsonDay?['totalprecip_in'],
          jsonDay?['totalsnow_cm'],
          jsonDay?['avgvis_km'],
          jsonDay?['avgvis_miles'],
          jsonDay?['avghumidity'],
          jsonDay?['daily_will_it_rain'],
          jsonDay?['daily_chance_of_rain'],
          jsonDay?['daily_will_it_snow'],
          jsonDay?['daily_chance_of_snow'],
          dayCondition,
          jsonDay?['uv']);

      // --- Astro.

      Map<String, dynamic>? jsonDayAstro = jsonForecastDay?['astro'];

      AstroData astro = AstroData(
          jsonDayAstro?['sunrise'],
          jsonDayAstro?['sunset'],
          jsonDayAstro?['moonrise'],
          jsonDayAstro?['moonset'],
          jsonDayAstro?['moon_phase'],
          jsonDayAstro?['moon_illumination'],
          jsonDayAstro?['is_moon_up'],
          jsonDayAstro?['is_sun_up']);

      // --- Hour.

      List<dynamic>? jsonForecastHour = jsonForecastDay?['hour'];
      List<HourData> hours = [];

      jsonForecastHour?.forEach((jsonHour) {
        // ---- Condition.

        Map<String, dynamic>? jsonHourCondition = jsonHour['condition'];

        ConditionData hourCondition = ConditionData(jsonHourCondition?['text'],
            jsonHourCondition?['icon'], jsonHourCondition?['code']);

        HourData hour = HourData(
            jsonHour['time_epoch'],
            jsonHour['time'],
            jsonHour['temp_c'],
            jsonHour['temp_f'],
            jsonHour['is_day'],
            hourCondition,
            jsonHour['wind_mph'],
            jsonHour['wind_kph'],
            jsonHour['wind_degree'],
            jsonHour['wind_dir'],
            jsonHour['pressure_mb'],
            jsonHour['pressure_in'],
            jsonHour['precip_mm'],
            jsonHour['precip_in'],
            jsonHour['snow_cm'],
            jsonHour['humidity'],
            jsonHour['cloud'],
            jsonHour['feelslike_c'],
            jsonHour['feelslike_f'],
            jsonHour['windchill_c'],
            jsonHour['windchill_f'],
            jsonHour['heatindex_c'],
            jsonHour['heatindex_f'],
            jsonHour['dewpoint_c'],
            jsonHour['dewpoint_f'],
            jsonHour['will_it_rain'],
            jsonHour['chance_of_rain'],
            jsonHour['will_it_snow'],
            jsonHour['chance_of_snow'],
            jsonHour['vis_km'],
            jsonHour['vis_miles'],
            jsonHour['gust_mph'],
            jsonHour['gust_kph'],
            jsonHour['uv']);

        hours.add(hour);
      });

      ForecastDayData forecast = ForecastDayData(jsonForecastDay?['date'],
          jsonForecastDay?['date_epoch'], day, astro, hours);

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
