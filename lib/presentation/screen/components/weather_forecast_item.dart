import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  const WeatherForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: SizedBox(
        width: 120,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            children: [
              Text(
                "03:00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.cloud,
                color: Colors.white,
                size: 32,
              ),
              SizedBox(height: 10),
              Text(
                "29°C",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
