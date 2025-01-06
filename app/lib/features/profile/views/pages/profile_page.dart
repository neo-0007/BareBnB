import 'package:app/features/profile/views/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/icons/avatar-dummy.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Show Profile',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.navigate_next_sharp,
                        size: 50,
                        color: Color(0xFF252525),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Account Settings',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTiles(
                  text: 'Personal Information',
                  icon: Icons.person,
                  onTap: () {}),
              ProfileTiles(
                icon: Icons.lock,
                text: 'Privacy',
                onTap: () {},
              ),
              ProfileTiles(
                icon: Icons.credit_card,
                text: 'Payments',
                onTap: () {},
              ),
              ProfileTiles(
                icon: Icons.notifications,
                text: 'Notifications',
                onTap: () {},
              ),
              ProfileTiles(
                icon: Icons.translate,
                text: 'Translation',
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hosting',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTiles(
                icon: Icons.add_home_sharp,
                text: 'List your space',
                onTap: () {},
              ),
              ProfileTiles(
                icon: Icons.home_max_outlined,
                text: 'Host an Experience',
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Referrals & Credits',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTiles(
                icon: Icons.card_giftcard,
                text: 'Gift Cards',
                subtext: 'Send or redeem gift cards',
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Legal',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileTiles(
                icon: Icons.privacy_tip,
                text: 'Privacy Policy',
                onTap: () {},
              ),
              ProfileTiles(
                icon: Icons.article,
                text: 'Terms of Service',
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
