import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/models/services/location_service_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/app_background.dart';

class LocationSelectPage extends StatelessWidget {
  const LocationSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController citycontroller = TextEditingController();
    LocationProvider _locationprovider = Provider.of<LocationProvider>(context);
    var uuid=Uuid();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          const AppBackground(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.location_pin,
                        color: Colors.white38,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                            keyboardAppearance: Brightness.dark,
                        decoration: const InputDecoration(
                            hintText: "Enter a location"),
                        controller: citycontroller,
                      )),
                      IconButton(
                          onPressed: () {
                            _locationprovider.city = citycontroller.text;
                          },
                          icon: const Icon(
                            Icons.done_outlined,
                            color: Colors.green,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
