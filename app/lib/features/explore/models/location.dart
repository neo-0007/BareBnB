import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  final int? id;
  final String name;
  final String description;
  final List<String> imageUrls;
  final double rating;
  final String hostType;
  final String dates;
  final GeoPoint location;
  final int price;
  final bool isFavorite;

  Location({
    this.id,
    required this.description,
    required this.location,
    required this.name,
    required this.imageUrls,
    required this.rating,
    required this.hostType,
    required this.dates,
    required this.price,
    required this.isFavorite,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      imageUrls: json['imageUrls'],
      rating: json['rating'],
      hostType: json['hostType'],
      dates: json['dates'],
      price: json['price'],
      isFavorite: json['isFavorite'], 
      description: json['description'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrls': imageUrls,
      'rating': rating,
      'hostType': hostType,
      'dates': dates,
      'price': price,
      'isFavorite': isFavorite,
      'description': description,
      'location': location,
    };
  }
}
