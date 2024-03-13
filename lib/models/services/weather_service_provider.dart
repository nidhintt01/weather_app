import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/models/secrets/api.dart';
import 'package:weather_app/models/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServiceProvider extends ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = "";

  Future<void> fetchWeatherDataByCity(String city) async {
    _isLoading = true;
    _error = "";

    try {
      final apiUrl =
          "${ApiEndpoints().baseWeatherUrl}$city&appid=${ApiEndpoints().apiKey}${ApiEndpoints().unit}";
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _weather = WeatherModel.fromJson(data);
      } else {
        _error = "failed to load data";
        print(_error);
      }
    } catch (e) {
      _error = "failed catch";
      print("$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
