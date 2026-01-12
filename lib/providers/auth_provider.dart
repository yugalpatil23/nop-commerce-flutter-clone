import 'dart:developer';

import 'package:flutter_riverpod/legacy.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import '../services/secure_storage_service.dart';

class AuthState {
  final bool isLoading;
  final UserModel? user;

  AuthState({this.isLoading = false, this.user});

  bool get isLoggedIn => user != null;

  AuthState copyWith({bool? isLoading, UserModel? user}) {
    return AuthState(isLoading: isLoading ?? this.isLoading, user: user);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthService(), UserService(), SecureStorageService());
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final UserService _userService;
  final SecureStorageService _storage;

  AuthNotifier(this._authService, this._userService, this._storage)
    : super(AuthState()) {
    restoreSession();
  }

  /// Called on app start
  Future<void> restoreSession() async {
    final token = await _storage.getToken();
    if (token == null) return;

    state = state.copyWith(isLoading: true);

    final user = await _userService.getProfile(token);

    state = AuthState(user: user);
  }

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true);

      final token = await _authService.login(email, password);
      log("JWT TOKEN-----${token}");
      await _storage.saveToken(token);

      final user = await _userService.getProfile(token);

      state = AuthState(user: user);
    } catch (e) {
      log("error in login--${e}");
    }
  }

  Future<void> register(
    String gender,
    String firstName,
    String lastName,
    String email,
    String companyName,
    bool newsLetter,
    String password,
  ) async {
    try {
      state = state.copyWith(isLoading: true);

      final token = await _authService.register(
        gender,
        firstName,
        lastName,
        email,
        companyName,
        newsLetter,
        password,
      );
      log("JWT TOKEN-----${token}");
      await _storage.saveToken(token);

      final user = await _userService.getProfile(token);

      state = AuthState(user: user);
    } catch (e) {
      log("error in login--${e}");
    }
  }

  Future<void> logout() async {
    await _storage.clearToken();
    state = AuthState();
  }
}
