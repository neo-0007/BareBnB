class Location {
  final int? id;
  final String name;
  final List<String> imageUrls;
  final double rating;
  final String hostType;
  final String dates;
  final int price;
  final bool isFavorite;

  Location({
    this.id,
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
    };
  }
}
