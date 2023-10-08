# weatherapi

This package uses the [WeatherAPI.com API](https://www.weatherapi.com/) to get weather information.

You can retrieve the weather data by supplying either geographical coordinates or the name of a city.

[![pub package](https://img.shields.io/pub/v/weatherapi.svg)](https://pub.dartlang.org/packages/weatherapi)

## Installation (Flutter)

Add the package to your Flutter project by following these steps:
1. Open your project's `pubspec.yaml` file.
2. Locate the `dependencies` section in the file.
3. Add `weatherapi` as a dependency. You can specify the version, too.
```
dependencies:
  flutter:
    sdk: flutter
  weatherapi: ^1.0.0
```
4. After adding the dependency, save the `pubspec.yaml` file.
5. Run `flutter pub get` in your terminal or use the relevant option in your IDE to fetch the new dependency.

For help on adding dependencies, view the [pubspec documenation](https://flutter.io/using-packages/).

## Permissions

This package does not require any permissions. However, if you intend to retrieve the device's geolocation, it is recommended to use the [geolocator](https://pub.dev/packages/geolocator) plugin.

## Usage

First you need an API key from WeatherAPI.com, which can be acquired for free [here](https://www.weatherapi.com/signup.aspx/).

Next, an instance of a `WeatherRequest` must be created using the obtained API key.

```dart
import 'package:weatherapi/weatherapi.dart';

...

WeatherRequest wr = new WeatherRequest("YOUR_API_KEY");
```

Alternatively, you can also specify a language for the weather results.

```dart
WeatherRequest wr = new WeatherRequest("YOUR_API_KEY", language: Language.ITALIAN);
```

For all the supported languages, see the Languages section.

### Realtime API (current weather)

For specific documentation on the Realtime API, see the [WeatherAPI docs](https://www.weatherapi.com/docs/).

Realtime weather API allows a user to get up to date current weather information. The data is returned as a `RealtimeWeather` object.

The current weather can be queried either through a latitude and longitude or through a city name.

```dart
WeatherRequest wf = WeatherRequest("YOUR_API_KEY");

double latitude = 44.8;
double longitude = 10.33;

RealtimeWeather w = await wr.currentWeatherByLocation(lat, lon);
```

```dart
WeatherRequest wf = WeatherRequest("YOUR_API_KEY");

String cityName = 'Parma';

RealtimeWeather w = await wr.currentWeatherByCityName(cityName);
```

For a complete list of all the properties of the [Weather](https://pub.dartlang.org/documentation/weather/latest/weather/Weather-class.html) class, check the [documentation](https://pub.dartlang.org/documentation/weather/latest/weather/Weather-class.html)

### Forecast API

For specific documentation on the Forecast API, see the [WeatherAPI docs](https://www.weatherapi.com/docs/).

Forecast weather API allows a user to get up to date current weather forecast. The data is returned as a `ForecastWeather` object.

The forecast weather can be queried either through a latitude and longitude or through a city name.

```dart
WeatherRequest wf = WeatherRequest("YOUR_API_KEY");

double latitude = 44.8;
double longitude = 10.33;

ForecastWeather f = await wr.forecastWeatherByLocation(lat, lon);
```

```dart
WeatherRequest wf = WeatherRequest("YOUR_API_KEY");

String cityName = 'Parma';

ForecastWeather f = await wr.forecastWeatherByCityName(cityName);
```

### Search API

For specific documentation on the Search API, see the [WeatherAPI docs](https://www.weatherapi.com/docs/).

Search API allows a user to get a list of locations matching a provided search query. The data is returned as a list of `Location` objects.

The results can be queried either through a latitude and longitude or through a city name.

```dart
WeatherRequest wf = WeatherRequest("YOUR_API_KEY");

double latitude = 44.8;
double longitude = 10.33;

List<Location> r = await wr.searchByLocation(lat, lon);
```

```dart
WeatherRequest wf = WeatherRequest("YOUR_API_KEY");

String cityName = 'Parma';

List<Location> r = await wr.searchByCityName(cityName);
```

### Exceptions

An exception will be thrown for the following cases:

* The provided WeatherAPI key is invalid.
* A bad response was given by the API.

### Languages

The following languages are supported:

* `ARABIC`
* `BENGALI`
* `BULGARIAN`
* `CHINESE_SIMPLIFIED`
* `CHINESE_TRADITIONAL`
* `CZECH`
* `DANISH`
* `DUTCH`
* `FINNISH`
* `FRENCH`
* `GERMAN`
* `GREEK`
* `HINDI`
* `HUNGARIAN`
* `ITALIAN`
* `JAPANESE`
* `JAVANESE`
* `KOREAN`
* `MANDARIN`
* `MARATHI`
* `POLISH`
* `PORTUGUESE`
* `PUNJABI`
* `ROMANIAN`
* `RUSSIAN`
* `SERBIAN`
* `SINHALESE`
* `SLOVAK`
* `SPANISH`
* `SWEDISH`
* `TAMIL`
* `TELUGU`
* `TURKISH`
* `UKRAINIAN`
* `URDU`
* `VIETNAMESE`
* `WU_SHANGHAINESE`
* `XIANG`
* `YUE_CANTONESE`
* `ZULU`
