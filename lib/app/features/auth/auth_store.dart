import 'package:seedapp/app/core/providers/app_provider.dart';
import 'package:seedapp/app/features/auth/auth_repository.dart';
import 'package:seedapp/app/features/auth/usuario_model.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends Store<UsuarioModel> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  AuthStore() : super(UsuarioModel.empty(false));

  Future<void> loginAsync(String username, String password) async {
    await execute(
      () async => await _authRepository.loginAsync(username, password),
    );
  }

  Future<void> logoutAsync() async {
    await _authRepository.logoutAsync();
    update(UsuarioModel.empty(false));
  }
}
