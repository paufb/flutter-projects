import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia_browser/providers/settings_provider.dart';
import 'package:wikipedia_browser/widgets/setting_button.dart';
import 'package:wikipedia_browser/widgets/settings/theme_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  String _capitalizeString(String str) {
    return "${str[0].toUpperCase()}${str.substring(1)}";
  }

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = context.watch<SettingsProvider>().themeMode;
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
            value: _capitalizeString(currentThemeMode.name),
            onPressed: () {
              showDialog(context: context, builder: (_) => ThemeDialog());
            },
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
