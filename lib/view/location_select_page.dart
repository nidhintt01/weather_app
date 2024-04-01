import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/model/services/forecast_provider.dart';
import 'package:weather_app/model/services/location_service_provider.dart';
import 'package:weather_app/model/services/location_suggestion_provider.dart';
import 'package:weather_app/model/services/weather_data_from_places.dart';
import 'package:weather_app/model/services/weather_service_provider.dart';
import 'package:weather_app/viewModel/shared_widgets/app_background.dart';

class LocationSelectPage extends StatefulWidget {
  const LocationSelectPage({super.key});

  @override
  State<LocationSelectPage> createState() => _LocationSelectPageState();
}

class _LocationSelectPageState extends State<LocationSelectPage> {
  final TextEditingController _citycontroller = TextEditingController();
  final LocationSuggestionProvider _locationSuggestions =
      LocationSuggestionProvider();

  var uuid = const Uuid();
  String _sessionToken = "123";
  @override
  void initState() {
    _citycontroller.addListener(() {
      onChanged();
    });
    super.initState();
  }

  void onChanged() {
    setState(() {
      _sessionToken = uuid.v4();
    });
    _locationSuggestions.getSuggestion(_citycontroller.text, _sessionToken);
  }

  @override
  Widget build(BuildContext context) {
    final WeatherDataFromPlaces weatherDataFromPlaces =
        Provider.of<WeatherDataFromPlaces>(context);
    final weatherProvider =
        Provider.of<WeatherServiceProvider>(context, listen: false);
    final forecastProvider =
        Provider.of<ForecastProvider>(context, listen: false);

    final LocationProvider locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    print("rebuild");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
                        decoration: const InputDecoration(
                            fillColor: Colors.amber,
                            hintText: "Search a place",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        controller: _citycontroller,
                        keyboardType: TextInputType.text,
                      )),
                    ],
                  ),
                  Consumer<LocationSuggestionProvider>(
                      builder: (context, value, child) => SizedBox(
                            width: 400,
                            height: 150,
                            child: Consumer<WeatherDataFromPlaces>(
                              builder: (context, weatherData, child) {
                                return weatherData.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ListView.builder(
                                        key: ValueKey(_citycontroller.text),
                                        itemCount: _locationSuggestions
                                            .suggestions.length,
                                        itemBuilder: (context, index) =>
                                            ListTile(
                                          onTap: () async {
                                            await weatherDataFromPlaces
                                                .getCoordinates(
                                                    _locationSuggestions
                                                            .suggestions[index]
                                                        ["place_id"],
                                                    context);
                                            locationProvider
                                                .city = _locationSuggestions
                                                        .suggestions[index]
                                                    ["structured_formatting"]
                                                ["main_text"];

                                            await weatherProvider
                                                .fetchWeatherDataByCity(
                                                    weatherDataFromPlaces.lat ??
                                                        40.7128,
                                                    weatherDataFromPlaces.lng ??
                                                        74.0060);
                                            await forecastProvider
                                                .fetchHourlyWeatherByCity(
                                                    weatherDataFromPlaces.lat ??
                                                        40.7128,
                                                    weatherDataFromPlaces.lng ??
                                                        74.0060);
                                          },
                                          leading: const Icon(
                                            Icons.location_pin,
                                            color: Colors.green,
                                          ),
                                          title: Text(
                                            _locationSuggestions
                                                    .suggestions[index]
                                                ["description"],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
