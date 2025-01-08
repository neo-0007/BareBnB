import 'package:app/features/explore/services/explore_service.dart';
import 'package:app/features/wishlist/views/widgets/wishlist_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ExploreService exploreService = ExploreService();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'edit',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Wishlists',
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: exploreService.fetchFavoriteLocations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error fetching data'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No favorite items found'),
                    );
                  }

                  final favoriteItems = snapshot.data!.docs;

                  return GridView.builder(
                    itemCount: favoriteItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final item = favoriteItems[index].data() as Map<String, dynamic>;
                      return WishlistCard(
                        title: item['name'] ?? 'No Title',
                        imageUrl: item['imageUrls'][0] ??
                            'https://via.placeholder.com/150', // Default image
                        onTap: () {
                          // Handle card tap
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
