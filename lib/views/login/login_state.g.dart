// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginState on _LoginState, Store {
  Computed<bool>? _$obscurePasswordComputed;

  @override
  bool get obscurePassword =>
      (_$obscurePasswordComputed ??= Computed<bool>(() => super.obscurePassword,
              name: '_LoginState.obscurePassword'))
          .value;
  Computed<bool>? _$loggingInComputed;

  @override
  bool get loggingIn => (_$loggingInComputed ??=
          Computed<bool>(() => super.loggingIn, name: '_LoginState.loggingIn'))
      .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_LoginState.errorMessage'))
          .value;

  late final _$_obscurePasswordAtom =
      Atom(name: '_LoginState._obscurePassword', context: context);

  @override
  bool get _obscurePassword {
    _$_obscurePasswordAtom.reportRead();
    return super._obscurePassword;
  }

  @override
  set _obscurePassword(bool value) {
    _$_obscurePasswordAtom.reportWrite(value, super._obscurePassword, () {
      super._obscurePassword = value;
    });
  }

  late final _$_loggingInAtom =
      Atom(name: '_LoginState._loggingIn', context: context);

  @override
  bool get _loggingIn {
    _$_loggingInAtom.reportRead();
    return super._loggingIn;
  }

  @override
  set _loggingIn(bool value) {
    _$_loggingInAtom.reportWrite(value, super._loggingIn, () {
      super._loggingIn = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_LoginState._errorMessage', context: context);

  @override
  String get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_LoginStateActionController =
      ActionController(name: '_LoginState', context: context);

  @override
  void changeObscurePassword() {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.changeObscurePassword');
    try {
      return super.changeObscurePassword();
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogginIn({required bool value}) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.setLogginIn');
    try {
      return super.setLogginIn(value: value);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String message) {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.setErrorMessage');
    try {
      return super.setErrorMessage(message);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_LoginStateActionController.startAction(
        name: '_LoginState.resetState');
    try {
      return super.resetState();
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscurePassword: ${obscurePassword},
loggingIn: ${loggingIn},
errorMessage: ${errorMessage}
    ''';
  }
}
