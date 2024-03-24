import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/data/assets.dart';
import 'package:weather_app/models/services/weather_service_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tempareture extends StatelessWidget {
  const Tempareture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  weather["lowtemp"]!,
                  height: 40,
                ),
                Consumer<WeatherServiceProvider>(
                  builder: (context, value, child) => TextWidget(
                      data:
                          "${value.weather?.main?.tempMin?.toStringAsFixed(0)}\u00B0c",
                      style: GoogleFonts.akatab(
                          color: Colors.white, fontSize: 20)),
                )
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  weather["hightemp"]!,
                  height: 40,
                ),
                Consumer<WeatherServiceProvider>(
                  builder: (context, value, child) => TextWidget(
                      data:
                          "${value.weather?.main?.tempMax?.toStringAsFixed(0)}\u00B0c",
                      style: GoogleFonts.akatab(
                          color: Colors.white, fontSize: 20)),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
