import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/data/assets.dart';
import 'package:weather_app/model/services/forecast_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/text.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.2;
    final double height = MediaQuery.of(context).size.height * 0.15;

    return Consumer<ForecastProvider>(
      builder: (context, value, child) {
        return SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: value.hourly?.cnt ?? 0,
            itemBuilder: (BuildContext context, int index) {
              String timestamp =
                  value.hourly?.list[index].dtTxt ?? "Not available";
              int timezoneOffset = value.hourly?.city.timezone ?? -25200;
              final dateTimeUtc = DateTime.parse(timestamp);
              final duration = Duration(seconds: timezoneOffset);
              final dateTimeLocal = dateTimeUtc.add(duration);
              String hour = DateFormat('h a').format(dateTimeLocal);

              final double width = MediaQuery.of(context).size.width * 0.2;
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white38,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextWidget(
                              data: value.hourly?.list[index].weather[0].main ??
                                  "Loading",
                              style: GoogleFonts.aBeeZee(color: Colors.white)),
                          SvgPicture.asset(
                            weather[value
                                    .hourly?.list[index].weather[0].main] ??
                                weather["Default"]!,
                            height: 30,
                            width: 30,
                          ),
                          TextWidget(
                              data: hour,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 18, color: Colors.white)),
                        ])),
              );
            },
          ),
        );
      },
    );
  }
}
