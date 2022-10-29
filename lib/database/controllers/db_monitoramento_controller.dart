import 'package:sqflite/sqflite.dart';

import '../../constants/constants.dart';
import '../../models/monitoramento/monitoramento_model.dart';
import '../helpers/db_helper.dart';
import '../tables/db_table_monitoramento.dart';

class DBMonitoramentoController {
  static Future<int> insert({
    required MonitoramentoModel monitoramento,
    Transaction? transaction,
    Batch? batch,
  }) async {
    return await DBHelper.insert(
      sql: 'INSERT INTO ${DBTableMonitoramento.tableName} ('
          '${DBTableMonitoramento.codigoOrigem}, '
          '${DBTableMonitoramento.dataMonitoramento}, '
          '${DBTableMonitoramento.horarioMonitoramento}, '
          '${DBTableMonitoramento.voltagem}, '
          '${DBTableMonitoramento.amperagem}, '
          '${DBTableMonitoramento.resistencia}, '
          '${DBTableMonitoramento.custoMonitoramento} '
          ') VALUES (?, ?, ?, ?, ?, ?, ?)',
      arguments: [
        monitoramento.codigoOrigem,
        monitoramento.dataMonitoramento,
        monitoramento.horarioMonitoramento,
        monitoramento.voltagem,
        monitoramento.amperagem,
        monitoramento.resistencia,
        monitoramento.custoMonitoramento
      ],
      transaction: transaction,
      batch: batch,
    );
  }

  static Future<int> deleteAll() async {
    return await DBHelper.delete(
      sql: 'DELETE FROM ${DBTableMonitoramento.tableName} ',
    );
  }

  static Future<List<Map<String, dynamic>>> searchMonitoramento({
    required int offset,
    required bool ignoreFilters,
  }) async {
    String whereFilters = '1 = 1 ';

    String limit = 'LIMIT ${SearchOffset.MONITORAMENTOS} '
        'OFFSET $offset ';

    return await DBHelper.select(
      sql: 'SELECT '
          '${DBTableMonitoramento.pkMonitoramento} AS \'PK_MONITORAMENTO\', '
          '${DBTableMonitoramento.codigoOrigem} AS \'CODIGO_ORIGEM\', '
          '${DBTableMonitoramento.dataMonitoramento} AS \'DATA_MONITORAMENTO\', '
          '${DBTableMonitoramento.horarioMonitoramento} AS \'HORARIO_MONITORAMENTO\', '
          '${DBTableMonitoramento.voltagem} AS \'VOLTAGEM\', '
          '${DBTableMonitoramento.amperagem} AS \'AMPERAGEM\', '
          '${DBTableMonitoramento.resistencia} AS \'RESISTENCIA\', '
          '${DBTableMonitoramento.custoMonitoramento} AS \'CUSTO_MONITORAMENTO\' '
          'FROM ${DBTableMonitoramento.tableName} '
          'WHERE $whereFilters '
          'ORDER BY ${DBTableMonitoramento.dataMonitoramento} ASC '
          '$limit ',
    );
  }
}
