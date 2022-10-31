// ignore_for_file: prefer_final_fields

import '../../models/filtros/filtros_monitoramento.dart';

class FiltrosStore {
  FiltrosMonitoramento _monitoramento = FiltrosMonitoramento();

  FiltrosMonitoramento get monitoramento => _monitoramento;
}
