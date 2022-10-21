import 'package:mobx/mobx.dart';

import '../../models/monitoramento/monitoramento_model.dart';

part 'home_screen_state.g.dart';

class HomeScreenState = _HomeScreenState with _$HomeScreenState;

abstract class _HomeScreenState with Store {
  // Observable
  int _page = 0;

  @observable
  bool _loading = false;

  bool _finishLoading = false;

  @observable
  bool _hasError = false;

  bool _useFilter = false;

  @observable
  bool _usedFilter = false;

  @observable
  ObservableList<MonitoramentoModel> _monitoramentos = ObservableList();

  // Computed
  int get page => _page;

  @computed
  bool get loading => _loading;

  @computed
  bool get finishLoading => _finishLoading;

  @computed
  bool get hasError => _hasError;

  bool get useFilter => _useFilter;

  @computed
  bool get usedFilter => _usedFilter;

  @computed
  ObservableList<MonitoramentoModel> get monitoramentos => _monitoramentos;

  // Action
  void setPage({required int page}) {
    _page = page;
  }

  @action
  void incPage() {
    _page++;
  }

  @action
  void setLoading({required bool value}) {
    _loading = value;
  }

  @action
  void setFinishLoading({required bool value}) {
    _finishLoading = value;
  }

  @action
  void setHasError({required bool value}) {
    _hasError = value;
  }

  void setUseFilter({required bool value}) {
    _useFilter = value;
  }

  @action
  void isUsedFilter() {
    _usedFilter = true;
  }

  @action
  void resetState() {
    _monitoramentos = ObservableList();
    _page = 0;
    _loading = false;
    _finishLoading = false;
    _hasError = false;
    _useFilter = false;
    _usedFilter = false;
  }
}
