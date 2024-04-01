import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/data/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/services/weather_service_provider.dart';

class WeatherAnimation extends StatelessWidget {
  const WeatherAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherServiceProvider>(builder: (context, value, child) => 
      LottieBuilder.asset(weatherLottie['Thunderstorm']!,height: 300,)
    );
  }
}
