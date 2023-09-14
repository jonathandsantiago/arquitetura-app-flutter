class AuthModel {
  String? login;
  String? password;
  String? modulo;

  AuthModel(
      {required this.login, required this.password, required this.modulo});

  AuthModel.empty();
}
