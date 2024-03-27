import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/secrets/api_endpoints.dart';


class WeatherDataFromPlaces with ChangeNotifier {
  double? lat;
  double? lng;

  String error = "";
  bool _isLoading = false;
  bool get isLoading=>_isLoading;

  Future getCoordinates(String placeId, BuildContext context) async {
    _isLoading = true;
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
      _isLoading = false;
      notifyListeners();
    }
  }
}
