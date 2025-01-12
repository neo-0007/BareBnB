import 'package:app/features/explore/services/user_location_service.dart';

class UserLocationRepository {
  final UserLocationService _userLocationService;

  UserLocationRepository(this._userLocationService);

  Future<Map<String, double>> getUserLocation() async {
    try {
      final locationData = await _userLocationService.fetchUserLocation();
      return {'lat': locationData.latitude!, 'lng': locationData.longitude!};
    } catch (e) {
      throw Exception("Failed to get user location: $e");
    }
  }
}
