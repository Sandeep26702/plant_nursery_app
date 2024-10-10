import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Current selected theme (light or dark)
  bool isDarkTheme = false;

  // List of supported languages
  List<String> languages = ['English', 'Spanish', 'French', 'German'];
  String selectedLanguage = 'English'; // default language

  // Toggle theme function
  void _toggleTheme(bool value) {
    setState(() {
      isDarkTheme = value;
    });
  }

  // Change language function
  void _changeLanguage(String? value) {
    setState(() {
      selectedLanguage = value ?? 'English';
      // TODO: Implement localization changes here
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Theme switcher
            ListTile(
              title: const Text('Theme'),
              subtitle: Text(isDarkTheme ? 'Dark Mode' : 'Light Mode'),
              trailing: Switch(
                value: isDarkTheme,
                onChanged: _toggleTheme,
              ),
            ),

            const Divider(),

            // Language selector
            ListTile(
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                value: selectedLanguage,
                onChanged: _changeLanguage,
                items: languages.map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
              ),
            ),

            const Divider(),

            // Other settings can go here
            const ListTile(
              title: Text('Other Settings'),
              subtitle: Text('You can add more settings here.'),
            ),
          ],
        ),
      ),
    );
  }
}
