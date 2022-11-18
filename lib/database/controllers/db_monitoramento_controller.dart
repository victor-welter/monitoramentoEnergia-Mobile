import 'package:sqflite/sqflite.dart';

import '../../constants/constants.dart';
import '../../models/monitoramento/monitoramento_model.dart';
import '../../services/service_locator.dart';
import '../../stores/filtros/filtros_store.dart';
import '../helpers/db_helper.dart';
import '../helpers/db_sanitizer.dart';
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
        monitoramento.dataMonitoramento.millisecondsSinceEpoch,
        monitoramento.horarioMonitoramento,
        monitoramento.voltagem,
        monitoramento.amperagem,
        monitoramento.resistencia,
        monitoramento.custoMonitoramento,
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
  }) async {
    String whereFilters = '1 = 1 ';

    final filtros = getIt<FiltrosStore>().monitoramento;

    //Apenas data inicial foi informada
    if (filtros.dataInicial != null && filtros.dataFinal == null) {
      whereFilters += 'AND ${DBTableMonitoramento.dataMonitoramento} > ${sanitizeSQL(filtros.dataInicial!.millisecondsSinceEpoch)} ';
    }

    //Apenas data Final foi informada
    if (filtros.dataFinal != null && filtros.dataInicial == null) {
      whereFilters += 'AND ${DBTableMonitoramento.dataMonitoramento} < ${sanitizeSQL(filtros.dataFinal!.millisecondsSinceEpoch)} ';
    }

    //As duas datas foram informadas
    if (filtros.dataInicial != null && filtros.dataFinal != null) {
      whereFilters += 'AND ${DBTableMonitoramento.dataMonitoramento} BETWEEN ${sanitizeSQL(filtros.dataInicial!.millisecondsSinceEpoch)} AND ${sanitizeSQL(filtros.dataFinal!.millisecondsSinceEpoch)} ';
    }

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
          'LIMIT ${SearchOffset.MONITORAMENTOS} '
          'OFFSET $offset ',
    );
  }
}
