import 'package:cloud_firestore/cloud_firestore.dart';

class ExploreService {
  final CollectionReference locationsCollection =
      FirebaseFirestore.instance.collection('locations');

  Stream<QuerySnapshot> fetchLocations() {
    final locationStream = locationsCollection.snapshots();
    return locationStream;
  }

  Stream<QuerySnapshot> fetchFavoriteLocations() {
    final favoriteLocationsStream =
        locationsCollection.where('isFavorite', isEqualTo: true).snapshots();
    return favoriteLocationsStream;
  }

    Future<void> updateFavoriteStatus(String documentId, bool isFavorite) async {
    try {
      await locationsCollection
          .doc(documentId)
          .update({'isFavorite': isFavorite});
    } catch (e) {
      print("Error updating favorite status: $e");
      throw Exception('Failed to update favorite status');
    }
  }
}
