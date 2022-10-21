// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfiguracoesModel on _ConfiguracoesModel, Store {
  Computed<int>? _$biometriaComputed;

  @override
  int get biometria =>
      (_$biometriaComputed ??= Computed<int>(() => super.biometria,
              name: '_ConfiguracoesModel.biometria'))
          .value;
  Computed<int>? _$synkedDataComputed;

  @override
  int get synkedData =>
      (_$synkedDataComputed ??= Computed<int>(() => super.synkedData,
              name: '_ConfiguracoesModel.synkedData'))
          .value;
  Computed<double>? _$textFactorComputed;

  @override
  double get textFactor =>
      (_$textFactorComputed ??= Computed<double>(() => super.textFactor,
              name: '_ConfiguracoesModel.textFactor'))
          .value;
  Computed<int>? _$downloadSeparadoComputed;

  @override
  int get downloadSeparado => (_$downloadSeparadoComputed ??= Computed<int>(
          () => super.downloadSeparado,
          name: '_ConfiguracoesModel.downloadSeparado'))
      .value;
  Computed<String?>? _$brasaoComputed;

  @override
  String? get brasao =>
      (_$brasaoComputed ??= Computed<String?>(() => super.brasao,
              name: '_ConfiguracoesModel.brasao'))
          .value;

  late final _$_biometriaAtom =
      Atom(name: '_ConfiguracoesModel._biometria', context: context);

  @override
  int get _biometria {
    _$_biometriaAtom.reportRead();
    return super._biometria;
  }

  @override
  set _biometria(int value) {
    _$_biometriaAtom.reportWrite(value, super._biometria, () {
      super._biometria = value;
    });
  }

  late final _$_synkedDataAtom =
      Atom(name: '_ConfiguracoesModel._synkedData', context: context);

  @override
  int get _synkedData {
    _$_synkedDataAtom.reportRead();
    return super._synkedData;
  }

  @override
  set _synkedData(int value) {
    _$_synkedDataAtom.reportWrite(value, super._synkedData, () {
      super._synkedData = value;
    });
  }

  late final _$_textFactorAtom =
      Atom(name: '_ConfiguracoesModel._textFactor', context: context);

  @override
  double get _textFactor {
    _$_textFactorAtom.reportRead();
    return super._textFactor;
  }

  @override
  set _textFactor(double value) {
    _$_textFactorAtom.reportWrite(value, super._textFactor, () {
      super._textFactor = value;
    });
  }

  late final _$_downloadSeparadoAtom =
      Atom(name: '_ConfiguracoesModel._downloadSeparado', context: context);

  @override
  int get _downloadSeparado {
    _$_downloadSeparadoAtom.reportRead();
    return super._downloadSeparado;
  }

  @override
  set _downloadSeparado(int value) {
    _$_downloadSeparadoAtom.reportWrite(value, super._downloadSeparado, () {
      super._downloadSeparado = value;
    });
  }

  late final _$_brasaoAtom =
      Atom(name: '_ConfiguracoesModel._brasao', context: context);

  @override
  String? get _brasao {
    _$_brasaoAtom.reportRead();
    return super._brasao;
  }

  @override
  set _brasao(String? value) {
    _$_brasaoAtom.reportWrite(value, super._brasao, () {
      super._brasao = value;
    });
  }

  late final _$_ConfiguracoesModelActionController =
      ActionController(name: '_ConfiguracoesModel', context: context);

  @override
  void setBiometria(int value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setBiometria');
    try {
      return super.setBiometria(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSynkedData(int value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setSynkedData');
    try {
      return super.setSynkedData(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextFactor(double value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setTextFactor');
    try {
      return super.setTextFactor(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDownloadSeparado(int value) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setDownloadSeparado');
    try {
      return super.setDownloadSeparado(value);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBrasao(String? brasao) {
    final _$actionInfo = _$_ConfiguracoesModelActionController.startAction(
        name: '_ConfiguracoesModel.setBrasao');
    try {
      return super.setBrasao(brasao);
    } finally {
      _$_ConfiguracoesModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
biometria: ${biometria},
synkedData: ${synkedData},
textFactor: ${textFactor},
downloadSeparado: ${downloadSeparado},
brasao: ${brasao}
    ''';
  }
}
