import 'configuracoes_model.dart';

class SessaoModel {
  SessaoModel();

  SessaoModel.fromDatabase(Map<String, dynamic> data) {
    _pkUsuario = data['PK_USUARIO'];
    _usuario = data['USUARIO'];
    _codigoUsuario = data['CODIGO_USUARIO'];
    _email = data['EMAIL'];
    _nome = data['NOME'];
    _configuracoes = ConfiguracoesModel.fromDatabase(data);
  }

  int? _pkUsuario;
  String? _usuario;
  String? _senha;
  late String _tokenJWT;
  late int _codigoUsuario;
  String? _email;
  String? _nome;
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

  void setCodigoUsuario(int codigo) {
    _codigoUsuario = codigo;
  }

  int get codigoUsuario => _codigoUsuario;

  void setEmail(String? email) {
    _email = email;
  }

  String? get email => _email;

  void setNome(String? nome) {
    _nome = nome;
  }

  String? get nome => _nome;

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
      ..setCodigoUsuario(newSession.codigoUsuario)
      ..setEmail(newSession.email)
      ..setNome(newSession.nome)
      ..setPKUsuario(newSession.pkUsuario)
      ..setTokenJWT(newSession.tokenJWT)
      ..setUsuario(newSession.usuario)
      ..setConfiguracoes(newSession.configuracoes);
  }
}
