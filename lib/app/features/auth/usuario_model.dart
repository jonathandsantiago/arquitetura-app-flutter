import 'package:seedapp/app/features/auth/perfil_model.dart';

import 'modulo_model.dart';

class UsuarioModel {
  late int idUsuario;
  late String cpfCnpj;
  late String email;
  late String nome;
  late bool isAuthenticate;
  late ModuloModel modulo;
  late PerfilModel perfil;

  UsuarioModel(
      {required this.idUsuario,
      required this.cpfCnpj,
      required this.email,
      required this.nome,
      required this.modulo,
      required this.perfil,
      required this.isAuthenticate});

  UsuarioModel.fromJson(Map<String, dynamic> json, this.isAuthenticate) {
    idUsuario = json['id_usuario'];
    cpfCnpj = json['cpf_cnpj'];
    email = json['email'];
    nome = json['nome'];
    modulo =
        (json['modulo'] != null ? ModuloModel.fromJson(json['modulo']) : null)!;
    perfil =
        (json['perfil'] != null ? PerfilModel.fromJson(json['perfil']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_usuario'] = idUsuario;
    data['cpf_cnpj'] = cpfCnpj;
    data['email'] = email;
    data['nome'] = nome;
    data['modulo'] = modulo.toJson();
    data['perfil'] = perfil.toJson();
    return data;
  }

  UsuarioModel.empty(this.isAuthenticate);
}
