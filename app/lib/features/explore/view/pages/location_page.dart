import 'package:app/core/widgets/back_button.dart';
import 'package:app/features/explore/view/pages/mapbox_map_page.dart';
import 'package:app/features/explore/view/widgets/location_map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

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
                    'https://a0.muscache.com/im/pictures/hosting/Hosting-1286031051677258477/original/8aa8d6fd-8319-4b7a-93ce-0462a5e6edab.jpeg',
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
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location Name',
                        style: GoogleFonts.roboto(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Location Description',
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
                            '4.5',
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
                        title: Text('Hosted By Hrishi'),
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
                          latitude: 26.7346827,
                          longitude: 94.1847289,
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
