import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'Trips',
              style: GoogleFonts.roboto(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(color: const Color.fromARGB(62, 158, 158, 158),),
            SizedBox(
              height: 10,
            ),
            Text(
              'No Trips booked ... yet!',
              style:
                  GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Time to dust off your bags and start planning your next adventure.',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.normal, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Text(
                'Start Searching',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(color: const Color.fromARGB(62, 158, 158, 158),),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Row(
                children: [
              Text('Can\'t find your reservation here ?',style: GoogleFonts.roboto(
                      fontWeight: FontWeight.normal,
                      
                      color: Colors.black),),
              Text(' Help Centre',style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      
                      color: Colors.black),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
