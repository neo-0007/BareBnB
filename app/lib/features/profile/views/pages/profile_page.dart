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
                    backgroundImage: AssetImage('assets/icons/avatar-dummy.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Show Profile', style: TextStyle(color: Colors.grey)),
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
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Personal Information'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Privacy'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Payments'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.translate),
                  title: Text('Translation'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
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
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.add_home_sharp),
                  title: Text('List your space'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.home_max_outlined),
                  title: Text('Host an Experience'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
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
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.card_giftcard),
                  title: Text('Gift Cards'),
                  subtitle: Text('Send or redeem gift cards'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
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
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Terms of Service'),
                  trailing: Icon(Icons.navigate_next_sharp),
                ),
              ),
              Divider(
                color: const Color.fromARGB(62, 158, 158, 158),
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
