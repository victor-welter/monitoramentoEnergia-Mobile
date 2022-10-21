// ignore_for_file: unused_element

import 'package:mobx/mobx.dart';

import '../../constants/constants.dart';

part 'configuracoes_model.g.dart';

class ConfiguracoesModel = _ConfiguracoesModel with _$ConfiguracoesModel;

abstract class _ConfiguracoesModel with Store {
  _ConfiguracoesModel();

  _ConfiguracoesModel.fromDatabase(Map<String, dynamic> data) {
    _biometria = data['BIOMETRIA'];
    _synkedData = data['SYNKED_DATA'];
    _textFactor = data['TEXT_FACTOR'];
    _downloadSeparado = data['DOWNLOAD_SEPARADO'];
    _aceitouPermissoes = data['ACEITOU_PERMISSOES'];
  }

  @observable
  int _biometria = CadOptions.NAO;

  @observable
  int _synkedData = CadOptions.NAO;

  @observable
  double _textFactor = 1;

  @observable
  int _downloadSeparado = CadOptions.NAO;

  int _aceitouPermissoes = CadOptions.NAO;

  @observable
  String? _brasao;

  @action
  void setBiometria(int value) {
    _biometria = value;
  }

  @computed
  int get biometria => _biometria;

  @action
  void setSynkedData(int value) {
    _synkedData = value;
  }

  @computed
  int get synkedData => _synkedData;

  @action
  void setTextFactor(double value) {
    _textFactor = value;
  }

  @computed
  double get textFactor => _textFactor;

  @action
  void setDownloadSeparado(int value) {
    _downloadSeparado = value;
  }

  @computed
  int get downloadSeparado => _downloadSeparado;

  void setAceitouPermissoes(int value) {
    _aceitouPermissoes = value;
  }

  int get aceitouPermissoes => _aceitouPermissoes;

  @action
  void setBrasao(String? brasao) {
    _brasao = brasao;
  }

  @computed
  String? get brasao => _brasao;
}
