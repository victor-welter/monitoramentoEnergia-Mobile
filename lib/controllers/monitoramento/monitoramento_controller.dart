import 'package:sqflite/sqflite.dart';

import '../../constants/constants.dart';
import '../../database/controllers/db_monitoramento_controller.dart';
import '../../database/helpers/db_helper.dart';
import '../../models/monitoramento/monitoramento_model.dart';
import '../../repositories/monitoramento/monitoramento_repository.dart';

class MonitoramentoController {
  static Future<void> downloadData() async {
    List<dynamic> response = await MonitoramentoRepository.downloadData();

    await _saveData(response);
  }

  static Future<void> _saveData(List<dynamic> data) async {
    DBMonitoramentoController.deleteAll();

    Batch batch = await DBHelper.getBatch();

    for (Map<String, dynamic> mon in data) {
      MonitoramentoModel monitoramento = MonitoramentoModel.fromMap(mon);

      DBMonitoramentoController.insert(
        monitoramento: monitoramento,
        batch: batch,
      );
    }

    await batch.commit(noResult: true);
  }

  static Future<List<MonitoramentoModel>> searchMonitoramentos({
    required int page,
    bool ignoreFilters = false,
  }) async {
    int offset = page * SearchOffset.MONITORAMENTOS;

    List<Map<String, dynamic>> response =
        await DBMonitoramentoController.searchMonitoramento(
      offset: offset,
      ignoreFilters: ignoreFilters,
    );

    return _resolveSearch(response);
  }

  static List<MonitoramentoModel> _resolveSearch(List<dynamic> data) {
    List<MonitoramentoModel> monitoramentos = [];

    for (Map<String, dynamic> mon in data) {
      monitoramentos.add(MonitoramentoModel.fromDatabase(mon));
    }

    return monitoramentos;
  }
}
