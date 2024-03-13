import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/viewModel/shared_widgets/text.dart';
import 'package:weather_app/models/data/assets.dart';

class ForecastWidget extends StatelessWidget {
  final String? timestamp;
  final String? weatherInfo;

  const ForecastWidget(
      {super.key, required this.timestamp, required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    String hour =
        DateFormat('h a').format(DateTime.parse(timestamp!)).toString();
    final double width = MediaQuery.of(context).size.width * 0.2;

    return Padding( 
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white54,
            ),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextWidget(
                  data: hour,
                  style:
                      GoogleFonts.aBeeZee(fontSize: 18, color: Colors.white)),
            ),
            SvgPicture.asset(
              weather[weatherInfo]!,
              height: 30,
              width: 30,
            ),
            TextWidget(
                data: weatherInfo!,
                style: GoogleFonts.aBeeZee(fontSize: 18, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
