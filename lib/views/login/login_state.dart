import 'package:mobx/mobx.dart';

part 'login_state.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  @observable
  bool _obscurePassword = true;

  @observable
  bool _loggingIn = false;

  @observable
  String _errorMessage = '';

  @computed
  bool get obscurePassword => _obscurePassword;

  @computed
  bool get loggingIn => _loggingIn;

  @computed
  String get errorMessage => _errorMessage;

  @action
  void changeObscurePassword() {
    _obscurePassword = !_obscurePassword;
  }

  @action
  void setLogginIn({required bool value}) {
    _loggingIn = value;
  }

  @action
  void setErrorMessage(String message) {
    _errorMessage = message;
  }

  @action
  void resetState() {
    _obscurePassword = true;
    _loggingIn = false;
    _errorMessage = '';
  }
}
