import 'package:flutter/material.dart';
import 'package:favorite_places/models/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.location = const PlaceLocation(
        latitude: 37.422,
        longitude: -122.084,
        address: '',
      )});

  final PlaceLocation location;

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
      ),
    ),
  }
}
