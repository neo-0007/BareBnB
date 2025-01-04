import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.imageUrl,
    required this.locationName,
    required this.rating,
    required this.hostType,
    required this.dates,
    required this.price,
    required this.isFavorite,
    required this.onFavTap,
  });

  final String imageUrl;
  final String locationName;
  final double rating;
  final String hostType;
  final String dates;
  final int price;
  final bool isFavorite;
  final VoidCallback onFavTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  height: screenSize.width * 0.78,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl
                      ,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon:
                      Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  color: isFavorite ? Color(0xFFDF4058) : Colors.white,
                  onPressed: onFavTap,
                ),
              ),
              // Dot Indicators
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == 0
                            ? Colors.white
                            : Colors.white.withAlpha(50),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                locationName,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 18),
                  SizedBox(width: 4),
                  Text('$rating'),
                ],
              ),
            ],
          ),
          Text(
            hostType,
            style: GoogleFonts.nunito(
              color: Colors.grey[600],
            ),
          ),
          Text(
            dates,
            style: GoogleFonts.nunito(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 5),
          // Prices
          Row(
            children: [
              Text(
                '\$$price',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(' per night'),
            ],
          ),
        ],
      ),
    );
  }
}
