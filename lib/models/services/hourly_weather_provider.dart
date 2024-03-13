import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/models/secrets/api.dart';
import 'package:weather_app/models/weather_model/hourly_data.dart';
import 'package:http/http.dart' as http;

class HourlyWeatherProvider with ChangeNotifier {
  WeatherResponse? _hourly;
  WeatherResponse? get hourly => _hourly;

  Future<void> fetchHourlyDataByCity(String city) async {
    String _error = "";

    try {
      final apiUrl =
          "${ApiEndpoints().baseHourlyUrl}$city&cnt=5&appid=${ApiEndpoints().apiKey}${ApiEndpoints().unit}";

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _hourly = WeatherResponse.fromJson(data);
        print("hourly api working");
      } else {
        _error = "failed to load data";
      }
    } catch (e) {
      _error = "failed to load data";
      print("$e");
    } finally {
      notifyListeners();
    }
  }
}
