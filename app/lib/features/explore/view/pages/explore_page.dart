import 'package:app/features/explore/repositories/explore_repository.dart';
import 'package:app/features/explore/services/explore_service.dart';
import 'package:app/features/explore/view/pages/location_page.dart';
import 'package:app/features/explore/view/pages/mapbox_map_page.dart';
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
  late ExploreRepository _exploreRepository;

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
    _exploreRepository = ExploreRepository(exploreService: ExploreService());
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
            fit: StackFit.expand,
            alignment: Alignment
                .center, // Add this to ensure Stack fills available space
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _exploreRepository.getAllLocations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No locations found'));
                  }

                  final locations = snapshot.data!.docs;
                  final location1 = locations[0].data() as Map<String, dynamic>;
                  print(location1);
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      final locationData =
                          locations[index].data() as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationPage(
                                imageUrl: locationData['imageUrls'][0],
                                name: locationData['name'],
                                description: locationData['description'],
                                hostType:locationData['hostType'],
                                location: locationData['location'],
                                rating: locationData['rating'] is String
                                    ? double.tryParse(locationData['rating']) ?? 0.0
                                    : locationData['rating']?.toDouble() ?? 0.0,
                              ),
                            ),
                          );
                        },
                        child: LocationCard(
                          imageUrl: locationData['imageUrls'][0],
                          locationName: locationData['name'],
                          rating: locationData['rating'] is String
                              ? double.tryParse(locationData['rating']) ?? 0.0
                              : locationData['rating']?.toDouble() ?? 0.0,
                          hostType: locationData['hostType'],
                          dates: formattedDate(),
                          price: locationData['price'],
                          isFavorite: locationData['isFavorite'],
                          onFavTap: () async {
                            final documentId = locations[index].id;
                            bool currentStatus =
                                locationData['isFavorite'] ?? false;
                            bool newStatus = !currentStatus;
                            await _exploreRepository.updateFavoriteStatus(
                                documentId, newStatus);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  duration: const Duration(seconds: 2),
                                  content: Text(newStatus
                                      ? 'Added to favorites'
                                      : 'Removed from favorites'),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0, // Add left/right constraints
                child: Center(
                  child: SizedBox(
                    width: 100,
                    child: MapButton(
                      onMapTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return DraggableScrollableSheet(
                              initialChildSize:
                                  0.75, // Set the initial height of the modal
                              minChildSize:
                                  0.5, // Minimum height the modal can be dragged to
                              maxChildSize:
                                  1.0, // Maximum height the modal can expand to
                              expand: false, // Prevent full-screen expansion
                              builder: (context, scrollController) {
                                return GestureDetector(
                                  onVerticalDragUpdate:
                                      (_) {}, // Prevent the modal from intercepting gestures
                                  behavior: HitTestBehavior
                                      .opaque, // Ensure gestures pass through to the map
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: MapboxMapPage(),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
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
