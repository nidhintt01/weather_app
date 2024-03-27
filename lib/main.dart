import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/services/hourly_weather_provider.dart';
import 'package:weather_app/model/services/location_service_provider.dart';
import 'package:weather_app/model/services/location_suggestion_provider.dart';
import 'package:weather_app/model/services/weather_data_from_places.dart';
import 'package:weather_app/model/services/weather_service_provider.dart';
import 'package:weather_app/view/splashscreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: 'secret/api_endpoints.env');

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => LocationProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => WeatherServiceProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HourlyWeatherProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LocationSuggestionProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => WeatherDataFromPlaces(),
      )
    ], child: const SplashScreen()),
  );
}
