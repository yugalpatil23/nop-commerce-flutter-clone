import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_constants.dart';

class CurrencyNotifier extends StateNotifier<String> {
  CurrencyNotifier() : super(AppConstants.appDefaultCurrency) {
    _loadCurrency();
  }

  Future<void> _loadCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    final code =
        prefs.getString(AppConstants.parentPayCurrency) ??
        AppConstants.appDefaultCurrency;
    state = code;
  }

  Future<void> changeCurrency(String code) async {
    state = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.parentPayCurrency, code);
  }
}

final currencyProvider = StateNotifierProvider<CurrencyNotifier, String>(
  (ref) => CurrencyNotifier(),
);
