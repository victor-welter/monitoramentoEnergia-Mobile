import 'package:mobx/mobx.dart';

part 'filtros_monitoramento.g.dart';

class FiltrosMonitoramento = _FiltrosMonitoramento with _$FiltrosMonitoramento;

abstract class _FiltrosMonitoramento with Store {
  @observable
  DateTime? _data = DateTime.now();

  @observable
  String? _codigoOrigem;

  @computed
  DateTime? get data => _data;

  @computed
  String? get codigoOrigem => _codigoOrigem;

  @action
  void setData(DateTime? data) {
    _data = data;
  }

  @action
  void setCodigoOrigem(String? codigoOrigem) {
    _codigoOrigem = codigoOrigem;
  }

  @action
  void resetFiltros() {
    _data = DateTime.now();
    _codigoOrigem = null;
  }
}
