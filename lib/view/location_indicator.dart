import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/services/location_service_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/text.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.near_me,
            size: 20,
            color: Colors.red,
          ),
          Consumer<LocationProvider>(builder: (context, value, child) {
            return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "locationSelectPage");
                },
                child: TextWidget(
                    data: value.city ?? "Unknown Location",
                    style: GoogleFonts.aBeeZee()));
          })
        ],
      ),
    );
  }
}
