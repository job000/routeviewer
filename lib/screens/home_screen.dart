// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/authentication_service.dart';
import '../services/route_service.dart';
import '../services/settings_service.dart';
import 'map_screen.dart';
import 'settings_screen.dart';
import '../widgets/route_list.dart';
import '../models/route.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthenticationService>();
    final routeService = RouteService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authService.signOut();
            },
          ),
        ],
      ),
      body: StreamProvider<List<MyRoute>>.value(
        value: routeService.getUserRoutes(authService.user!.uid),
        initialData: [],
        child: RouteList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
        },
      ),
    );
  }
}
