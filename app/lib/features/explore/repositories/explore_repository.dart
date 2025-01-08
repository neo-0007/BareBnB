import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/features/explore/services/explore_service.dart';

class ExploreRepository {
  final ExploreService _exploreService;

  ExploreRepository({required ExploreService exploreService})
      : _exploreService = exploreService;

  // Fetch all locations
  Stream<QuerySnapshot> getAllLocations() {
    return _exploreService.fetchLocations();
  }

  // Fetch favorite locations
  Stream<QuerySnapshot> getFavoriteLocations() {
    return _exploreService.fetchFavoriteLocations();
  }

  // Update favorite status for a location
  Future<void> updateFavoriteStatus(String documentId, bool isFavorite) async {
    try {
      await _exploreService.updateFavoriteStatus(documentId, isFavorite);
    } catch (e) {
      print("Error in repository while updating favorite status: $e");
      rethrow;  // Propagate the error
    }
  }
}
