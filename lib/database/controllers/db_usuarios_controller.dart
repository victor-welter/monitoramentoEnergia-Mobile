import 'package:sqflite/sqflite.dart';

import '../../models/sessao/sessao_model.dart';
import '../helpers/db_helper.dart';
import '../tables/db_table_configuracoes.dart';
import '../tables/db_table_usuarios.dart';

class DBUsuariosController {
  static Future<int> insertUsuario(SessaoModel sessao) async {
    Map<String, dynamic>? oldUser = await _selectByUsuario(sessao.usuario!);

    if (oldUser != null) {
      //Usuário já existia, apenas atualiza as informações
      sessao.setPKUsuario(oldUser['PK_USUARIO']);

      await updateUsuario(sessao);

      return sessao.pkUsuario!;
    } else {
      //Usuário novo
      return await _insertUsuario(sessao);
    }
  }

  ///Insere um usuário e cria as suas configurações
  static Future<int> _insertUsuario(SessaoModel sessao) async {
    return await DBHelper.executeTransaction((txn) async {
      int pkUsuario = await DBHelper.insert(
        sql: 'INSERT INTO ${DBTableUsuarios.tableName} ('
            '${DBTableUsuarios.usuario}, '
            '${DBTableUsuarios.dataLogin} '
            ') VALUES (?, ?)',
        arguments: [
          sessao.usuario!.toUpperCase(),
          DateTime.now().millisecondsSinceEpoch,
        ],
        transaction: txn,
      );

      await DBHelper.insert(
        sql: 'INSERT INTO ${DBTableConfiguracoes.tableName} ('
            '${DBTableConfiguracoes.pkUsuario} '
            ') VALUES (?) ',
        arguments: [pkUsuario],
        transaction: txn,
      );

      return pkUsuario;
    });
  }

  ///Atualiza as informações de um usuário
  static Future<void> updateUsuario(
    SessaoModel sessao, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
      sql: 'UPDATE ${DBTableUsuarios.tableName} SET '
          '${DBTableUsuarios.dataLogin} = ? '
          'WHERE ${DBTableUsuarios.pkUsuario} = ? ',
      arguments: [
        DateTime.now().millisecondsSinceEpoch,
        sessao.pkUsuario,
      ],
      transaction: transaction,
    );
  }

  ///Seleciona o último usuário a fazer login, casa exista
  static Future<Map<String, dynamic>?> lastLogin() async {
    List<Map<String, dynamic>> response = await DBHelper.select(
      sql: 'SELECT '
          '${DBTableUsuarios.usuario} AS \'USUARIO\' '
          'FROM ${DBTableUsuarios.tableName} '
          'ORDER BY ${DBTableUsuarios.dataLogin} DESC '
          'LIMIT 1',
    );

    if (response.isEmpty) {
      return null;
    }

    return await _selectByUsuario(response.first['USUARIO']);
  }

  ///Busca todas as informações de um usuário
  static Future<Map<String, dynamic>?> _selectByUsuario(String usuario) async {
    List<Map<String, dynamic>> response = await DBHelper.select(
      sql: 'SELECT '
          'usu.${DBTableUsuarios.pkUsuario} AS \'PK_USUARIO\', '
          'usu.${DBTableUsuarios.dataLogin} AS \'DATA_LOGIN\', '
          'usu.${DBTableUsuarios.usuario} AS \'USUARIO\', '
          'conf.${DBTableConfiguracoes.biometria} AS \'BIOMETRIA\', '
          'conf.${DBTableConfiguracoes.synkedData} AS \'SYNKED_DATA\', '
          'conf.${DBTableConfiguracoes.textFactor} AS \'TEXT_FACTOR\', '
          'conf.${DBTableConfiguracoes.downloadSeparado} AS \'DOWNLOAD_SEPARADO\', '
          'conf.${DBTableConfiguracoes.aceitouPermissoes} AS \'ACEITOU_PERMISSOES\', '
          'conf.${DBTableConfiguracoes.brasao} AS \'BRASAO\' '
          'FROM ${DBTableUsuarios.tableName} usu '
          'LEFT OUTER JOIN ${DBTableConfiguracoes.tableName} conf ON (usu.${DBTableUsuarios.pkUsuario} = conf.${DBTableConfiguracoes.pkUsuario}) '
          'WHERE usu.${DBTableUsuarios.usuario} = ? ',
      arguments: [usuario.toUpperCase()],
    );

    if (response.isEmpty) {
      return null;
    }

    return response.first;
  }

  ///Atualiza as configurações de um usuário
  static Future<void> updateConfiguracoes(
    SessaoModel sessao, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
      sql: 'UPDATE ${DBTableConfiguracoes.tableName} SET '
          '${DBTableConfiguracoes.biometria} = ?, '
          '${DBTableConfiguracoes.synkedData} = ?, '
          '${DBTableConfiguracoes.textFactor} = ?, '
          '${DBTableConfiguracoes.downloadSeparado} = ?, '
          '${DBTableConfiguracoes.aceitouPermissoes} = ?, '
          '${DBTableConfiguracoes.brasao} = ? '
          'WHERE ${DBTableConfiguracoes.pkUsuario} = ?',
      arguments: [
        sessao.configuracoes!.biometria,
        sessao.configuracoes!.synkedData,
        sessao.configuracoes!.textFactor,
        sessao.configuracoes!.downloadSeparado,
        sessao.configuracoes!.aceitouPermissoes,
        sessao.configuracoes!.brasao,
        sessao.pkUsuario,
      ],
      transaction: transaction,
    );
  }
}
