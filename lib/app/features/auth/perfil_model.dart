class PerfilModel {
  late int idPerfil;
  late String perfil;

  PerfilModel({required this.idPerfil, required this.perfil});

  PerfilModel.fromJson(Map<String, dynamic> json) {
    idPerfil = json['id_perfil'];
    perfil = json['perfil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_perfil'] = idPerfil;
    data['perfil'] = perfil;
    return data;
  }
}
