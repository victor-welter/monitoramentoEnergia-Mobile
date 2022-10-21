class DBTableConfiguracoes {
  static const tableName = 'configuracoes';

  ///[INTEGER] - PK
  static const pkConfiguracao = 'pk_configuracao';

  ///[INTEGER]
  static const biometria = 'biometria';

  ///[INTEGER]
  static const synkedData = 'synked_data';

  ///[REAL]
  static const textFactor = 'text_factor';

  ///[INTEGER]
  static const downloadSeparado = 'download_separado';

  ///[INTEGER]
  static const aceitouPermissoes = 'aceitou_permissoes';

  ///[TEXT]
  static const brasao = 'brasao';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';
}
