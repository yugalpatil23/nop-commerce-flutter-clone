// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';

class ThemeModeScreen extends ConsumerWidget {
  const ThemeModeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    AppTheme themeModeToAppTheme(ThemeMode mode) {
      switch (mode) {
        case ThemeMode.light:
          return AppTheme.light;
        case ThemeMode.dark:
          return AppTheme.dark;
        default:
          return AppTheme.system;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Change Theme Mode')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RadioListTile<AppTheme>(
              title: const Text('System'),
              value: AppTheme.system,
              groupValue: themeModeToAppTheme(themeMode),
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeProvider.notifier).setTheme(value);
                }
              },
            ),
            RadioListTile<AppTheme>(
              title: const Text('Light'),
              value: AppTheme.light,
              groupValue: themeModeToAppTheme(themeMode),
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeProvider.notifier).setTheme(value);
                }
              },
            ),
            RadioListTile<AppTheme>(
              title: const Text('Dark'),
              value: AppTheme.dark,
              groupValue: themeModeToAppTheme(themeMode),
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeProvider.notifier).setTheme(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
