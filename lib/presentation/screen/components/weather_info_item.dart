import 'package:flutter/material.dart';

import '../../../domain/model/weather_info.dart';

class WeatherInfoItem extends StatelessWidget {
  final WeatherInfo _weatherInfo;

  const WeatherInfoItem({super.key, required WeatherInfo weatherInfo})
      : _weatherInfo = weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          _weatherInfo.icon,
          size: 32,
        ),
        const SizedBox(height: 6),
        Text(
          _weatherInfo.label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 6),
        Text(
          _weatherInfo.value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
