class WeatherForecastModel {
  WeatherForecastModel({
    required this.location,
    required this.current,
    required this.forecast,
  });
  late final Location location;
  late final Current current;
  late final Forecast forecast;

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;
  late final String tzId;
  late final int localtimeEpoch;
  late final String localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    required this.tempC,
    required this.condition,
    required this.windKph,
    required this.windDir,
    required this.pressureMb,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.feelslikeC,
  });
  late final double tempC;
  late final Condition condition;
  late final double windKph;
  late final String windDir;
  late final double pressureMb;
  late final double precipMm;
  late final double precipIn;
  late final double humidity;
  late final double feelslikeC;

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'] == null
        ? 0.0
        : double.tryParse(json['temp_c'].toString()) ?? 0;
    condition = Condition.fromJson(json['condition']);
    windKph = json['wind_kph'] == null
        ? 0.0
        : double.tryParse(json['wind_kph'].toString()) ?? 0;
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'] == null
        ? 0.0
        : double.tryParse(json['pressure_mb'].toString()) ?? 0;
    precipMm = json['precip_mm'] == null
        ? 0.0
        : double.tryParse(json['precip_mm'].toString()) ?? 0;
    precipIn = json['precip_in'] == null
        ? 0.0
        : double.tryParse(json['precip_in'].toString()) ?? 0;
    humidity = json['humidity'] == null
        ? 0.0
        : double.tryParse(json['humidity'].toString()) ?? 0;
    feelslikeC = json['feelslike_c'] == null
        ? 0.0
        : double.tryParse(json['feelslike_c'].toString()) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp_c'] = tempC;
    _data['condition'] = condition.toJson();
    _data['wind_kph'] = windKph;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['humidity'] = humidity;
    _data['feelslike_c'] = feelslikeC;
    return _data;
  }
}

class Condition {
  Condition({
    required this.text,
  });
  late final String text;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    return _data;
  }
}

class Forecast {
  Forecast({
    required this.forecastday,
  });
  late final List<Forecastday> forecastday;

  Forecast.fromJson(Map<String, dynamic> json) {
    forecastday = List.from(json['forecastday'])
        .map((e) => Forecastday.fromJson(e))
        .toList();
  }
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });
  late final String date;
  late final double dateEpoch;
  late final Day day;
  late final Astro astro;
  late final List<Hour> hour;

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'] == null
        ? 0.0
        : double.tryParse(json['date_epoch'].toString()) ?? 0;
    day = Day.fromJson(json['day']);
    astro = Astro.fromJson(json['astro']);
    hour = List.from(json['hour']).map((e) => Hour.fromJson(e)).toList();
  }
}

class Day {
  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.maxwindKph,
    required this.totalsnowCm,
    required this.avghumidity,
    required this.condition,
  });
  late final double maxtempC;
  late final double mintempC;
  late final double avgtempC;
  late final double maxwindKph;
  late final double totalsnowCm;
  late final double avghumidity;
  late final Condition condition;

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'] == null
        ? 0.0
        : double.tryParse(json['maxtemp_c'].toString()) ?? 0;
    mintempC = json['mintemp_c'] == null
        ? 0.0
        : double.tryParse(json['mintemp_c'].toString()) ?? 0;
    avgtempC = json['avgtemp_c'] == null
        ? 0.0
        : double.tryParse(json['avgtemp_c'].toString()) ?? 0;
    maxwindKph = json['maxwind_kph'] == null
        ? 0.0
        : double.tryParse(json['maxwind_kph'].toString()) ?? 0;
    totalsnowCm = json['totalsnow_cm'] == null
        ? 0.0
        : double.tryParse(json['totalsnow_cm'].toString()) ?? 0;
    avghumidity = json['avghumidity'] == null
        ? 0.0
        : double.tryParse(json['avghumidity'].toString()) ?? 0;
    condition = Condition.fromJson(json['condition']);
  }
}

class Astro {
  Astro({
    required this.sunrise,
    required this.sunset,
  });
  late final String sunrise;
  late final String sunset;

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}

class Hour {
  Hour({
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windKph,
    required this.windDir,
    required this.humidity,
  });
  late final String time;
  late final double? tempC;
  late final double? tempF;
  late final Condition condition;
  late final double? windKph;
  late final String windDir;
  late final double humidity;

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'] == null
        ? 0.0
        : double.tryParse(json['temp_c'].toString()) ?? 0;
    tempF = json['temp_f'] == null
        ? 0.0
        : double.tryParse(json['temp_f'].toString()) ?? 0;
    condition = Condition.fromJson(json['condition']);
    windKph = json['wind_kph'] == null
        ? 0.0
        : double.tryParse(json['wind_kph'].toString()) ?? 0;
    windDir = json['wind_dir'];
    humidity = json['humidity'] == null
        ? 0.0
        : double.tryParse(json['humidity'].toString()) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['time'] = time;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['condition'] = condition.toJson();
    _data['wind_kph'] = windKph;
    _data['wind_dir'] = windDir;
    _data['humidity'] = humidity;
    return _data;
  }
}
