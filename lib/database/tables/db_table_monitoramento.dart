class DBTableMonitoramento {
  static const tableName = 'monitoramento';

  ///[INTEGER] - PK
  static const pkMonitoramento = 'pk_monitoramento';

  ///[INTEGER]
  static const codigoOrigem = 'codigo_origem';

  ///[INTEGER]
  static const dataMonitoramento = 'data_monitoramento';

  ///[TEXT]
  static const horarioMonitoramento = 'horario_monitoramento';

  ///[TEXT]
  static const voltagem = 'voltagem';

  ///[TEXT]
  static const amperagem = 'amperagem';

  ///[TEXT]
  static const resistencia = 'resistencia';

  ///[TEXT]
  static const custoMonitoramento = 'custo_monitoramento';
}
