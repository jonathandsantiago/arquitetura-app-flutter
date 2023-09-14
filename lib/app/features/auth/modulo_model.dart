class ModuloModel {
  int? idModulo;
  String? modulo;

  ModuloModel({this.idModulo, this.modulo});

  ModuloModel.fromJson(Map<String, dynamic> json) {
    idModulo = json['id_modulo'];
    modulo = json['modulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_modulo'] = idModulo;
    data['modulo'] = modulo;
    return data;
  }
}
