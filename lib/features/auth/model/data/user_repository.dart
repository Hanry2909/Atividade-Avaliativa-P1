import 'user_model.dart';

class UserRepository {

  static final UserRepository _instance = UserRepository._internal();
  factory UserRepository() => _instance;
  UserRepository._internal();

  final List<UserModel> _users = [
    UserModel(name: "Admin", email: "admin@admin.com", password: "123")
  ];

  List<UserModel> get users => _users;

  void addUser(UserModel user) {
    _users.add(user);
  }

  UserModel? authenticate(String email, String password) {
    try {

      return _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}