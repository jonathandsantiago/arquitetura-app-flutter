import 'package:seedapp/app/features/auth/modulo_model.dart';
import 'package:seedapp/app/features/auth/usuario_model.dart';
import 'package:flutter/material.dart';

import 'perfil_model.dart';

class AuthRepository {
  Future<UsuarioModel> loginAsync(String username, String password) async {
    try {
      if (!['gerente', 'v', 'g', 'vendedor']
          .any((e) => e.toLowerCase() == username.toLowerCase())) {
        throw 'Usuário invalído';
      }
      var isGerente = ['gerente', 'g']
          .any((e) => e.toLowerCase() == username.toLowerCase());
      return UsuarioModel(
          idUsuario: 1,
          cpfCnpj: '000.191.000-00',
          email: '${username.toLowerCase()}@seedapp.com',
          nome: isGerente ? "Gerente" : "Vendedor",
          modulo: ModuloModel(),
          perfil: isGerente
              ? PerfilModel(idPerfil: 1, perfil: 'Gerente')
              : PerfilModel(idPerfil: 2, perfil: 'Vendedor'),
          isAuthenticate: true);
    } catch (e) {
      debugPrint("Exception (AuthRepository.loginAsync): Error: $e");
      rethrow;
    }
  }

  Future<void> logoutAsync() async {
    try {} catch (e) {
      debugPrint("Exception (AuthRepository.signOutAsync): Error: $e");
    }
  }
}
