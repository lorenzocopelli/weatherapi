/// A class to represent location data.
class LocationData {
  /// Location name.
  final String? _name;

  /// Region or state of the location, if available.
  final String? _region;

  /// Location country.
  final String? _country;

  /// Latitude in decimal degrees.
  final double? _lat;

  /// Longitude in decimal degrees.
  final double? _lon;

  /// Time zone name.
  final String? _tzId;

  /// Local date and time in UNIX time.
  final int? _localtimeEpoch;

  /// Local date and time.
  final String? _localtime;

  /// Class constructor.
  LocationData(this._name, this._region, this._country, this._lat, this._lon,
      this._tzId, this._localtimeEpoch, this._localtime);

  /// Getter for location name.
  String? get name => _name;

  /// Getter for region or state of the location.
  String? get region => _region;

  /// Getter for locarion country.
  String? get country => _country;

  /// Getter for latitude.
  double? get lat => _lat;

  /// Getter for longitude.
  double? get lon => _lon;

  /// Getter for time zone name.
  String? get tzId => _tzId;

  /// Getter for local date and time in UNIX format.
  int? get localtimeEpoch => _localtimeEpoch;

  /// Getter for local date and time.
  String? get localtime => _localtime;
}

/// A class to represent air quality data.
class AirQualityData {
  /// Carbon Monoxide (μg/m3).
  final double? _co;

  /// Ozone (μg/m3).
  final double? _no2;

  /// Nitrogen dioxide (μg/m3).
  final double? _o3;

  /// Sulphur dioxide (μg/m3).
  final double? _so2;

  /// PM2.5 (μg/m3).
  final double? _pm2_5;

  /// PM10 (μg/m3).
  final double? _pm10;

  /// US - EPA standard.
  final int? _usEpaIndex;

  /// UK Defra Index.
  final int? _gbDefraIndex;

  /// Class constructor.
  AirQualityData(this._co, this._no2, this._o3, this._so2, this._pm2_5,
      this._pm10, this._usEpaIndex, this._gbDefraIndex);

  /// Getter for Carbon Monoxide.
  double? get co => _co;

  /// Getter for Ozone.
  double? get no2 => _no2;

  /// Getter for Nitrogen dioxide.
  double? get o3 => _o3;

  /// Getter for Sulphur dioxide.
  double? get so2 => _so2;

  /// Getter for PM2.5.
  double? get pm2_5 => _pm2_5;

  /// Getter for PM10.
  double? get pm10 => _pm10;

  /// Getter for US - EPA standard.
  int? get usEpaIndex => _usEpaIndex;

  /// Getter for UK Defra Index.
  int? get gbDefraIndex => _gbDefraIndex;
}

/// A class to represent condition data.
class ConditionData {
  /// Weather condition text.
  final String? _text;

  /// Weather icon URL.
  final String? _icon;

  /// Weather condition unique code.
  final int? _code;

  /// Class constructor.
  ConditionData(this._text, this._icon, this._code);

  /// Getter for weather condition text.
  String? get text => _text;

  /// Getter for weather icon URL.
  String? get icon => _icon;

  /// Getter for weather condition unique code.
  int? get code => _code;
}

/// A class to represent current weather data.
class CurrentWeatherData {
  /// Local time when the real time data was updated in UNIX time.
  final int? _lastUpdatedEpoch;

  /// Local time when the real time data was updated.
  final String? _lastUpdated;

  /// Temperature in Celsius.
  final double? _tempC;

  /// Temperature in Fahrenheit.
  final double? _tempF;

  /// Flag: 1 = Yes 0 = No.
  final int? _isDay;

  /// Condition data.
  final ConditionData _condition;

  /// Wind speed in miles per hour.
  final double? _windMph;

  /// Wind speed in kilometer per hour.
  final double? _windKph;

  /// Wind direction in degrees.
  final int? _windDegree;

  /// Wind direction as 16 point compass.
  final String? _windDir;

  /// Pressure in millibars.
  final double? _pressureMb;

  /// Pressure in inches.
  final double? _pressureIn;

  /// Precipitation amount in millimeters.
  final double? _precipMm;

  /// Precipitation amount in inches.
  final double? _precipIn;

  /// Humidity as percentage.
  final int? _humidity;

  /// Cloud cover as percentage.
  final int? _cloud;

