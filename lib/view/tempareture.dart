import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/data/assets.dart';
import 'package:weather_app/model/services/weather_service_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tempareture extends StatelessWidget {
  const Tempareture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(color: Colors.grey[850], border: Border.all(color: Colors.white30),borderRadius:BorderRadius.circular(30) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                weather["lowtemp"]!,
                height: 40,
              ),
              Column(
                children: [
                  TextWidget(
                      data: "Min Temp",
                      style: GoogleFonts.akatab(
                          color: Colors.white, fontSize: 13)),
                  Consumer<WeatherServiceProvider>(
                    builder: (context, value, child) => TextWidget(
                        data:
                            "${value.weather?.main?.tempMin?.toStringAsFixed(0)}\u00B0c",
                        style: GoogleFonts.akatab(
                            color: Colors.white, fontSize: 20)),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                weather["hightemp"]!,
                height: 40,
              ),
              Column(
                children: [
                  TextWidget(
                      data: "Max Temp",
                      style: GoogleFonts.akatab(
                          color: Colors.white, fontSize: 13)),
                  Consumer<WeatherServiceProvider>(
                    builder: (context, value, child) => TextWidget(
                        data:
                            "${value.weather?.main?.tempMax?.toStringAsFixed(0)}\u00B0c",
                        style: GoogleFonts.akatab(
                            color: Colors.white, fontSize: 20)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
