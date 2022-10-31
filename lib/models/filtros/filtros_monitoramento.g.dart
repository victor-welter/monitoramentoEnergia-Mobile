// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtros_monitoramento.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltrosMonitoramento on _FiltrosMonitoramento, Store {
  Computed<DateTime?>? _$dataInicialComputed;

  @override
  DateTime? get dataInicial =>
      (_$dataInicialComputed ??= Computed<DateTime?>(() => super.dataInicial,
              name: '_FiltrosMonitoramento.dataInicial'))
          .value;
  Computed<DateTime?>? _$dataFinalComputed;

  @override
  DateTime? get dataFinal =>
      (_$dataFinalComputed ??= Computed<DateTime?>(() => super.dataFinal,
              name: '_FiltrosMonitoramento.dataFinal'))
          .value;
  Computed<String?>? _$codigoOrigemComputed;

  @override
  String? get codigoOrigem =>
      (_$codigoOrigemComputed ??= Computed<String?>(() => super.codigoOrigem,
              name: '_FiltrosMonitoramento.codigoOrigem'))
          .value;

  late final _$_dataInicialAtom =
      Atom(name: '_FiltrosMonitoramento._dataInicial', context: context);

  @override
  DateTime? get _dataInicial {
    _$_dataInicialAtom.reportRead();
    return super._dataInicial;
  }

  @override
  set _dataInicial(DateTime? value) {
    _$_dataInicialAtom.reportWrite(value, super._dataInicial, () {
      super._dataInicial = value;
    });
  }

  late final _$_dataFinalAtom =
      Atom(name: '_FiltrosMonitoramento._dataFinal', context: context);

  @override
  DateTime? get _dataFinal {
    _$_dataFinalAtom.reportRead();
    return super._dataFinal;
  }

  @override
  set _dataFinal(DateTime? value) {
    _$_dataFinalAtom.reportWrite(value, super._dataFinal, () {
      super._dataFinal = value;
    });
  }

  late final _$_codigoOrigemAtom =
      Atom(name: '_FiltrosMonitoramento._codigoOrigem', context: context);

  @override
  String? get _codigoOrigem {
    _$_codigoOrigemAtom.reportRead();
    return super._codigoOrigem;
  }

  @override
  set _codigoOrigem(String? value) {
    _$_codigoOrigemAtom.reportWrite(value, super._codigoOrigem, () {
      super._codigoOrigem = value;
    });
  }

  late final _$_FiltrosMonitoramentoActionController =
      ActionController(name: '_FiltrosMonitoramento', context: context);

  @override
  void setDataInicial(DateTime? dataInicial) {
    final _$actionInfo = _$_FiltrosMonitoramentoActionController.startAction(
        name: '_FiltrosMonitoramento.setDataInicial');
    try {
      return super.setDataInicial(dataInicial);
    } finally {
      _$_FiltrosMonitoramentoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataFinal(DateTime? dataFinal) {
    final _$actionInfo = _$_FiltrosMonitoramentoActionController.startAction(
        name: '_FiltrosMonitoramento.setDataFinal');
    try {
      return super.setDataFinal(dataFinal);
    } finally {
      _$_FiltrosMonitoramentoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCodigoOrigem(String? codigoOrigem) {
    final _$actionInfo = _$_FiltrosMonitoramentoActionController.startAction(
        name: '_FiltrosMonitoramento.setCodigoOrigem');
    try {
      return super.setCodigoOrigem(codigoOrigem);
    } finally {
      _$_FiltrosMonitoramentoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFiltros() {
    final _$actionInfo = _$_FiltrosMonitoramentoActionController.startAction(
        name: '_FiltrosMonitoramento.resetFiltros');
    try {
      return super.resetFiltros();
    } finally {
      _$_FiltrosMonitoramentoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataInicial: ${dataInicial},
dataFinal: ${dataFinal},
codigoOrigem: ${codigoOrigem}
    ''';
  }
}
