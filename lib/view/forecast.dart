import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/services/hourly_weather_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/forecast_widget.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) { 
    final double height = MediaQuery.of(context).size.height * 0.15;
    return Consumer<HourlyWeatherProvider>(
      builder: (context, value, child) => Container(
        height: height,
        child: ListView.builder(
            itemCount: value.hourly?.cnt??0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ForecastWidget(
                  timestamp: value.hourly?.list?[index].dtTxt??"Not avaliable",
                  weatherInfo: value.hourly?.list?[index].weather?[0].main??"Not avaliable");
            }),
      ),
    );
  }
}
