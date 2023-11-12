import 'package:flutter/material.dart';

class WeatherInfoItem extends StatelessWidget {
  const WeatherInfoItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
