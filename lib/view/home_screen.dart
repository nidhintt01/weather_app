import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/navigation/routes.dart';
import 'package:weather_app/model/services/forecast_provider.dart';
import 'package:weather_app/view/tempareture.dart';
import 'package:weather_app/view/location_indicator.dart';
import 'package:weather_app/view/simple_weather_info.dart';
import 'package:weather_app/view/weather_animation.dart';
import 'package:weather_app/view/weather_forecast.dart';
import 'package:weather_app/viewModel/shared_widgets/app_background.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ForecastProvider _forecastProvider;
  bool homeLoading = true;

  @override
  void initState() {
    super.initState();
    _forecastProvider = Provider.of<ForecastProvider>(context, listen: false);
    _forecastProvider.addListener(() {
      setState(() {
        homeLoading = _forecastProvider.isLoading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: homeLoading ? buildShimmer() : buildContent(),
      ),
    );
  }

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 20,
                color: Colors.white,
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Container(
                  width: 250.0,
                  height: 120.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 8.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return const Stack(children: [
      AppBackground(),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Align(
              alignment: Alignment(-2, 1),
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
            SizedBox(
              height: 30,
            ),
            Center(child: Tempareture()),
            SizedBox(
              height: 30,
            ),
            WeatherForecast(),
          ]),
    ]);
  }
}
