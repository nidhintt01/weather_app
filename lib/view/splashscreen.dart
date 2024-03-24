import 'package:flutter/material.dart';
import 'package:weather_app/models/data/assets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/services/hourly_weather_provider.dart';
import 'package:weather_app/models/services/location_service_provider.dart';
import 'package:weather_app/models/services/weather_service_provider.dart';
import 'package:weather_app/view/home_screen.dart';
import 'package:weather_app/viewModel/splash_screen_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.determinePosition().then((value) {
      if (locationProvider.lat != null && locationProvider.lng != null) {
        Provider.of<WeatherServiceProvider>(context, listen: false)
            .fetchWeatherDataByCity(locationProvider.lat!,locationProvider.lng!);
        Provider.of<HourlyWeatherProvider>(context, listen: false)
            .fetchHourlyWeatherByCity(locationProvider.lat!,locationProvider.lng!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final splashProvider = context.watch<SplashScreenViewModel>();

    if (splashProvider.loading) {
      splashProvider.initialize();
      return Center(
        child: Image.asset(logo, width: 200, height: 200),
      );
    } else {
      return const Home();
    }
  }
}
