import 'package:sqflite/sqflite.dart';

import '../../constants/constants.dart';
import '../../database/helpers/db_helper.dart';
import '../../models/monitoramento/monitoramento_model.dart';
import '../../repositories/monitoramento/monitoramento_repository.dart';
import '../../utils/request_utils.dart';

class MonitoramentoController {
  static Future<void> downloadData() async {
    Map<String, dynamic> response =
        await MonitoramentoRepository.downloadData();

    validaResponse(
      response,
      'Erro ao baixar informações sobre os Monitoramentos de Energia',
      ErrorType.sync,
    );

    await _saveData(response['data']);
  }

  static Future<void> _saveData(List<dynamic> data) async {
    // TODO deletar monitoramentos

    Batch batch = await DBHelper.getBatch();

    for (Map<String, dynamic> mon in data) {
      MonitoramentoModel monitoramento = MonitoramentoModel.fromMap(mon);
      // TODO salvar monitoramento
    }

    await batch.commit(noResult: true);
  }

  static Future<List<MonitoramentoModel>> searchMonitoramentos({
    required int page,
    bool ignoreFilters = false,
  }) async {
    int offset = page * SearchOffset.MONITORAMENTOS;

    //TODO Buscar todos os monitoramentos
    List<Map<String, dynamic>> response = [];

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
