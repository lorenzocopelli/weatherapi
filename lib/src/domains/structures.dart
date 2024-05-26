/// A class to represent a location data.
class LocationData {
  final String? _name;
  final String? _region;
  final String? _country;
  final double? _lat;
  final double? _lon;
  final String? _tzId;
  final int? _localtimeEpoch;
  final String? _localtime;

  LocationData(this._name, this._region, this._country, this._lat, this._lon,
      this._tzId, this._localtimeEpoch, this._localtime);

  String? get name => _name;
  String? get region => _region;
  String? get country => _country;
  double? get lat => _lat;
  double? get lon => _lon;
  String? get tzId => _tzId;
  int? get localtimeEpoch => _localtimeEpoch;
  String? get localtime => _localtime;
}

/// A class to represent air quality data.
class AirQualityData {
  final double? _co;
  final double? _no2;
  final double? _o3;
  final double? _so2;
  final double? _pm2_5;
  final double? _pm10;
  final int? _usEpaIndex;
  final int? _gbDefraIndex;

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

/// A class to represent condition data.
class ConditionData {
  final String? _text;
  final String? _icon;
  final int? _code;

  ConditionData(this._text, this._icon, this._code);

  String? get text => _text;
  String? get icon => _icon;
  int? get code => _code;
}

/// A class to represent current weather data.
class CurrentWeatherData {
  final int? _lastUpdatedEpoch;
  final String? _lastUpdated;
  final double? _tempC;
  final double? _tempF;
  final int? _isDay;
  final ConditionData _condition;
  final double? _windMph;
  final double? _windKph;
  final int? _windDegree;
  final String? _windDir;
  final double? _pressureMb;
  final double? _pressureIn;
  final double? _precipMm;
  final double? _precipIn;
  final int? _humidity;
  final int? _cloud;
  final double? _feelslikeC;
  final double? _feelslikeF;
  final double? _visKm;
  final double? _visMiles;
  final double? _uv;
  final double? _gustMph;
  final double? _gustKph;
  final AirQualityData _airQuality;

  CurrentWeatherData(
      this._lastUpdatedEpoch,
      this._lastUpdated,
      this._tempC,
      this._tempF,
      this._isDay,
      this._condition,
      this._windMph,
      this._windKph,
      this._windDegree,
      this._windDir,
      this._pressureMb,
      this._pressureIn,
      this._precipMm,
      this._precipIn,
      this._humidity,
      this._cloud,
      this._feelslikeC,
      this._feelslikeF,
      this._visKm,
      this._visMiles,
      this._uv,
      this._gustMph,
      this._gustKph,
      this._airQuality);

  int? get lastUpdatedEpoch => _lastUpdatedEpoch;
  String? get lastUpdated => _lastUpdated;
  double? get tempC => _tempC;
  double? get tempF => _tempF;
  int? get isDay => _isDay;
  ConditionData get condition => _condition;
  double? get windMph => _windMph;
  double? get windKph => _windKph;
  int? get windDegree => _windDegree;
  String? get windDir => _windDir;
  double? get pressureMb => _pressureMb;
  double? get pressureIn => _pressureIn;
  double? get precipMm => _precipMm;
  double? get precipIn => _precipIn;
  int? get humidity => _humidity;
  int? get cloud => _cloud;
  double? get feelslikeC => _feelslikeC;
  double? get feelslikeF => _feelslikeF;
  double? get visKm => _visKm;
  double? get visMiles => _visMiles;
  double? get uv => _uv;
  double? get gustMph => _gustMph;
  double? get gustKph => _gustKph;
  AirQualityData get airQuality => _airQuality;
}

/// A class to represent forecast day condition data.
class DayConditionData {
  final String? _icon;

  DayConditionData(this._icon);

  String? get icon => _icon;
}

/// A class to represent forecast day data.
class DayData {
  final double? _maxtempC, _mintempC, _totalsnowCm;
  final int? _dailyChanceOfRain;
  final DayConditionData _condition;

  DayData(this._maxtempC, this._mintempC, this._totalsnowCm,
      this._dailyChanceOfRain, this._condition);

  double? get maxtempC => _maxtempC;
  double? get mintempC => _mintempC;
  double? get totalSnowCm => _totalsnowCm;
  int? get dailyChanceOfRain => _dailyChanceOfRain;
  DayConditionData get condition => _condition;
}

/// A class to represent forecast astro data.
class AstroData {
  final String? _sunrise, _sunset;
  final int? _isMoonUp, _isSunUp;

  AstroData(this._sunrise, this._sunset, this._isMoonUp, this._isSunUp);

  String? get sunrise => _sunrise;
  String? get sunset => _sunset;
  int? get isMoonUp => _isMoonUp;
  int? get isSunUp => _isSunUp;
}

/// A class to represent forecast hour data.
class HourData {
  final String? _time;
  final double? _tempC;
  final DayConditionData _condition;

  HourData(this._time, this._tempC, this._condition);

  String? get time => _time;
  double? get tempC => _tempC;
  DayConditionData get condition => _condition;
}

/// A class to represent forecast day data.
class ForecastDayData {
  final String? _date;
  final DayData _day;
  final AstroData _astro;
  final List<HourData> _hour;

  ForecastDayData(this._date, this._day, this._astro, this._hour);

  String? get date => _date;
  DayData get day => _day;
  AstroData get astro => _astro;
  List<HourData> get hour => _hour;
}

/// A class to represent forecast alerts.
class AlertData {
  final String? _headline,
      _msgtype,
      _severity,
      _urgency,
      _areas,
      _category,
      _certainty,
      _event,
      _note,
      _effective,
      _expires,
      _desc,
      _instruction;

  AlertData(
      this._headline,
      this._msgtype,
      this._severity,
      this._urgency,
      this._areas,
      this._category,
      this._certainty,
      this._event,
      this._note,
      this._effective,
      this._expires,
      this._desc,
      this._instruction);

  String? get headline => _headline;
  String? get msgtype => _msgtype;
  String? get severity => _severity;
  String? get urgency => _urgency;
  String? get areas => _areas;
  String? get category => _category;
  String? get certainty => _certainty;
  String? get event => _event;
  String? get note => _note;
  String? get effective => _effective;
  String? get expires => _expires;
  String? get desc => _desc;
  String? get instruction => _instruction;
}

/// A class to represent search results locations.
class LocationResultData {
  final int? _id;
  final String? _name, _region, _country, _url;
  final double? _lat, _lon;

  LocationResultData(this._id, this._name, this._region, this._country,
      this._lat, this._lon, this._url);

  int? get id => _id;
  String? get name => _name;
  String? get region => _region;
  String? get country => _country;
  String? get url => _url;
  double? get lat => _lat;
  double? get lon => _lon;
}
