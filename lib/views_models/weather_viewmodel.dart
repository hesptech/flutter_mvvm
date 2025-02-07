import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  Future<void> fetchWeather() async {
    await Future.delayed(const Duration(seconds: 6));
    print('---------------------------------');
    _weather = WeatherModel(temperature: '30°C', condition: 'Sunny');
    notifyListeners();
  }
}