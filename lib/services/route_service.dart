import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/route.dart';

class RouteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveRoute(MyRoute route) async {
    await _firestore.collection('routes').add({
      'userId': route.userId,
      'name': route.name,
      'points': route.points.map((point) => {'latitude': point.latitude, 'longitude': point.longitude}).toList(),
    });
  }

  Stream<List<MyRoute>> getUserRoutes(String userId) {
    return _firestore.collection('routes').where('userId', isEqualTo: userId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => MyRoute(
        id: doc.id,
        name: doc['name'],
        userId: doc['userId'],
        points: (doc['points'] as List).map((point) => MapPoint(
          latitude: point['latitude'],
          longitude: point['longitude'],
        )).toList(),
      )).toList();
    });
  }
}
