# WeatherAPI example

First you need an API key from WeatherAPI.com, which can be acquired for free [here](https://www.weatherapi.com/signup.aspx/). Then, import the library:

```dart
import 'package:weatherapi/weatherapi.dart';
```

Create a new request (default language: English):

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');
```

Alternatively, you can also specify a language:

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY', language: Language.italian);
```

Now you can retrieve weather information.

```dart
String cityName = 'Parma';
double latitude = 44.8;
double longitude = 10.33;
```

## Realtime API

Get realtime weather by city name:

```dart
RealtimeWeather rw = await wr.getRealtimeWeatherByCityName(cityName);
print('Condition: ${rw.current.condition.text}');
```

Get realtime weather by latitude and longitude:

```dart
RealtimeWeather rw = await wr.getRealtimeWeatherByLocation(latitude, longitude);
print('Condition: ${rw.current.condition.text}');
```

## Forecast API

Get forecast weather by city name.

```dart
ForecastWeather fw = await wr.getForecastWeatherByCityName(cityName);
print('Tomorrow sunrise: ${fw.forecast[1].astro.sunrise}');
```

Get forecast weather by latitude and longitude.

```dart
ForecastWeather fw = await wr.getForecastWeatherByLocation(latitude, longitude);
print('Tomorrow sunrise: ${fw.forecast[1].astro.sunrise}');
```

## Search/Autocomplete API

Get location results by city name.

```dart
SearchResults sr = await wr.getResultsByCityName(cityName);
print('First result: ${sr.locations[0].name}');
```

Get location results by latitude and longitude.

```dart
SearchResults sr = await wr.getResultsByLocation(latitude, longitude);
print('First result: ${sr.locations[0].name}');
```
