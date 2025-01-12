// path_finding_service.dart
import 'dart:convert';
import 'package:app/core/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class PathFindingService {
  Future<Map<String, dynamic>> fetchPathCoordinates(double sourceLat,
      double sourceLng, double destLat, double destLng) async {
    final String accessToken = AppConstants.MAPBOX_ACCESS_TOKEN;
    final String url =
        '${AppConstants.mapBoxDrivingProfile}/$sourceLng,$sourceLat;$destLng,$destLat?geometries=geojson&overview=full&steps=false&access_token=$accessToken';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to fetch route: ${response.body}");
      }
    } catch (e) {
      throw Exception("Failed to fetch route: $e");
    }
  }
}
