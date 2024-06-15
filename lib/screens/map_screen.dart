// ignore_for_file: unused_field, prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/services/authentication_service.dart';
import 'package:provider/provider.dart';
import '../services/route_service.dart';
import '../models/route.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};
  List<LatLng> _points = [];

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _addMarker(LatLng position) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(position.toString()),
        position: position,
      ));
      _points.add(position);
    });
  }

  void _saveRoute() async {
    final authService = Provider.of<AuthenticationService>(context, listen: false);
    final routeService = RouteService();

    final route = MyRoute(
      id: '',
      name: 'My Route',
      userId: authService.user!.uid,
      points: _points.map((point) => MapPoint(latitude: point.latitude, longitude: point.longitude)).toList(),
    );

    await routeService.saveRoute(route);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveRoute,
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12,
        ),
        markers: _markers,
        onTap: _addMarker,
      ),
    );
  }
}
