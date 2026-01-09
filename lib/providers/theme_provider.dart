import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_constants.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Enum for theme choices
enum AppTheme { system, light, dark }

// Provider for the app theme
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    loadTheme(); // Load saved theme on init
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(AppConstants.themeModeKey) ?? 'system';
    switch (themeString) {
      case 'light':
        state = ThemeMode.light;
        break;
      case 'dark':
        state = ThemeMode.dark;
        break;
      default:
        state = ThemeMode.system;
    }
  }

  Future<void> setTheme(AppTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    switch (theme) {
      case AppTheme.light:
        state = ThemeMode.light;
        await prefs.setString(AppConstants.themeModeKey, 'light');
        break;
      case AppTheme.dark:
        state = ThemeMode.dark;
        await prefs.setString(AppConstants.themeModeKey, 'dark');
        break;
      case AppTheme.system:
        state = ThemeMode.system;
        await prefs.setString(AppConstants.themeModeKey, 'system');
        break;
    }
  }
}
