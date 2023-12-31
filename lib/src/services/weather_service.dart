import 'dart:convert';
import 'package:entangled/src/models/models.dart';
import 'package:entangled/src/models/weather_forcast.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  var client = http.Client();
  Future<WeatherModel> getWeather(String location) async {
    final query =
        'http://api.weatherapi.com/v1/current.json?key=c05e2b8859354e5e89e190026231611&q=$location&aqi=no';
    final uri = Uri.parse(query);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<WeatherForecastModel> getWeatherForecast(String location) async {
    final query =
        'http://api.weatherapi.com/v1/forecast.json?key=c05e2b8859354e5e89e190026231611&q=$location&days=7&aqi=no&alerts=no';
    final uri = Uri.parse(query);
    final response = await http.get(uri);
    print('responseCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get the data');
    }
  }
}
