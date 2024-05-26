# WeatherAPI

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
  weatherapi: ^1.1.0
```
4. After adding the dependency, save the `pubspec.yaml` file.
5. Run `flutter pub get` in your terminal or use the relevant option in your IDE to fetch the new dependency.

For help on adding dependencies, view the [pubspec documenation](https://flutter.io/using-packages/).

## Permissions

This package does not require any permissions. However, if you intend to retrieve the device's geolocation, it is recommended to use the [geolocator](https://pub.dev/packages/geolocator) plugin.

## Usage

First you need an API key from WeatherAPI.com, which can be acquired for free [here](https://www.weatherapi.com/signup.aspx/). Then, import the library.

```dart
import 'package:weatherapi/weatherapi.dart';
```

Next, an instance of a `WeatherRequest` must be created using the obtained API key.

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');
```

Alternatively, you can also specify a language for the weather results.

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY', language: Language.italian);
```

For all the supported languages, see the Languages section.

### Realtime API (current weather)

For specific documentation on the Realtime API, see the [WeatherAPI docs](https://www.weatherapi.com/docs/).

Realtime weather API allows a user to get up to date current weather information. The data is returned as a `RealtimeWeather` object.

The current weather can be queried either through a city name or through a latitude and longitude.

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');

String cityName = 'Parma';

RealtimeWeather rw = await wr.getRealtimeWeatherByCityName(cityName);
```

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');

double latitude = 44.8;
double longitude = 10.33;

RealtimeWeather rw = await wr.getRealtimeWeatherByLocation(latitude, longitude);
```

### Forecast API

For specific documentation on the Forecast API, see the [WeatherAPI docs](https://www.weatherapi.com/docs/).

Forecast weather API allows a user to get up to date current weather forecast. The data is returned as a `ForecastWeather` object.

The forecast weather can be queried either through a city name or a through latitude and longitude.

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');

String cityName = 'Parma';

ForecastWeather fw = await wr.getForecastWeatherByCityName(cityName);
```

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');

double latitude = 44.8;
double longitude = 10.33;

ForecastWeather fw = await wr.getForecastWeatherByLocation(latitude, longitude);
```

### Search/Autocomplete API

For specific documentation on the Search/Autocomplete API, see the [WeatherAPI docs](https://www.weatherapi.com/docs/).

Search/Autocomplete API allows a user to get a list of locations matching a provided search query. The data is returned as a `SearchResults` object.

The results can be queried either through a city name or through a latitude and longitude.

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');

String cityName = 'Parma';

SearchResults sr = await wr.getResultsByCityName(cityName);

for (LocationResultData location in sr.locations) { /* ... */ }
```

```dart
WeatherRequest wr = WeatherRequest('YOUR_API_KEY');

double latitude = 44.8;
double longitude = 10.33;

SearchResults sr = await wr.getResultsByLocation(latitude, longitude);

for (LocationResultData location in sr.locations) { /* ... */ }
```

### Exceptions

An exception will be thrown in the following cases:

* The provided WeatherAPI.com key is invalid.
* A bad response was given by the API.

### Languages

The supported languages are as follows:

* `arabic`
* `bengali`
* `bulgarian`
* `chineseSimplified`
* `chineseTraditional`
* `czech`
* `danish`
* `dutch`
* `finnish`
* `french`
* `german`
* `greek`
* `hindi`
* `hungarian`
* `italian`
* `japanese`
* `javanese`
* `korean`
* `mandarin`
* `marathi`
* `polish`
* `portuguese`
* `punjabi`
* `romanian`
* `russian`
* `serbian`
* `sinhalese`
* `slovak`
* `spanish`
* `swedish`
* `tamil`
* `telugu`
* `turkish`
* `ukrainian`
* `urdu`
* `vietnamese`
* `wuShanghainese`
* `xiang`
* `yueCantonese`
* `zulu`

The default language is English.
