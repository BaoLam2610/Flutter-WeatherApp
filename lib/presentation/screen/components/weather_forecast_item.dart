import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/weather_forecast.dart';

class WeatherForecastItem extends StatelessWidget {
  final WeatherForecast _weatherForecast;

  const WeatherForecastItem(
      {super.key, required WeatherForecast weatherForecast})
      : _weatherForecast = weatherForecast;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: SizedBox(
        width: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            children: [
              Text(
                _weatherForecast.hour,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Icon(
                _weatherForecast.icon,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(height: 10),
              Text(
                _weatherForecast.temperature,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