  /// Feels like temperature in Celsius.
  final double? _feelslikeC;

  /// Feels like temperature in Fahrenheit.
  final double? _feelslikeF;

  /// Visibility in kilometers.
  final double? _visKm;

  /// Visibility in miles.
  final double? _visMiles;

  /// UV index.
  final double? _uv;

  /// Wind gust in miles per hour.
  final double? _gustMph;

  /// Wind gust in kilometers per hour.
  final double? _gustKph;

  /// Air quality data.
  final AirQualityData _airQuality;

  /// Class constructor.
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

  /// Getter for local time when the real time data was updated in UNIX time.
  int? get lastUpdatedEpoch => _lastUpdatedEpoch;

  /// Getter for local time when the real time data was updated.
  String? get lastUpdated => _lastUpdated;

  /// Getter for temperature in Celsius.
  double? get tempC => _tempC;

  /// Getter for temperature in Fahrenheit.
  double? get tempF => _tempF;

  /// Getter for "is day" flag.
  int? get isDay => _isDay;

  /// Getter for condition data.
  ConditionData get condition => _condition;

  /// Getter for wind speed in miles per hour.
  double? get windMph => _windMph;

  /// Getter for wind speed in kilometer per hour.
  double? get windKph => _windKph;

  /// Getter for wind direction in degrees.
  int? get windDegree => _windDegree;

  /// Getter for wind direction as 16 point compass.
  String? get windDir => _windDir;

  /// Getter for pressure in millibars.
  double? get pressureMb => _pressureMb;

  /// Getter for pressure in inches.
  double? get pressureIn => _pressureIn;

  /// Getter for precipitation amount in millimeters.
  double? get precipMm => _precipMm;

  /// Getter for precipitation amount in inches.
  double? get precipIn => _precipIn;

  /// Getter for humidity.
  int? get humidity => _humidity;

  /// Getter for cloud cover.
  int? get cloud => _cloud;

  /// Getter for feels like temperature in Celsius.
  double? get feelslikeC => _feelslikeC;

  /// Getter for feels like temperature in Fahrenheit.
  double? get feelslikeF => _feelslikeF;

  /// Getter for visibility in kilometers.
  double? get visKm => _visKm;

  /// Getter for visibility in miles.
  double? get visMiles => _visMiles;

  /// Getter for UV index.
  double? get uv => _uv;

  /// Getter for wind gust in miles per hour.
  double? get gustMph => _gustMph;

  /// Getter for wind gust in kilometers per hour.
  double? get gustKph => _gustKph;

  /// Getter for air quality data.
  AirQualityData get airQuality => _airQuality;
}

/// A class to represent forecast day data.
class DayData {
  /// Maximum temperature in Celsius for the day.
  final double? _maxtempC;

  /// Maximum temperature in Fahrenheit for the day.
  final double? _maxtempF;

  /// Minimum temperature in Celsius for the day.
  final double? _mintempC;

  /// Minimum temperature in Fahrenheit for the day.
  final double? _mintempF;

  /// Average temperature in Celsius for the day.
  final double? _avgtempC;

  /// Average temperature in Fahrenheit for the day.
  final double? _avgtempF;

  /// Maximum wind speed in miles per hour.
  final double? _maxwindMph;

  /// Maximum wind speed in kilometers per hour.
  final double? _maxwindKph;

  /// Total precipitation in milimeters.
  final double? _totalprecipMm;

  /// Total precipitation in inches.
  final double? _totalprecipIn;

  /// Total snowfall in centimeters.
  final double? _totalsnowCm;

  /// Average visibility in kilometers.
  final double? _avgvisKm;

  /// Average visibility in miles.
  final double? _avgvisMiles;

  /// Average humidity as percentage.
  final int? _avghumidity;

  /// Flag: 1 = Yes 0 = No.
  final int? _dailyWillItRain;

  /// Chance of rain as percentage.
  final int? _dailyChanceOfRain;

  /// Flag: 1 = Yes 0 = No.
  final int? _dailyWillItSnow;

  /// Chance of snow as percentage.
  final int? _dailyChanceOfSnow;

  /// Condition data.
  final ConditionData _condition;

  /// UV index.
  final double? _uv;

