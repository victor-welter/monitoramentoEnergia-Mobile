class MonitoramentoModel {
  /// Dados recebidos da web
  MonitoramentoModel.fromMap(Map<String, dynamic> data) {
    _codigoOrigem = data['codigoOrigem'];
    _dataMonitoramento = data['data'];
    _horarioMonitoramento = data['horario'];
    _voltagem = data['voltagem'];
    _amperagem = data['amperagem'];
    _resistencia = data['resistencia'];
    _custoMonitoramento = data['custo'];
  }

  /// Recuperar os dados locais
  MonitoramentoModel.fromDatabase(Map<String, dynamic> data) {
    _idMonitoramentoPk = data['PK_MONITORAMENTO'];
    _codigoOrigem = data['CODIGO_ORIGEM'];
    _dataMonitoramento = data['DATA_MONITORAMENTO'];
    _horarioMonitoramento = data['HORARIO_MONITORAMENTO'];
    _voltagem = double.tryParse(data['VOLTAGEM'])!;
    _amperagem = double.tryParse(data['AMPERAGEM'])!;
    _resistencia = double.tryParse(data['RESISTENCIA'])!;
    _custoMonitoramento = double.tryParse(data['CUSTO_MONITORAMENTO'])!;
  }

  late int _idMonitoramentoPk;
  late int _codigoOrigem;
  late String _dataMonitoramento;
  late String _horarioMonitoramento;
  late double _voltagem;
  late double _amperagem;
  late double _resistencia;
  late double _custoMonitoramento;

  void setIdMonitoramentoPk(int idMonitoramentoPk) {
    _idMonitoramentoPk = _idMonitoramentoPk;
  }

  int get idMonitoramentoPk => _idMonitoramentoPk;

  void setCodigoOrigem(int codigoOrigem) {
    _codigoOrigem = codigoOrigem;
  }

  int get codigoOrigem => _codigoOrigem;

  void setDataMonitoramento(String dataMonitoramento) {
    _dataMonitoramento = dataMonitoramento;
  }

  String get dataMonitoramento => _dataMonitoramento;

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
