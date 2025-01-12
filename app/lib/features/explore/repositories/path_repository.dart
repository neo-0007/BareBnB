// path_finding_repository.dart
import 'package:app/features/explore/services/path_finding_service.dart';

class PathFindingRepository {
  final PathFindingService _pathFindingService;

  PathFindingRepository(this._pathFindingService);

  Future<List<List<double>>> getPathCoordinates(
      double sourceLat, double sourceLng, double destLat, double destLng) async {
    try {
      final data = await _pathFindingService.fetchPathCoordinates(
          sourceLat, sourceLng, destLat, destLng);
      final route = data['routes'][0]['geometry']['coordinates'] as List;
      return route
          .map((coords) => [coords[1] as double, coords[0] as double])
          .toList();
    } catch (e) {
      throw Exception("Failed to get path coordinates: $e");
    }
  }
}