  /// Class constructor.
  DayData(
      this._maxtempC,
      this._maxtempF,
      this._mintempC,
      this._mintempF,
      this._avgtempC,
      this._avgtempF,
      this._maxwindMph,
      this._maxwindKph,
      this._totalprecipMm,
      this._totalprecipIn,
      this._totalsnowCm,
      this._avgvisKm,
      this._avgvisMiles,
      this._avghumidity,
      this._dailyWillItRain,
      this._dailyChanceOfRain,
      this._dailyWillItSnow,
      this._dailyChanceOfSnow,
      this._condition,
      this._uv);

  /// Getter for maximum temperature in Celsius.
  double? get maxtempC => _maxtempC;

  /// Getter for maximum temperature in Fahrenheit.
  double? get maxtempF => _maxtempF;

  /// Getter for minimum temperature in Celsius.
  double? get mintempC => _mintempC;

  /// Getter for minimum temperature in Fahrenheit.
  double? get mintempF => _mintempF;

  /// Getter for average temperature in Celsius.
  double? get avgtempC => _avgtempC;

  /// Getter for average temperature in Fahrenheit.
  double? get avgtempF => _avgtempF;

  /// Getter for maximum wind speed in miles per hour.
  double? get maxwindMph => _maxwindMph;

  /// Getter for maximum wind speed in kilometers per hour.
  double? get maxwindKph => _maxwindKph;

  /// Getter for total precipitation in milimeters.
  double? get totalprecipMm => _totalprecipMm;

  /// Getter for total precipitation in inches.
  double? get totalprecipIn => _totalprecipIn;

  /// Getter for Total snowfall in centimeters.
  double? get totalSnowCm => _totalsnowCm;

  /// Getter for average visibility in kilometers.
  double? get avgvisKm => _avgvisKm;

  /// Getter for average visibility in miles.
  double? get avgvisMiles => _avgvisMiles;

  /// Getter for average humidity.
  int? get avghumidity => _avghumidity;

  /// Getter for "will it rain" flag.
  int? get dailyWillItRain => _dailyWillItRain;

  /// Getter for chance of rain.
  int? get dailyChanceOfRain => _dailyChanceOfRain;

  /// Getter for "will it snow" flag.
  int? get dailyWillItSnow => _dailyWillItSnow;

  /// Getter for chance of snow.
  int? get dailyChanceOfSnow => _dailyChanceOfSnow;

  /// Getter for condition data.
  ConditionData get condition => _condition;

  /// Getter for UV index.
  double? get uv => _uv;
}

/// A class to represent forecast astro data.
class AstroData {
  /// Sunrise time.
  final String? _sunrise;

  /// Sunset time.
  final String? _sunset;

  /// Moonrise time.
  final String? _moonrise;

  /// Moonset time.
  final String? _moonset;

  /// Moon phase.
  final String? _moonPhase;

  /// Moon illumination as percentage.
  final int? _moonIllumination;

  /// Flag: 1 = Yes or 0 = No.
  final int? _isMoonUp;

  /// Flag: 1 = Yes or 0 = No.
  final int? _isSunUp;

  /// Class constructor.
  AstroData(this._sunrise, this._sunset, this._moonrise, this._moonset,
      this._moonPhase, this._moonIllumination, this._isMoonUp, this._isSunUp);

  /// Getter for sunrise time.
  String? get sunrise => _sunrise;

  /// Getter for sunset time.
  String? get sunset => _sunset;

  /// Getter for moonrise time.
  String? get moonrise => _moonrise;

  /// Getter for moonset time.
  String? get moonset => _moonset;

  /// Getter for moon phase.
  String? get moonPhase => _moonPhase;

  /// Getter for moon illumination.
  int? get moonIllumination => _moonIllumination;

  /// Getter for "is moon up" flag.
  int? get isMoonUp => _isMoonUp;

  /// Getter for "is sun up" flag.
  int? get isSunUp => _isSunUp;
}

/// A class to represent forecast hour data.
class HourData {
  /// Time as epoch.
  final int? _timeEpoch;

  /// Date and time.
  final String? _time;

  /// Temperature in Celsius.
  final double? _tempC;

  /// Temperature in Fahrenheit.
  final double? _tempF;

  /// Flag: 1 = Yes 0 = No.
  final int? _isDay;

  /// Condition data.
  final ConditionData _condition;

