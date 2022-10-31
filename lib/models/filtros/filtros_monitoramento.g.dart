// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtros_monitoramento.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltrosMonitoramento on _FiltrosMonitoramento, Store {
  Computed<DateTime?>? _$dataComputed;

  @override
  DateTime? get data =>
      (_$dataComputed ??= Computed<DateTime?>(() => super.data,
              name: '_FiltrosMonitoramento.data'))
          .value;
  Computed<String?>? _$codigoOrigemComputed;

  @override
  String? get codigoOrigem =>
      (_$codigoOrigemComputed ??= Computed<String?>(() => super.codigoOrigem,
              name: '_FiltrosMonitoramento.codigoOrigem'))
          .value;

  late final _$_dataAtom =
      Atom(name: '_FiltrosMonitoramento._data', context: context);

  @override
  DateTime? get _data {
    _$_dataAtom.reportRead();
    return super._data;
  }

  @override
  set _data(DateTime? value) {
    _$_dataAtom.reportWrite(value, super._data, () {
      super._data = value;
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
  void setData(DateTime? data) {
    final _$actionInfo = _$_FiltrosMonitoramentoActionController.startAction(
        name: '_FiltrosMonitoramento.setData');
    try {
      return super.setData(data);
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
data: ${data},
codigoOrigem: ${codigoOrigem}
    ''';
  }
}
