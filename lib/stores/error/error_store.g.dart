// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ErrorStore on _ErrorStore, Store {
  Computed<String>? _$messageErrorComputed;

  @override
  String get messageError =>
      (_$messageErrorComputed ??= Computed<String>(() => super.messageError,
              name: '_ErrorStore.messageError'))
          .value;

  late final _$_messageErrorAtom =
      Atom(name: '_ErrorStore._messageError', context: context);

  @override
  String get _messageError {
    _$_messageErrorAtom.reportRead();
    return super._messageError;
  }

  @override
  set _messageError(String value) {
    _$_messageErrorAtom.reportWrite(value, super._messageError, () {
      super._messageError = value;
    });
  }

  late final _$_ErrorStoreActionController =
      ActionController(name: '_ErrorStore', context: context);

  @override
  void setMessageError(String message) {
    final _$actionInfo = _$_ErrorStoreActionController.startAction(
        name: '_ErrorStore.setMessageError');
    try {
      return super.setMessageError(message);
    } finally {
      _$_ErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageError: ${messageError}
    ''';
  }
}
