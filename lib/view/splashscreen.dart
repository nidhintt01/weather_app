import 'package:flutter/material.dart';
import 'package:weather_app/model/data/assets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/services/forecast_provider.dart';
import 'package:weather_app/model/services/location_service_provider.dart';
import 'package:weather_app/model/services/weather_service_provider.dart';
import 'package:weather_app/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.determinePosition().then((value) {
      if (locationProvider.lat != null && locationProvider.lng != null) {
        Provider.of<WeatherServiceProvider>(context, listen: false)
            .fetchWeatherDataByCity(
                locationProvider.lat!, locationProvider.lng!);
        Provider.of<ForecastProvider>(context, listen: false)
            .fetchHourlyWeatherByCity(
                locationProvider.lat!, locationProvider.lng!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(logo, width: 200, height: 200),
          ),
          const Padding(padding: EdgeInsets.only(top: 150, bottom: 20)),
          const CircularProgressIndicator()
        ],
      );
    } else {
      return const Home();
    }
  }
}
