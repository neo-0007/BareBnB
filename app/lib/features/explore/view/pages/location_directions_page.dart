import 'package:app/features/explore/view/widgets/location_map.dart';
import 'package:flutter/material.dart';

class LocationDirectionsPage extends StatefulWidget {
  const LocationDirectionsPage({
    super.key,
    required this.destinationLat,
    required this.destinationLng,
  });

  final double destinationLat;
  final double destinationLng;

  @override
  State<LocationDirectionsPage> createState() => _LocationDirectionsPageState();
}

class _LocationDirectionsPageState extends State<LocationDirectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationInMap(
        latitude: widget.destinationLat,
        longitude: widget.destinationLng,
      ),
    );
  }
}
