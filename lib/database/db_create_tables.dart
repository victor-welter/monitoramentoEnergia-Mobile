import 'tables/db_table_configuracoes.dart';
import 'tables/db_table_monitoramento.dart';
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

  static const monitoramento =
      'CREATE TABLE ${DBTableMonitoramento.tableName} ('
      '${DBTableMonitoramento.pkMonitoramento} INTEGER PRIMARY KEY, '
      '${DBTableMonitoramento.codigoOrigem} INTEGER NOT NULL, '
      '${DBTableMonitoramento.dataMonitoramento} TEXT NOT NULL, '
      '${DBTableMonitoramento.horarioMonitoramento} TEXT NOT NULL, '
      '${DBTableMonitoramento.voltagem} TEXT NOT NULL, '
      '${DBTableMonitoramento.amperagem} TEXT NOT NULL, '
      '${DBTableMonitoramento.resistencia} TEXT NOT NULL, '
      '${DBTableMonitoramento.custoMonitoramento} TEXT NOT NULL '
      ');';
}
