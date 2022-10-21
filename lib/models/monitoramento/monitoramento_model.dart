class MonitoramentoModel {
  /// Dados recebidos da web
  MonitoramentoModel.fromMap(Map<String, dynamic> data) {
    _codigoMonitoramento = data[''];
    _codigoOrigem = data[''];
    _dataMonitoramento = data[''];
    _horarioMonitoramento = data[''];
    _voltagem = data[''];
    _amperagem = data[''];
    _resistencia = data[''];
    _custoMonitoramento = data[''];
  }

  /// Recuperar os dados locais
  MonitoramentoModel.fromDatabase(Map<String, dynamic> data) {
    _idMonitoramentoPk = data[''];
    _codigoMonitoramento = data[''];
    _codigoOrigem = data[''];
    _dataMonitoramento = data[''];
    _horarioMonitoramento = data[''];
    _voltagem = data[''];
    _amperagem = data[''];
    _resistencia = data[''];
    _custoMonitoramento = data[''];
  }

  late int _idMonitoramentoPk;
  late int _codigoMonitoramento;
  late int _codigoOrigem;
  late DateTime _dataMonitoramento;
  late String _horarioMonitoramento;
  late double _voltagem;
  late double _amperagem;
  late double _resistencia;
  late double _custoMonitoramento;

  void setIdMonitoramentoPk(int idMonitoramentoPk) {
    _idMonitoramentoPk = _idMonitoramentoPk;
  }

  int get idMonitoramentoPk => _idMonitoramentoPk;

  void setCodigoMonitoramento(int codigoMonitoramento) {
    _codigoMonitoramento = codigoMonitoramento;
  }

  int get codigoMonitoramento => _codigoMonitoramento;

  void setCodigoOrigem(int codigoOrigem) {
    _codigoOrigem = codigoOrigem;
  }

  int get codigoOrigem => _codigoOrigem;

  void setDataMonitoramento(DateTime dataMonitoramento) {
    _dataMonitoramento = dataMonitoramento;
  }

  DateTime get dataMonitoramento => _dataMonitoramento;

  void setHorarioMonitoramento(String horarioMonitoramento) {
    _horarioMonitoramento = horarioMonitoramento;
  }

  String get horarioMonitoramento => _horarioMonitoramento;

  void setVoltagem(double voltagem) {
    _voltagem = voltagem;
  }

  double get voltagem => _voltagem;

  void setAmperagem(double amperagem) {
    _amperagem = amperagem;
  }

  double get amperagem => _amperagem;

  void setResistencia(double resistencia) {
    _resistencia = resistencia;
  }

  double get resistencia => _resistencia;

  void setCustoMonitoramento(double custoMonitoramento) {
    _custoMonitoramento = custoMonitoramento;
  }

  double get custoMonitoramento => _custoMonitoramento;
}
