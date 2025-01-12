import 'dart:convert';

import 'package:app/core/utils/app_permissions.dart';
import 'package:app/core/widgets/icon_rounded_button.dart';
import 'package:app/features/explore/repositories/path_repository.dart';
import 'package:app/features/explore/repositories/user_location_repository.dart';
import 'package:app/features/explore/services/path_finding_service.dart';
import 'package:app/features/explore/services/user_location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class LocationInMap extends StatefulWidget {
  const LocationInMap(
      {super.key,
      required this.latitude,
      required this.longitude,
      this.isNavigationPage = false});

  final double latitude; // Destination latitude
  final double longitude; // Destination longitude
  final bool isNavigationPage;

  @override
  State<LocationInMap> createState() => _LocationInMapState();
}

class _LocationInMapState extends State<LocationInMap> {
  MapboxMap? mapboxMap;
  PointAnnotationManager? pointAnnotationManager;
  AppPermissions appPermissions = AppPermissions();
  UserLocationRepository userLocationRepository =
      UserLocationRepository(UserLocationService());
  PathFindingRepository pathFindingRepository =
      PathFindingRepository(PathFindingService());

  double? userLatitude;
  double? userLongitude;

  // Fetch current user location
  Future<void> _fetchUserLocation() async {
    print('Fetching user location');
    try {
      final location = await userLocationRepository.getUserLocation();
      setState(() {
        userLatitude = location['lat'];
        userLongitude = location['lng'];
      });
      print('User location: $userLatitude, $userLongitude');
    } catch (e) {
      print('Error fetching user location: $e');
    }
  }

  // Fetch and draw route
  Future<void> _fetchAndDrawRoute() async {
    print('Fetching and drawing route');
    if (userLatitude != null && userLongitude != null) {
      try {
        final route = await pathFindingRepository.getPathCoordinates(
            userLatitude!, userLongitude!, widget.latitude, widget.longitude);
        drawRoute(mapboxMap!, route);
        print('Route drawn');
      } catch (e) {
        print('Error fetching route: $e');
      }
    }
  }

  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;

    pointAnnotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();

    // Load the image from assets
    final ByteData bytes =
        await rootBundle.load('assets/icons/location-airbnb.png');
    final Uint8List imageData = bytes.buffer.asUint8List();

    // Create a PointAnnotationOptions for destination
    PointAnnotationOptions pointAnnotationOptions = PointAnnotationOptions(
      geometry: Point(
        coordinates: Position(widget.longitude, widget.latitude),
      ), // Destination coordinates
      image: imageData,
      iconSize: 0.3,
    );

    pointAnnotationManager?.create(pointAnnotationOptions);
  }

  void drawRoute(MapboxMap mapboxMap, List<List<double>> route) {
    final lineString = {
      "type": "Feature",
      "geometry": {
        "type": "LineString",
        "coordinates": route.map((coords) => [coords[1], coords[0]]).toList()
      }
    };

    mapboxMap.style.addSource(GeoJsonSource(
      id: "route-source",
      data: jsonEncode(lineString),
    ));

    mapboxMap.style.addLayer(LineLayer(
      id: "route-layer",
      sourceId: "route-source",
      lineWidth: 5.0,
      lineColor: 0xFF333333,
    ));
  }

  void navigationIsOn() async {
    print('Navigation is On');
    await _fetchUserLocation();
    if (userLatitude != null && userLongitude != null) {
      _fetchAndDrawRoute();
    }
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MapWidget(
          styleUri: MapboxStyles.LIGHT,
          cameraOptions: CameraOptions(
            zoom: 11,
            center: Point(
              coordinates: Position(
                widget.longitude, // Set destination coordinates initially
                widget.latitude,
              ),
            ),
          ),
          onMapCreated: _onMapCreated,
        ),
        widget.isNavigationPage
            ? Positioned(
                bottom: 10,
                right: 10,
                child: IconRoundedButton(
                  icon: Icons.navigation_outlined,
                  onPressed: () {
                    print('Navigation button pressed');
                    navigationIsOn();
                  },
                ),
              )
            : Container()
      ],
    );
  }
}
