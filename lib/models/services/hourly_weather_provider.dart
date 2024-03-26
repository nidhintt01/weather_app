import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model/hourly_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/secrets/api_endpoints.dart';

class HourlyWeatherProvider with ChangeNotifier {
  WeatherResponse? _hourly;
  WeatherResponse? get hourly => _hourly;

  Future<void> fetchHourlyWeatherByCity(double lat, double lng) async {
    String _error = "";

    try {
      final apiUrl =
          "${ApiEndpoints().baseHourlyUrl}lat=$lat&lon=$lng&cnt=5&appid=${ApiEndpoints().weatherApiKey}${ApiEndpoints().unit}";
      print(apiUrl);

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _hourly = WeatherResponse.fromJson(data);
        print("hourly data success");
        notifyListeners();
      } else {
        _error = "failed to load hourly weather";
        print(_error);
      }
    } catch (e) {
      _error = "failed to load data";
      print("$e error in houlry service");
    } finally {
      notifyListeners();
    }
  }
}
