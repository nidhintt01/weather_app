import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/model/navigation/routes.dart';
import 'package:weather_app/view/forecast.dart';
import 'package:weather_app/view/tempareture.dart';
import 'package:weather_app/view/location_indicator.dart';
import 'package:weather_app/view/simple_weather_info.dart';
import 'package:weather_app/view/weather_animation.dart';
import 'package:weather_app/viewModel/shared_widgets/app_background.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            const AppBackground(),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80, sigmaY: 90),
              child: Container(
                color: Colors.transparent,
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment(-0.9, 0),
                        child: Location(),
                      ),
                      Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: WeatherAnimation(),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Center(child: SimpleWeatherInfo()),
                      Tempareture(),
                      SizedBox(
                        height: 30,
                      ),
                      Forecast(),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
