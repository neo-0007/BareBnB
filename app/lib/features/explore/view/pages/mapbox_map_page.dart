import 'package:app/core/utils/app_permissions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapboxMapPage extends StatefulWidget {
  const MapboxMapPage({super.key});

  @override
  State<MapboxMapPage> createState() => _MapboxMapPageState();
}

class _MapboxMapPageState extends State<MapboxMapPage> {
  MapboxMap? mapboxMap;
  AppPermissions appPermissions = AppPermissions();

  void _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;

    appPermissions.checkLocationPermission().then((isGranted) {
      if (isGranted) {
        mapboxMap.location.updateSettings(
          LocationComponentSettings(
            enabled: true,
            showAccuracyRing: true,
          ),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Location permission is required to show your location.'),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      cameraOptions: CameraOptions(
        zoom: 10,
        center: Point(
          coordinates: Position(
            91.7086, // Longitude
            26.1158, // Latitude
          ),
        ),
      ),
      onMapCreated: _onMapCreated,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
    );
  }
}
