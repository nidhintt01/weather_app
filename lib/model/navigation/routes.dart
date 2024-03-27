import 'package:flutter/material.dart';
import 'package:weather_app/view/location_select_page.dart';

Map<String, Widget Function(BuildContext)> routes={
  "locationSelectPage": (BuildContext locationPageContext)=>const LocationSelectPage(),
};