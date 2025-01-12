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
  late MapboxMap _controller;

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
      onMapCreated: (controller) {
        _controller = controller;
        _controller.location.updateSettings(
          LocationComponentSettings(
            enabled: true,
            showAccuracyRing: true,
          ),
        );
      },
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
      },
    );
  }
}
