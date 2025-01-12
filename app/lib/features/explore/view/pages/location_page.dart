import 'package:app/core/widgets/icon_rounded_button.dart';
import 'package:app/features/explore/view/widgets/location_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key, required this.name, required this.description, required this.imageUrl, required this.rating, required this.hostType, required this.location});

  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String hostType;
  final GeoPoint location;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    widget.imageUrl,
                    height: screenSize.width * 0.66,
                    width: screenSize.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconRoundedButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      actions: [
                        IconRoundedButton(
                          icon: Icons.favorite_border_rounded,
                          onPressed: () {},
                        ),
                        IconRoundedButton(
                          icon: Icons.ios_share_rounded,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.description,
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '1 Bedroom - 1 Bathroom - 1 Kitchen',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          '${widget.rating}',
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: const Color.fromARGB(62, 158, 158, 158),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/icons/avatar-dummy.png'),
                      ),
                      title: Text('Hosted By ${widget.hostType}'),
                      subtitle: Text('Hosting for 2 years'),
                    ),
                    Divider(
                      color: const Color.fromARGB(62, 158, 158, 158),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Where you\'ll be',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      height: 200,
                      child: LocationInMap(
                        latitude: widget.location.latitude,
                        longitude: widget.location.longitude,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: const Color.fromARGB(62, 158, 158, 158),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationInMap(
                                latitude: widget.location.latitude,
                                longitude: widget.location.longitude,
                                isNavigationPage: true,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFDF4058),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Get Directions',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
