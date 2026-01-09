import 'dart:developer';

import 'package:flutter_application_2/utils/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: AppConstants.parentPayAuthToken, value: token);
  }

  Future<String?> getToken() async {
    try {
      return await _storage.read(key: AppConstants.parentPayAuthToken);
    } catch (e) {
      log("error in storing tokren---${e}");
      return null;
    }
  }

  Future<void> clearToken() async {
    await _storage.delete(key: AppConstants.parentPayAuthToken);
  }
}
