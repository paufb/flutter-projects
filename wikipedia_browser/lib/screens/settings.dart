import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipedia_browser/widgets/setting_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SettingButton(
            icon: Icons.contrast,
            title: 'Theme',
            value: 'ThemeValue',
            onPressed: () {},
          ),
          Divider(height: 0),
          SettingButton(
            icon: Icons.language,
            title: 'Language',
            value: 'LanguageValue',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