  /// Wind speed in miles per hour.
  final double? _windMph;

  /// Wind speed in kilometers per hour.
  final double? _windKph;

  /// Wind direction in degrees.
  final int? _windDegree;

  /// Wind direction as 16 point compass.
  final String? _windDir;

  /// Pressure in millibars.
  final double? _pressureMb;

  /// Pressure in inches.
  final double? _pressureIn;

  /// Precipitation amount in millimeters.
  final double? _precipMm;

  /// Precipitation amount in inches.
  final double? _precipIn;

  /// Snowfall in centimeters.
  final double? _snowCm;

  /// Humidity as percentage.
  final int? _humidity;

  /// Cloud cover as percentage.
  final int? _cloud;

  /// Feels like temperature as Celsius.
  final double? _feelslikeC;

  /// Feels like temperature as Fahrenheit.
  final double? _feelslikeF;

  /// Windchill temperature in Celsius.
  final double? _windchillC;

  /// Windchill temperature in Fahrenheit.
  final double? _windchillF;

  /// Heat index in Celsius.
  final double? _heatindexC;

  /// Heat index in Fahrenheit.
  final double? _heatindexF;

  /// Dew point in Celsius.
  final double? _dewpointC;

  /// Dew point in Fahrenheit.
  final double? _dewpointF;

  /// Flag: 1 = Yes 0 = No.
  final int? _willItRain;

  /// Chance of rain as percentage.
  final int? _chanceOfRain;

  /// Flag: 1 = Yes 0 = No.
  final int? _willItSnow;

  /// Chance of snow as percentage.
  final int? _chanceOfSnow;

  /// Visibility in kilometers.
  final double? _visKm;

  /// Visibility in miles.
  final double? _visMiles;

  /// Wind gust in miles per hour.
  final double? _gustMph;

  /// Wind gust in kilometers per hour.
  final double? _gustKph;

  /// UV index.
  final double? _uv;

  /// Class constructor.
  HourData(
      this._timeEpoch,
      this._time,
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
      this._snowCm,
      this._humidity,
      this._cloud,
      this._feelslikeC,
      this._feelslikeF,
      this._windchillC,
      this._windchillF,
      this._heatindexC,
      this._heatindexF,
      this._dewpointC,
      this._dewpointF,
      this._willItRain,
      this._chanceOfRain,
      this._willItSnow,
      this._chanceOfSnow,
      this._visKm,
      this._visMiles,
      this._gustMph,
      this._gustKph,
      this._uv);

  /// Getter for time as epoch.
  int? get timeEpoch => _timeEpoch;

  /// Getter for date and time.
  String? get time => _time;

  /// Getter for temperature in Celsius.
  double? get tempC => _tempC;

  /// Getter for temperature in Fahrenheit.
  double? get tempF => _tempF;

  /// Getter for "is day" flag.
  int? get isDay => _isDay;

  /// Getter for condition data.
  ConditionData get condition => _condition;

  /// Getter for wind speed in miles per hour.
  double? get windMph => _windMph;

  /// Getter for wind speed in kilometers per hour.
  double? get windKph => _windKph;

  /// Getter for wind direction in degrees.
  int? get windDegree => _windDegree;

  /// Getter for wind direction as 16 point compass.
  String? get windDir => _windDir;

  /// Getter for pressure in millibars.
  double? get pressureMb => _pressureMb;

  /// Getter for pressure in inches.
  double? get pressureIn => _pressureIn;

  /// Getter for precipitation amount in millimeters.
  double? get precipMm => _precipMm;

  /// Getter for precipitation amount in inches.
  double? get precipIn => _precipIn;

  /// Getter for snowfall in centimeters.
  double? get snowCm => _snowCm;

  /// Getter for humiduty.
  int? get humidity => _humidity;

  /// Getter for cloud cover.
  int? get cloud => _cloud;

  /// Getter for feels like temperature as Celsius.
  double? get feelslikeC => _feelslikeC;

  /// Getter for feels like temperature as Fahrenheit.
  double? get feelslikeF => _feelslikeF;

  /// Getter for windchill temperature in Celsius.
  double? get windchillC => _windchillC;

  /// Getter for windchill temperature in Fahrenheit.
  double? get windchillF => _windchillF;

  /// Getter for heat index in Celsius.
  double? get heatindexC => _heatindexC;

