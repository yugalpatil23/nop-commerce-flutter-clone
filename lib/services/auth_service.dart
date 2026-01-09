class AuthService {
  Future<String> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    // API returns ONLY token
    return 'secure_jwt_token_123';
  }
}
