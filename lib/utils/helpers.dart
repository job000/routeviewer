// helpers.dart
import 'package:google_maps_flutter/google_maps_flutter.dart';

// constants.dart
const String mapApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';



LatLng latLngFromMapPoint(Map<String, dynamic> point) {
  return LatLng(point['latitude'], point['longitude']);
}

Map<String, dynamic> mapPointFromLatLng(LatLng latLng) {
  return {'latitude': latLng.latitude, 'longitude': latLng.longitude};
}
