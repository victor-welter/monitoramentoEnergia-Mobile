import 'configuracoes_model.dart';

class SessaoModel {
  SessaoModel();

  SessaoModel.fromDatabase(Map<String, dynamic> data) {
    _pkUsuario = data['PK_USUARIO'];
    _usuario = data['USUARIO'];
    _configuracoes = ConfiguracoesModel.fromDatabase(data);
  }

  int? _pkUsuario;
  String? _usuario;
  String? _senha;
  late String _tokenJWT;
  ConfiguracoesModel? _configuracoes = ConfiguracoesModel();

  void setPKUsuario(int? pk) {
    _pkUsuario = pk;
  }

  int? get pkUsuario => _pkUsuario;

  void setUsuario(String? usuario) {
    _usuario = usuario;
  }

  String? get usuario => _usuario;

  void setSenha(String? senha) {
    _senha = senha;
  }

  String? get senha => _senha;

  void setTokenJWT(String token) {
    _tokenJWT = token;
  }

  String get tokenJWT => _tokenJWT;

  void setConfiguracoes(ConfiguracoesModel? configuracoes) {
    _configuracoes = configuracoes;
  }

  ConfiguracoesModel? get configuracoes => _configuracoes;

  ///Copia as informações de uma SessaoModel nova, para uma já existente (por referência)
  static void copyWith({
    required SessaoModel oldSession,
    required SessaoModel newSession,
  }) {
    oldSession
      ..setPKUsuario(newSession.pkUsuario)
      ..setTokenJWT(newSession.tokenJWT)
      ..setUsuario(newSession.usuario)
      ..setConfiguracoes(newSession.configuracoes);
  }
}
