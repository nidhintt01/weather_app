import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/model/services/location_decode.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  final LocationDecode _locationDecode = LocationDecode();
  Placemark? _currentLocationName;
  String? city;
  double? lat;
  double? lng;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> determinePosition() async {
    bool _isLoading = true;
    //notifyListeners();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentPosition = null;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      _currentPosition = null;
    }

    if (permission == LocationPermission.deniedForever) {
      _currentPosition = null;
    }
    _currentPosition = await Geolocator.getCurrentPosition();

    if (_currentPosition == null) {
      _isLoading = false;
      notifyListeners();
    }

    if (_currentPosition != null) {
      lat = _currentPosition?.latitude;
      lng = _currentPosition?.longitude;
      notifyListeners();
    }

    _currentLocationName = await _locationDecode.getLocation(_currentPosition);
    if (_currentLocationName != null) {
      city = _currentLocationName?.locality;
      notifyListeners();
    }
  }
}
