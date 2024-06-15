import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/settings_service.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsService = context.read<SettingsService>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: settingsService.isDarkMode,
            onChanged: (value) {
              settingsService.toggleDarkMode();
            },
          ),
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: settingsService.notificationsEnabled,
            onChanged: (value) {
              settingsService.toggleNotifications();
            },
          ),
        ],
      ),
    );
  }
}
