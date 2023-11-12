import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/domain/model/weather_forecast.dart';
import 'package:weather_app/domain/model/weather_info.dart';
import 'package:weather_app/presentation/screen/components/weather_info_item.dart';

import '../../utils/constants.dart';
import 'components/weather_forecast_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }
      debugPrint("lamnb:${response.statusCode}");
      debugPrint("lamnb:${response.body}");
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

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
            onPressed: () {
              getCurrentWeather();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: weatherBody(),
    );
  }

  Widget weatherBody() => FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(fontSize: 32),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                "Empty data",
                style: TextStyle(fontSize: 32),
              ),
            );
          }

          final data = snapshot.data!;
          final weatherData = data['list'][0];
          final temp = weatherData['main']['temp'].toString();
          final status = weatherData['weather'][0]['description'].toString();

          final humidity = weatherData['main']['humidity'].toString();
          final pressure = weatherData['main']['pressure'].toString();
          final windSpeed = weatherData['wind']['speed'].toString();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                temperatureTodaySection(temp: temp, status: status),
                const SizedBox(height: 20),
                weatherForecastSection(),
                const SizedBox(height: 20),
                additionalInfoSection(
                  humidity: humidity,
                  windSpeed: windSpeed,
                  pressure: pressure,
                ),
              ],
            ),
          );
        },
      );

  Widget temperatureTodaySection({
    required String temp,
    required String status,
  }) =>
      SizedBox(
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "$temp°C",
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 64,
                    ),
                    Text(
                      status,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget weatherForecastSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Weather forecast",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                WeatherForecastItem(
                  weatherForecast: WeatherForecast(
                    icon: Icons.cloud,
                    hour: "09:00",
                    temperature: "29°C",
                  ),
                ),
                WeatherForecastItem(
                  weatherForecast: WeatherForecast(
                    icon: Icons.sunny,
                    hour: "10:00",
                    temperature: "30°C",
                  ),
                ),
                WeatherForecastItem(
                  weatherForecast: WeatherForecast(
                    icon: Icons.sunny,
                    hour: "11:00",
                    temperature: "31°C",
                  ),
                ),
                WeatherForecastItem(
                  weatherForecast: WeatherForecast(
                    icon: Icons.cloud,
                    hour: "12:00",
                    temperature: "27°C",
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget additionalInfoSection({
    required String humidity,
    required String windSpeed,
    required String pressure,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Additional information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherInfoItem(
                weatherInfo: WeatherInfo(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: humidity,
                ),
              ),
              WeatherInfoItem(
                weatherInfo: WeatherInfo(
                  icon: Icons.air,
                  label: "Wind speed",
                  value: windSpeed,
                ),
              ),
              WeatherInfoItem(
                weatherInfo: WeatherInfo(
                  icon: Icons.beach_access_outlined,
                  label: "Pressure",
                  value: pressure,
                ),
              ),
            ],
          )
        ],
      );
}
