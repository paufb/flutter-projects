import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia_browser/providers/settings_provider.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = context.watch<SettingsProvider>().themeMode;
    return SimpleDialog(
      title: Text('Theme'),
      children: [
        RadioGroup<ThemeMode>(
          groupValue: currentThemeMode,
          onChanged: (themeMode) {
            context.read<SettingsProvider>().setTheme(themeMode!);
            context.pop();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RadioListTile<ThemeMode>(
                title: Text('Light'),
                value: ThemeMode.light,
              ),
              const RadioListTile<ThemeMode>(
                title: Text('Dark'),
                value: ThemeMode.dark,
              ),
              const RadioListTile<ThemeMode>(
                title: Text('System'),
                value: ThemeMode.system,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
