class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
  });
  late final Location location;
  late final Current current;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
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
  late final double localtimeEpoch;
  late final String localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'] == null
        ? 0.0
        : double.tryParse(json['lat'].toString()) ?? 0;
    lon = json['lon'] == null
        ? 0.0
        : double.tryParse(json['lon'].toString()) ?? 0;
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'] == null
        ? 0.0
        : double.tryParse(json['localtime_epoch'].toString()) ?? 0;
    localtime = json['localtime'];
  }
}

class Current {
  Current({
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
  });
  late final double tempC;
  late final double isDay;
  late final Condition condition;
  late final double windMph;
  late final double windKph;
  late final double windDegree;
  late final String windDir;
  late final double pressureMb;
  late final double pressureIn;
  late final double precipMm;
  late final double precipIn;
  late final double humidity;
  late final double cloud;
  late final double feelslikeC;
  late final double feelslikeF;

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'] == null
        ? 0.0
        : double.tryParse(json['temp_c'].toString()) ?? 0;
    isDay = json['is_day'] == null
        ? 0.0
        : double.tryParse(json['is_day'].toString()) ?? 0;
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'] == null
        ? 0.0
        : double.tryParse(json['wind_mph'].toString()) ?? 0;
    windKph = json['wind_kph'] == null
        ? 0.0
        : double.tryParse(json['wind_kph'].toString()) ?? 0;
    windDegree = json['wind_degree'] == null
        ? 0.0
        : double.tryParse(json['wind_degree'].toString()) ?? 0;
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'] == null
        ? 0.0
        : double.tryParse(json['pressure_mb'].toString()) ?? 0;
    pressureIn = json['pressure_in'] == null
        ? 0.0
        : double.tryParse(json['pressure_in'].toString()) ?? 0;
    precipMm = json['precip_mm'] == null
        ? 0.0
        : double.tryParse(json['precip_mm'].toString()) ?? 0;
    precipIn = json['precip_in'] == null
        ? 0.0
        : double.tryParse(json['precip_in'].toString()) ?? 0;
    humidity = json['humidity'] == null
        ? 0.0
        : double.tryParse(json['humidity'].toString()) ?? 0;
    cloud = json['cloud'] == null
        ? 0.0
        : double.tryParse(json['cloud'].toString()) ?? 0;
    feelslikeC = json['feelslike_c'] == null
        ? 0.0
        : double.tryParse(json['feelslike_c'].toString()) ?? 0;
    feelslikeF = json['feelslike_f'] == null
        ? 0.0
        : double.tryParse(json['feelslike_f'].toString()) ?? 0;
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
  late final String text;
  late final String icon;
  late final double code;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'] == null
        ? 0.0
        : double.tryParse(json['code'].toString()) ?? 0;
  }
}
