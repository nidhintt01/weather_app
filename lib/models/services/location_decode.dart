import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationDecode {
  Future<Placemark?> getLocation(Position? position) async {
    if (position != null) {
      try {
        final placemark = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemark.isNotEmpty) {
          return placemark[0];
        }
      } catch (e) {
        print("Error fetching location");
      }
    }
    return null;
  }
}