  /// Getter for heat index in Fahrenheit.
  double? get heatindexF => _heatindexF;

  /// Getter for dew point in Celsius.
  double? get dewpointC => _dewpointC;

  /// Getter for dew point in Fahrenheit.
  double? get dewpointF => _dewpointF;

  /// Getter for "will it rain" flag.
  int? get willItRain => _willItRain;

  /// Getter for chance of rain.
  int? get chanceOfRain => _chanceOfRain;

  /// Getter for "will it snow" flag.
  int? get willItSnow => _willItSnow;

  /// Getter for chance of snow.
  int? get chanceOfSnow => _chanceOfSnow;

  /// Getter for visibility in kilometers.
  double? get visKm => _visKm;

  /// Getter for visibility in miles.
  double? get visMiles => _visMiles;

  /// Getter for wind gust in miles per hour.
  double? get gustMph => _gustMph;

  /// Getter for wind gust in kilometers per hour.
  double? get gustKph => _gustKph;

  /// Getter for UV index.
  double? get uv => _uv;
}

/// A class to represent forecast day data.
class ForecastDayData {
  /// Forecast date.
  final String? _date;

  /// Forecast date as UNIX time.
  final int? _dateEpoch;

  /// Day data.
  final DayData _day;

  /// Astro data.
  final AstroData _astro;

  /// Hour data list.
  final List<HourData> _hour;

  /// Class constructor.
  ForecastDayData(
      this._date, this._dateEpoch, this._day, this._astro, this._hour);

  /// Getter for forecast date.
  String? get date => _date;

  /// Getter for forecast date as UNIX time.
  int? get dateEpoch => _dateEpoch;

  /// Getter for day data.
  DayData get day => _day;

  /// Getter for astro data.
  AstroData get astro => _astro;

  /// Getter for hour data list.
  List<HourData> get hour => _hour;
}

/// A class to represent forecast alerts.
class AlertData {
  /// Alert headline.
  final String? _headline;

  /// Type of alert.
  final String? _msgtype;

  /// Severity of alert.
  final String? _severity;

  /// Urgency.
  final String? _urgency;

  /// Areas covered.
  final String? _areas;

  /// Category.
  final String? _category;

  /// Certainty.
  final String? _certainty;

  /// Event.
  final String? _event;

  /// Note.
  final String? _note;

  /// Effectivness.
  final String? _effective;

  /// Expiration.
  final String? _expires;

  /// Description.
  final String? _desc;

  /// Instruction.
  final String? _instruction;

  /// Class constructor.
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

  /// Getter for headline.
  String? get headline => _headline;

  /// Getter for type.
  String? get msgtype => _msgtype;

  /// Getter for severity.
  String? get severity => _severity;

  /// Getter for urgency.
  String? get urgency => _urgency;

  /// Getter for areas covered.
  String? get areas => _areas;

  /// Getter for category.
  String? get category => _category;

  /// Getter for certainty.
  String? get certainty => _certainty;

  /// Getter for event.
  String? get event => _event;

  /// Getter for note.
  String? get note => _note;

  /// Getter for effectivness.
  String? get effective => _effective;

  /// Getter for expiration.
  String? get expires => _expires;

  /// Getter for description.
  String? get desc => _desc;

  /// Getter for instruction.
  String? get instruction => _instruction;
}

/// A class to represent search results locations.
class LocationResultData {
  /// Location ID.
  final int? _id;

  /// Location name.
  final String? _name;

  /// Region or state of the location, if available.
  final String? _region;

  /// Location country.
  final String? _country;

  /// Location URL.
  final String? _url;

  /// Latitude in decimal degrees.
  final double? _lat;

  /// Longitude in decimal degrees.
  final double? _lon;

  /// Class constructor.
  LocationResultData(this._id, this._name, this._region, this._country,
      this._lat, this._lon, this._url);

  /// Getter for location ID.
  int? get id => _id;

  /// Getter for location name.
  String? get name => _name;

  /// Getter for region or state of the location.
  String? get region => _region;

  /// Getter for location country.
  String? get country => _country;

  /// Getter for location URL.
  String? get url => _url;

  /// Getter for latitude.
  double? get lat => _lat;

  /// Getter for longitude.
  double? get lon => _lon;
}
