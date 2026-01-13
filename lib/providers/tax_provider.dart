import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_constants.dart';

class TaxNotifier extends StateNotifier<String> {
  TaxNotifier() : super('excludingTax') {
    _loadTax();
  }

  Future<void> _loadTax() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString(AppConstants.parentPayTax) ?? 'excludingTax';
  }

  Future<void> changeTax(String code) async {
    state = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.parentPayTax, code);
  }
}

final taxProvider = StateNotifierProvider<TaxNotifier, String>(
  (ref) => TaxNotifier(),
);
