import 'package:app/features/wishlist/views/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 18
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
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.8, // Adjusted to make room for text
                ),
                itemBuilder: (context, index) {
                  return WishlistCard(title:'Item ${index+1}', imageUrl: 'https://a0.muscache.com/im/pictures/miso/Hosting-869412107957653896/original/855fd4f6-0fd7-4f19-9f14-5ec43de40f91.jpeg', onTap: (){});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}