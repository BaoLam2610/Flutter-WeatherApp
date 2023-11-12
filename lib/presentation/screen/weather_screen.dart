import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screen/components/weather_info_item.dart';

import 'components/weather_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: const WeatherBody(),
    );
  }
}

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TemperatureTodaySection(),
          SizedBox(height: 20),
          WeatherForecastSection(),
          SizedBox(height: 20),
          AdditionalInfoSection(),
        ],
      ),
    );
  }
}

class TemperatureTodaySection extends StatelessWidget {
  const TemperatureTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "29°C",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.cloud,
                    color: Colors.white,
                    size: 64,
                  ),
                  Text(
                    "Rain",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherForecastSection extends StatelessWidget {
  const WeatherForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weather forecast",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              WeatherForecastItem(),
              WeatherForecastItem(),
              WeatherForecastItem(),
              WeatherForecastItem(),
            ],
          ),
        )
      ],
    );
  }
}

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Additional information",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherInfoItem(
              icon: Icons.water_drop,
              label: "Humidity",
              value: "94",
            ),
            WeatherInfoItem(
              icon: Icons.air,
              label: "Wind speed",
              value: "7.6",
            ),
            WeatherInfoItem(
              icon: Icons.beach_access_outlined,
              label: "Pressure",
              value: "1006",
            ),
          ],
        )
      ],
    );
  }
}
