import 'tables/db_table_configuracoes.dart';
import 'tables/db_table_usuarios.dart';

class DBCreateTables {
  static const usuarios = 'CREATE TABLE ${DBTableUsuarios.tableName} ('
      '${DBTableUsuarios.pkUsuario} INTEGER PRIMARY KEY, '
      '${DBTableUsuarios.codigoUsuario} INTEGER NOT NULL UNIQUE, '
      '${DBTableUsuarios.usuario} TEXT NOT NULL UNIQUE, '
      '${DBTableUsuarios.dataLogin} INTEGER NOT NULL, '
      '${DBTableUsuarios.nome} TEXT NULL, '
      '${DBTableUsuarios.email} TEXT NULL '
      ');';

  static const configuracoes =
      'CREATE TABLE ${DBTableConfiguracoes.tableName} ('
      '${DBTableConfiguracoes.pkConfiguracao} INTEGER PRIMARY KEY, '
      '${DBTableConfiguracoes.biometria} INTEGER NOT NULL DEFAULT 0, '
      '${DBTableConfiguracoes.synkedData} INTEGER NOT NULL DEFAULT 0, '
      '${DBTableConfiguracoes.textFactor} REAL NOT NULL DEFAULT 1, '
      '${DBTableConfiguracoes.downloadSeparado} INTEGER NOT NULL DEFAULT 0, '
      '${DBTableConfiguracoes.aceitouPermissoes} INTEGER NOT NULL DEFAULT 0, '
      '${DBTableConfiguracoes.brasao} TEXT NULL, '
      '${DBTableConfiguracoes.pkUsuario} INTEGER NOT NULL REFERENCES ${DBTableUsuarios.tableName} (${DBTableUsuarios.pkUsuario}) '
      ');';
}
