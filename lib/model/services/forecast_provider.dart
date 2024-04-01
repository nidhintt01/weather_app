import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model/weather_forecast_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/secrets/api_endpoints.dart';

class ForecastProvider with ChangeNotifier {
  WeatherResponse? _hourly;
  WeatherResponse? get hourly => _hourly;
  String _error = "";
  bool isLoading = false;

  Future<void> fetchHourlyWeatherByCity(double lat, double lng) async {
    isLoading = true;
    notifyListeners();

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
      isLoading=false;
      notifyListeners();
    }
  }
}
