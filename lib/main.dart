import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/services/hourly_weather_provider.dart';
import 'package:weather_app/models/services/location_service_provider.dart';
import 'package:weather_app/models/services/weather_service_provider.dart';
import 'package:weather_app/view/splashscreen.dart';
import 'package:weather_app/viewModel/splash_screen_view_model.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => SplashScreenViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => LocationProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => WeatherServiceProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HourlyWeatherProvider(),
      )
    ], child: const SplashScreen()),
  );
}
