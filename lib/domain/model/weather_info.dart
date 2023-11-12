import 'package:flutter/material.dart' show IconData;

class WeatherInfo {
  final IconData _icon;
  final String _label;
  final String _value;

  WeatherInfo({
    required IconData icon,
    required String label,
    required String value,
  })  : _icon = icon,
        _label = label,
        _value = value;

  String get value => _value;

  String get label => _label;

  IconData get icon => _icon;
}
