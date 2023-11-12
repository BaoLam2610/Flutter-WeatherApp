import 'package:flutter/material.dart' show IconData;

class WeatherForecast {
  final IconData _icon;
  final String _hour;
  final String _temperature;

  WeatherForecast({
    required IconData icon,
    required String hour,
    required String temperature,
  })  : _icon = icon,
        _hour = hour,
        _temperature = temperature;

  String get temperature => _temperature;

  String get hour => _hour;

  IconData get icon => _icon;
}
