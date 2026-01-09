import '../models/user_model.dart';

class UserService {
  Future<UserModel> getProfile(String token) async {
    await Future.delayed(const Duration(seconds: 1));

    return UserModel(id: '101', name: 'Yugal Patil', email: 'yugal@email.com');
  }
}
