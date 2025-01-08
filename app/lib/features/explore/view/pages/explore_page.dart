import 'package:app/features/explore/services/explore_service.dart';
import 'package:app/features/explore/view/pages/search_page.dart';
import 'package:app/features/explore/view/widgets/explore_searchbar.dart';
import 'package:app/features/explore/view/widgets/location_card.dart';
import 'package:app/features/explore/view/widgets/map_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> navBarImages = [
    'assets/icons/tnav-amazingviews.svg',
    'assets/icons/tnav-beaches.svg',
    'assets/icons/tnav-golfing.svg',
    'assets/icons/tnav-tinyhomes.svg',
    'assets/icons/tnav-ufo.svg',
  ];

  String formattedDate() {
    final now = DateTime.now();
    return DateFormat('d MMM').format(now);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ExploreSearchbar(
          onTap: () {
            print('Searchbar tapped');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
          },
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        bottom: TabBar(
          controller: _tabController,
          padding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
          indicatorColor: Color(0xFF252525),
          dragStartBehavior: DragStartBehavior.start,
          onTap: (index) {
            print('Tab $index tapped');
          },
          isScrollable: true,
          physics: BouncingScrollPhysics(),
          dividerColor: const Color.fromARGB(255, 237, 237, 237),
          tabs: List.generate(
            5,
            (index) => Tab(
              child: SizedBox(
                height: 40,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _tabController.index == index
                        ? const Color(0xFF252525)
                        : const Color(0xFF717171),
                    BlendMode.srcIn,
                  ),
                  child: SvgPicture.asset(
                    navBarImages[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          5,
          (index) => Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: ExploreService().fetchLocations(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No locations found'));
                        }

                        final locations = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: locations.length,
                          itemBuilder: (context, index) {
                            final locationData =
                                locations[index].data() as Map<String, dynamic>;
                            return LocationCard(
                              imageUrl: locationData['imageUrls'][0],
                              locationName: locationData['name'],
                              rating: locationData['rating'],
                              hostType: locationData['hostType'],
                              dates: formattedDate(),
                              price: locationData['price'],
                              isFavorite: locationData['isFavorite'],
                              onFavTap: () async {
                                final locationData = locations[index].data()
                                    as Map<String, dynamic>;
                                final documentId = locations[index].id;

                                bool currentStatus =
                                    locationData['isFavorite'] ?? false;
                                bool newStatus = !currentStatus;

                                await ExploreService().updateFavoriteStatus(
                                    documentId, newStatus);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 2),
                                    content: Text(newStatus
                                        ? 'Added to favorites'
                                        : 'Removed from favorites'),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                child: MapButton(onMapTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
