import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapButton extends StatelessWidget {
  const MapButton({super.key, required this.onMapTap});

  final VoidCallback onMapTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onMapTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF252525),
        ),
        child: Row(
          children: [
            Text(
              'Map',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
          ],
        ));
  }
}
