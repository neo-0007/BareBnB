import 'package:app/features/explore/view/widgets/explore_searchbar.dart';
import 'package:app/features/explore/view/widgets/location_card.dart';
import 'package:app/features/explore/view/widgets/map_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          },
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        bottom: TabBar(
          controller: _tabController,
          padding: EdgeInsets.zero,
          indicatorColor: Color(0xFF252525),
          dragStartBehavior: DragStartBehavior.start,
          onTap: (index) {
            print('Tab $index tapped');
          },
          isScrollable: true,
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
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: false,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: true,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8)
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: MapButton(onMapTap: (){}),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: false,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: true,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8)
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: MapButton(onMapTap: (){}),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: false,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: true,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8)
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: MapButton(onMapTap: (){}),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: false,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: true,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8)
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: MapButton(onMapTap: (){}),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: false,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8),
                    LocationCard(
                        imageUrl:
                            'https://a0.muscache.com/im/pictures/miso/Hosting-1286208323180296244/original/59132e17-641d-468c-88a6-289952403d08.jpeg',
                        hostType: 'SuperHost',
                        isFavorite: true,
                        onFavTap: () {},
                        price: 1000,
                        locationName: 'Mandrem, India',
                        dates: '30Jan - 10Feb ',
                        rating: 4.8)
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: MapButton(onMapTap: (){}),
              )
            ],
          ),
        ],
      ),
    );
  }
}
