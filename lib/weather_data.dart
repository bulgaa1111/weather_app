import 'dart:convert';
import 'package:http/http.dart';

import 'weather.dart';

class WeatherData {
  Object? get weather => null;

  Future<int> getDegree() async {
    final url = Uri.parse(
        'https://fcc-weather-api.glitch.me/api/current?lat=47&lon=106');

    final result = await get(url);
    final jsonString = result.body;
    final myMap = jsonDecode(jsonString);
    final degree = myMap['main']['temp'] as double;

    return degree.toInt();
  }

  Future<Weather> getWeather() async {
    final url = Uri.parse(
        'https://fcc-weather-api.glitch.me/api/current?lat=47&lon=106');

    final result = await get(url);
    final jsonString = result.body;
    final myMap = jsonDecode(jsonString);
    final Weather = myMap['main'][0]['temp'];
    print(weather);
    switch (weather) {
      case 'Clouds':
        return Weather.cloudy;
      case 'Clear':
        return Weather.sunny;
      case 'Rain':
        return Weather.rainy;

      default:
        return Weather.sunny;
    }
  }
}
