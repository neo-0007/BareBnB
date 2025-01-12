import 'package:app/core/utils/app_permissions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class LocationInMap extends StatefulWidget {
  const LocationInMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  State<LocationInMap> createState() => _LocationInMapState();
}

class _LocationInMapState extends State<LocationInMap> {
  MapboxMap? mapboxMap;
  PointAnnotationManager? pointAnnotationManager;
  AppPermissions appPermissions = AppPermissions();

  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;

    pointAnnotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();

    // Load the image from assets
    final ByteData bytes =
        await rootBundle.load('assets/icons/location-airbnb.png');
    final Uint8List imageData = bytes.buffer.asUint8List();

    // Create a PointAnnotationOptions
    PointAnnotationOptions pointAnnotationOptions = PointAnnotationOptions(
      geometry: Point(
        coordinates: Position(widget.longitude, widget.latitude),
      ), // Example coordinates
      image: imageData,
      iconSize: 0.3,
    );

    // Add the annotation to the map
    pointAnnotationManager?.create(pointAnnotationOptions);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      styleUri: MapboxStyles.LIGHT,
      cameraOptions: CameraOptions(
        zoom: 11,
        center: Point(
          coordinates: Position(
            widget.longitude,
            widget.latitude,
          ),
        ),
      ),
      onMapCreated: _onMapCreated,
    );
  }
}
