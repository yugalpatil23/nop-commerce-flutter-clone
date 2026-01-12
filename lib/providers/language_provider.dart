import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_constants.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(Locale(AppConstants.appDefaultLanguage)) {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final code =
        prefs.getString(AppConstants.parentPayLaunguage) ??
        AppConstants.appDefaultLanguage;
    state = Locale(code);
  }

  Future<void> changeLanguage(String code) async {
    state = Locale(code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.parentPayLaunguage, code);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>(
  (ref) => LanguageNotifier(),
);
