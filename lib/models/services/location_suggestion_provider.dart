import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/models/secrets/api_endpoints.env';
import 'package:http/http.dart' as http;

class LocationSuggestionProvider with ChangeNotifier {
  List<dynamic> suggestions = [];

  void getSuggestion(String input, String sessiontoken) async {
    String url =
        "${ApiEndpoints().baseMapUrl}input=$input&key=${ApiEndpoints().mapApiKey}&sessiotoken=$sessiontoken";
        print(url);
    var response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        suggestions = jsonDecode(response.body.toString())['predictions'];
        print(suggestions);
        notifyListeners();
      } else {
        throw Exception("Failed to load suggestions");
      }
    } catch (e) {
      print("failed to load $e");
    } finally {
      notifyListeners();
    }
  }
}
