// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenState on _HomeScreenState, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_HomeScreenState.loading'))
      .value;
  Computed<bool>? _$finishLoadingComputed;

  @override
  bool get finishLoading =>
      (_$finishLoadingComputed ??= Computed<bool>(() => super.finishLoading,
              name: '_HomeScreenState.finishLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_HomeScreenState.hasError'))
          .value;
  Computed<bool>? _$usedFilterComputed;

  @override
  bool get usedFilter =>
      (_$usedFilterComputed ??= Computed<bool>(() => super.usedFilter,
              name: '_HomeScreenState.usedFilter'))
          .value;
  Computed<String>? _$precoTotalComputed;

  @override
  String get precoTotal =>
      (_$precoTotalComputed ??= Computed<String>(() => super.precoTotal,
              name: '_HomeScreenState.precoTotal'))
          .value;
  Computed<ObservableList<MonitoramentoModel>>? _$monitoramentosComputed;

  @override
  ObservableList<MonitoramentoModel> get monitoramentos =>
      (_$monitoramentosComputed ??=
              Computed<ObservableList<MonitoramentoModel>>(
                  () => super.monitoramentos,
                  name: '_HomeScreenState.monitoramentos'))
          .value;

  late final _$_loadingAtom =
      Atom(name: '_HomeScreenState._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: '_HomeScreenState._hasError', context: context);

  @override
  bool get _hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  late final _$_usedFilterAtom =
      Atom(name: '_HomeScreenState._usedFilter', context: context);

  @override
  bool get _usedFilter {
    _$_usedFilterAtom.reportRead();
    return super._usedFilter;
  }

  @override
  set _usedFilter(bool value) {
    _$_usedFilterAtom.reportWrite(value, super._usedFilter, () {
      super._usedFilter = value;
    });
  }

  late final _$_precoTotalAtom =
      Atom(name: '_HomeScreenState._precoTotal', context: context);

  @override
  String get _precoTotal {
    _$_precoTotalAtom.reportRead();
    return super._precoTotal;
  }

  @override
  set _precoTotal(String value) {
    _$_precoTotalAtom.reportWrite(value, super._precoTotal, () {
      super._precoTotal = value;
    });
  }

  late final _$_monitoramentosAtom =
      Atom(name: '_HomeScreenState._monitoramentos', context: context);

  @override
  ObservableList<MonitoramentoModel> get _monitoramentos {
    _$_monitoramentosAtom.reportRead();
    return super._monitoramentos;
  }

  @override
  set _monitoramentos(ObservableList<MonitoramentoModel> value) {
    _$_monitoramentosAtom.reportWrite(value, super._monitoramentos, () {
      super._monitoramentos = value;
    });
  }

  late final _$_HomeScreenStateActionController =
      ActionController(name: '_HomeScreenState', context: context);

  @override
  void incPage() {
    final _$actionInfo = _$_HomeScreenStateActionController.startAction(
        name: '_HomeScreenState.incPage');
    try {
      return super.incPage();
    } finally {
      _$_HomeScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading({required bool value}) {
    final _$actionInfo = _$_HomeScreenStateActionController.startAction(
        name: '_HomeScreenState.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_HomeScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFinishLoading({required bool value}) {
    final _$actionInfo = _$_HomeScreenStateActionController.startAction(
        name: '_HomeScreenState.setFinishLoading');
    try {
      return super.setFinishLoading(value: value);
    } finally {
      _$_HomeScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_HomeScreenStateActionController.startAction(
        name: '_HomeScreenState.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_HomeScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isUsedFilter() {
    final _$actionInfo = _$_HomeScreenStateActionController.startAction(
        name: '_HomeScreenState.isUsedFilter');
    try {
      return super.isUsedFilter();
    } finally {
      _$_HomeScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrecoTotal({required String value}) {
    final _$actionInfo = _$_HomeScreenStateActionController.startAction(
        name: '_HomeScreenState.setPrecoTotal');
    try {
      return super.setPrecoTotal(value: value);
    } finally {
      _$_HomeScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_HomeScreenStateActionController.startAction(
        name: '_HomeScreenState.resetState');
    try {
      return super.resetState();
    } finally {
      _$_HomeScreenStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
finishLoading: ${finishLoading},
hasError: ${hasError},
usedFilter: ${usedFilter},
precoTotal: ${precoTotal},
monitoramentos: ${monitoramentos}
    ''';
  }
}
