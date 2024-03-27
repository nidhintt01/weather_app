import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/services/weather_service_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/text.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleWeatherInfo extends StatelessWidget {
  const SimpleWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    print("Simple weather info rebuild");
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Consumer<WeatherServiceProvider>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextWidget(
              data: "${value.weather?.main?.temp?.toStringAsFixed(0)}\u00B0c",
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 70),
            ),
            TextWidget(
              data: value.weather?.weather?[0].main??"Not avaliable",
              style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 30),
            ),
            TextWidget(
              data: DateFormat.jm().format(DateTime.now()),
              style: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
