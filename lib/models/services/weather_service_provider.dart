import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/models/secrets/api_endpoints.env';
import 'package:weather_app/models/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServiceProvider with ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = "";

  Future<void> fetchWeatherDataByCity(double lat, double lng) async {
    _isLoading = true;
    _error = "";

    try {
      final apiUrl =
          "${ApiEndpoints().baseWeatherUrl}lat=$lat&lon=$lng&appid=${ApiEndpoints().weatherApiKey}${ApiEndpoints().unit}";

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _weather = WeatherModel.fromJson(data);
        print("weather data success");
        notifyListeners();
      } else {
        _error = "failed to load data";
        print(_error);
      }
    } catch (e) {
      _error = "failed to load data";
      print("$e error in weather service");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
