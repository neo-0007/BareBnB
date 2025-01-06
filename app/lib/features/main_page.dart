import 'package:app/features/explore/view/pages/explore_page.dart';
import 'package:app/features/inbox/views/pages/inbox_page.dart';
import 'package:app/features/profile/views/pages/profile_page.dart';
import 'package:app/features/trips/views/pages/trip_page.dart';
import 'package:app/features/wishlist/views/pages/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Widget> _pages = [
    const ExplorePage(),
    const WishlistPage(),
    const TripPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  int _selectedPageIndex = 0;

  Widget _buildIcon(String assetPath, int index) {
  return 
    SvgPicture.asset(
      height: 32,
      width: 32,
      assetPath,
      colorFilter: ColorFilter.mode(
        _selectedPageIndex == index ? Color(0xFFDF4058) : Color(0xFF717171),
        BlendMode.srcIn,
      ),
  );
}


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: _buildIcon('assets/icons/bnav-explore.svg',0),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: _buildIcon('assets/icons/bnav-wishlist.svg',1),
                label: 'Wishlists'),
            BottomNavigationBarItem(
                icon: _buildIcon('assets/icons/bnav-airbnblogo.svg',2),
                label: 'Trips'),
            BottomNavigationBarItem(
                icon: _buildIcon('assets/icons/bnav-inbox.svg',3),
                label: 'Inbox'),
            BottomNavigationBarItem(
                icon: _buildIcon('assets/icons/bnav-profile.svg',4),
                label: 'Profile'),
          ],
          selectedItemColor: Color(0xFFDF4058),
          unselectedItemColor: Color(0xFF717171),
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          currentIndex: _selectedPageIndex,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.nunito(color: Color(0xFFDF4058),fontWeight: FontWeight.bold,fontSize:10),
          unselectedLabelStyle: GoogleFonts.nunito(color: Color(0xFF717171),fontWeight: FontWeight.w400,fontSize:10),
        ),
        body: _pages[_selectedPageIndex],
    );
  }
}
