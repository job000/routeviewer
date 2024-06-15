import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatelessWidget {
  final List<LatLng> points;
  final Function(LatLng) onTap;

  CustomMap({required this.points, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: points.isNotEmpty ? points.first : LatLng(37.7749, -122.4194),
        zoom: 12,
      ),
      markers: points.map((point) => Marker(
        markerId: MarkerId(point.toString()),
        position: point,
      )).toSet(),
      onTap: onTap,
    );
  }
}
