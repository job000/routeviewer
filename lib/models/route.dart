class MyRoute {
  final String id;
  final List<MapPoint> points;
  final String name;
  final String userId;

  MyRoute({required this.id, required this.points, required this.name, required this.userId});
}

class MapPoint {
  final double latitude;
  final double longitude;

  MapPoint({required this.latitude, required this.longitude});
}
