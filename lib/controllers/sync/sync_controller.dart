import '../../constants/constants.dart';
import '../../models/sessao/sessao_model.dart';
import '../../services/service_locator.dart';
import '../../stores/sync/sync_store.dart';

import '../monitoramento/monitoramento_controller.dart';
import '../usuario/usuarios_controller.dart';

class SyncController {
  static Future<void> syncService() async {
    final _stateView = getIt<SyncStore>();

    _stateView.resetState();

    double incValue = 0.025;

    _stateView.setTotalDownload(1);
    _stateView.setProgressDownload(0);

    if (!_stateView.monitoramentosSync) {
      _stateView.setMessageSync('Buscando monitoramentos');
      await MonitoramentoController.downloadData();
      _stateView.monitoramentosSynked();
    }
    _stateView.incrementProgress(value: incValue);

    //Deixar sempre por último
    //Indica que o usuário logado realizou a primeira sincronização
    await _synkedData();
  }

  static Future<void> _synkedData() async {
    final sessao = getIt<SessaoModel>();

    sessao.configuracoes!.setSynkedData(CadOptions.SIM);

    await UsuariosController.updateConfiguracoes();
  }
}
