import 'package:mobx/mobx.dart';

part 'filtros_monitoramento.g.dart';

class FiltrosMonitoramento = _FiltrosMonitoramento with _$FiltrosMonitoramento;

abstract class _FiltrosMonitoramento with Store {
  @observable
  DateTime? _dataInicial;

  @observable
  DateTime? _dataFinal;

  @observable
  String? _codigoOrigem;

  @computed
  DateTime? get dataInicial => _dataInicial;

  @computed
  DateTime? get dataFinal => _dataFinal;

  @computed
  String? get codigoOrigem => _codigoOrigem;

  @action
  void setDataInicial(DateTime? dataInicial) {
    _dataInicial = dataInicial;
  }

  @action
  void setDataFinal(DateTime? dataFinal) {
    _dataFinal = dataFinal;
  }

  @action
  void setCodigoOrigem(String? codigoOrigem) {
    _codigoOrigem = codigoOrigem;
  }

  @action
  void resetFiltros() {
    _dataInicial = null;
    _dataFinal = null;
    _codigoOrigem = null;
  }
}
