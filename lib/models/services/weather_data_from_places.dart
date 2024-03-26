import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/secrets/api_endpoints.dart';


class WeatherDataFromPlaces with ChangeNotifier {
  double? lat;
  double? lng;

  String error = "";
  bool isLoading = false;

  Future getCoordinates(String placeId, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    String url =
        "${ApiEndpoints().basePlaceUrl}placeid=$placeId&key=${ApiEndpoints().mapApiKey}&fields=geometry";
    var response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)["result"];
        lat = data["geometry"]["location"]["lat"];
        lng = data["geometry"]["location"]["lng"];
        if (lat != null && lng != null) {
          print("$lat,$lng is feteched and passed");
        } else {
          error = "failed to load data";
          print(error);
        }
      } else {
        error = "failed to load data";
        print(error);
      }
    } catch (e) {
      error = "failed to load data";
      print("$e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
