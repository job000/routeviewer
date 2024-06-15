import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/route.dart';
import 'route_item.dart';

class RouteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = Provider.of<List<MyRoute>>(context);

    return ListView.builder(
      itemCount: routes.length,
      itemBuilder: (context, index) {
        return RouteItem(route: routes[index]);
      },
    );
  }
}
