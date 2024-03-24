import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/data/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/services/weather_service_provider.dart';

class WeatherAnimation extends StatelessWidget {
  const WeatherAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
      SvgPicture.asset(
        weather[value.weather?.weather?[0].main]??weather["Default"]!,
        height: 300,
      ),
    );
  }
}
