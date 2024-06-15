// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/authentication_service.dart';
import 'services/settings_service.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationService()),
        ChangeNotifierProvider(create: (_) => SettingsService()),
      ],
      child: Consumer<SettingsService>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'Street View App',
            theme: settings.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: Consumer<AuthenticationService>(
              builder: (context, authService, _) {
                return authService.isAuthenticated ? HomeScreen() : LoginScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
