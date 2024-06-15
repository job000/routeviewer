import 'package:flutter/material.dart';
import '../models/route.dart';

class RouteItem extends StatelessWidget {
  final MyRoute route;

  RouteItem({required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(route.name),
        subtitle: Text('${route.points.length} points'),
        trailing: IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            // Handle route sharing
          },
        ),
        onTap: () {
          // Handle route selection
        },
      ),
    );
  }
}
