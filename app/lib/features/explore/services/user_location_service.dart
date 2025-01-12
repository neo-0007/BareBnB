// user_location_service.dart
import 'package:location/location.dart';

class UserLocationService {
  Future<LocationData> fetchUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location service is disabled');
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permission is denied');
      }
    }

    try {
      return await location.getLocation();
    } catch (e) {
      throw Exception('Error fetching location: $e');
    }
  }
}
