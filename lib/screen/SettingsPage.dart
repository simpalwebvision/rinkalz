import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkModeEnabled = false; // Example setting

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  // Load user settings from SharedPreferences
  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      darkModeEnabled = prefs.getBool('darkModeEnabled') ?? false;
    });
  }

  // Save user settings to SharedPreferences
  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkModeEnabled', darkModeEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text('Dark Mode'),
              value: darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  darkModeEnabled = value;
                  saveSettings();
                });
              },
            ),
            // Add more settings here
          ],
        ),
      ),
    );
  }
}
