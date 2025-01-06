import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Inbox',
                style: GoogleFonts.roboto(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'Messages'),
                  Tab(text: 'Notifications'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: Container(
                            width: 40, // Width of the CircleAvatar
                            height: 40, // Height of the CircleAvatar
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF252525), // Border color
                                width: 2, // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child:
                                  Image.asset('assets/icons/avatar-dummy.png'),
                            ),
                          ),
                          title: Text('User ${index+1}'),
                          subtitle: Text('This is a Message'),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(10),
                          title: Text('Notification ${index+1}'),
                          subtitle: Text('This is a notification'),
                        );
                      },
                    ),
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
