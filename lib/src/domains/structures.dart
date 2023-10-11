part of weatherapi_library;

/*
 * A class to represent a location data.
 */
class LocationData
{
    final String? _name, _region, _country, _tzId, _localtime;
    final double? _lat, _lon;
    final int? _localtimeEpoch;

    LocationData(this._name, this._region, this._country, this._lat, this._lon,
        this._tzId, this._localtimeEpoch, this._localtime);

    String? get name => _name;
    String? get region => _region;
    String? get country => _country;
    String? get tzId => _tzId;
    String? get localtime => _localtime;
    double? get lat => _lat;
    double? get lon => _lon;
    int? get localtimeEpoch => _localtimeEpoch;
}

/*
 * A class to represent air quality data.
 */
class AirQualityData
{
    final double? _co, _no2, _o3, _so2, _pm2_5, _pm10;
    final int? _usEpaIndex, _gbDefraIndex;

    AirQualityData(this._co, this._no2, this._o3, this._so2, this._pm2_5,
        this._pm10, this._usEpaIndex, this._gbDefraIndex);

    double? get co => _co;
    double? get no2 => _no2;
    double? get o3 => _o3;
    double? get so2 => _so2;
    double? get pm2_5 => _pm2_5;
    double? get pm10 => _pm10;
    int? get usEpaIndex => _usEpaIndex;
    int? get gbDefraIndex => _gbDefraIndex;
}

/*
 * A class to represent condition data.
 */
class ConditionData
{
    final String? _text, _icon;

    ConditionData(this._text, this._icon);

    String? get text => _text;
    String? get icon => _icon;
}

/*
 * A class to represent current weather data.
 */
class CurrentWeatherData
{
    final double? _tempC, _windKph, _pressureMb, _precipMm, _feelslikeC, _uv;
    final ConditionData _condition;
    final String? _windDir;
    final int? _humidity, _cloud;
    final AirQualityData _airQuality;

    CurrentWeatherData(this._tempC, this._condition, this._windKph,
        this._windDir, this._pressureMb, this._precipMm, this._humidity,
        this._cloud, this._feelslikeC, this._uv, this._airQuality);

    double? get tempC => _tempC;
    double? get windKph => _windKph;
    double? get pressureMb => _pressureMb;
    double? get precipMm => _precipMm;
    double? get feelslikeC => _feelslikeC;
    double? get uv => _uv;
    ConditionData get condition => _condition;
    String? get windDir => _windDir;
    int? get humidity => _humidity;
    int? get cloud => _cloud;
    AirQualityData get airQuality => _airQuality;
}
