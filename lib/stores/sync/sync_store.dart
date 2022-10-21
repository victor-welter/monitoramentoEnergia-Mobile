import 'package:mobx/mobx.dart';

part 'sync_store.g.dart';

class SyncStore = _SyncStore with _$SyncStore;

abstract class _SyncStore with Store {
  // Observable
  @observable
  double _valueProgress = 0;

  @observable
  String _messageError = '';

  @observable
  bool _hasError = false;

  @observable
  String _currentAction = 'Baixando dados';

  @observable
  String _messageSync = '';

  @observable
  int _progressDownload = 0;

  @observable
  int _totalProgressDownload = 1;

  // Computed
  @computed
  double get valueProgress => _valueProgress;

  @computed
  String get messageError => _messageError;

  @computed
  bool get hasError => _hasError;

  @computed
  String get currentAction => _currentAction;

  @computed
  String get messageSync => _messageSync;

  @computed
  int get progressDownload => _progressDownload;

  @computed
  int get totalProgressDownload => _totalProgressDownload;

  // Action
  @action
  void incrementProgress({required double value}) {
    somaProgressDownload();
    for (int i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: i * 10), () {
        _valueProgress += value;
      });
    }
  }

  @action
  void setMessageError(String message) {
    _messageError = message;
  }

  @action
  void setHasError({required bool value}) {
    _hasError = value;
  }

  @action
  void setCurrentAction(String action) {
    _currentAction = action;
  }

  @action
  void setMessageSync(String message) {
    _messageSync = message;
  }

  @action
  void setProgressDownload(int progressDownload) {
    _progressDownload = progressDownload;
  }

  @action
  void somaProgressDownload() {
    _progressDownload++;
  }

  @action
  void setTotalDownload(int totalDownload) {
    _totalProgressDownload = totalDownload;
  }

  @action
  void resetState() {
    _currentAction = 'Baixando dados';
    _valueProgress = 0;
    _hasError = false;
    _messageError = '';
    _messageSync = '';
    _progressDownload = 0;
    _totalProgressDownload = 1;
  }

  //Variáveis de controle para não baixar tudo novamente em caso de erros
  bool _monitoramentosSync = false;

  bool get monitoramentosSync => _monitoramentosSync;

  void monitoramentosSynked() {
    _monitoramentosSync = true;
  }

  void resetControlSync() {
    _monitoramentosSync = false;
  }
}
