// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyncStore on _SyncStore, Store {
  Computed<double>? _$valueProgressComputed;

  @override
  double get valueProgress =>
      (_$valueProgressComputed ??= Computed<double>(() => super.valueProgress,
              name: '_SyncStore.valueProgress'))
          .value;
  Computed<String>? _$messageErrorComputed;

  @override
  String get messageError =>
      (_$messageErrorComputed ??= Computed<String>(() => super.messageError,
              name: '_SyncStore.messageError'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_SyncStore.hasError'))
      .value;
  Computed<String>? _$currentActionComputed;

  @override
  String get currentAction =>
      (_$currentActionComputed ??= Computed<String>(() => super.currentAction,
              name: '_SyncStore.currentAction'))
          .value;
  Computed<String>? _$messageSyncComputed;

  @override
  String get messageSync =>
      (_$messageSyncComputed ??= Computed<String>(() => super.messageSync,
              name: '_SyncStore.messageSync'))
          .value;
  Computed<int>? _$progressDownloadComputed;

  @override
  int get progressDownload => (_$progressDownloadComputed ??= Computed<int>(
          () => super.progressDownload,
          name: '_SyncStore.progressDownload'))
      .value;
  Computed<int>? _$totalProgressDownloadComputed;

  @override
  int get totalProgressDownload => (_$totalProgressDownloadComputed ??=
          Computed<int>(() => super.totalProgressDownload,
              name: '_SyncStore.totalProgressDownload'))
      .value;

  late final _$_valueProgressAtom =
      Atom(name: '_SyncStore._valueProgress', context: context);

  @override
  double get _valueProgress {
    _$_valueProgressAtom.reportRead();
    return super._valueProgress;
  }

  @override
  set _valueProgress(double value) {
    _$_valueProgressAtom.reportWrite(value, super._valueProgress, () {
      super._valueProgress = value;
    });
  }

  late final _$_messageErrorAtom =
      Atom(name: '_SyncStore._messageError', context: context);

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

  late final _$_hasErrorAtom =
      Atom(name: '_SyncStore._hasError', context: context);

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

  late final _$_currentActionAtom =
      Atom(name: '_SyncStore._currentAction', context: context);

  @override
  String get _currentAction {
    _$_currentActionAtom.reportRead();
    return super._currentAction;
  }

  @override
  set _currentAction(String value) {
    _$_currentActionAtom.reportWrite(value, super._currentAction, () {
      super._currentAction = value;
    });
  }

  late final _$_messageSyncAtom =
      Atom(name: '_SyncStore._messageSync', context: context);

  @override
  String get _messageSync {
    _$_messageSyncAtom.reportRead();
    return super._messageSync;
  }

  @override
  set _messageSync(String value) {
    _$_messageSyncAtom.reportWrite(value, super._messageSync, () {
      super._messageSync = value;
    });
  }

  late final _$_progressDownloadAtom =
      Atom(name: '_SyncStore._progressDownload', context: context);

  @override
  int get _progressDownload {
    _$_progressDownloadAtom.reportRead();
    return super._progressDownload;
  }

  @override
  set _progressDownload(int value) {
    _$_progressDownloadAtom.reportWrite(value, super._progressDownload, () {
      super._progressDownload = value;
    });
  }

  late final _$_totalProgressDownloadAtom =
      Atom(name: '_SyncStore._totalProgressDownload', context: context);

  @override
  int get _totalProgressDownload {
    _$_totalProgressDownloadAtom.reportRead();
    return super._totalProgressDownload;
  }

  @override
  set _totalProgressDownload(int value) {
    _$_totalProgressDownloadAtom
        .reportWrite(value, super._totalProgressDownload, () {
      super._totalProgressDownload = value;
    });
  }

  late final _$_SyncStoreActionController =
      ActionController(name: '_SyncStore', context: context);

  @override
  void incrementProgress({required double value}) {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.incrementProgress');
    try {
      return super.incrementProgress(value: value);
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessageError(String message) {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.setMessageError');
    try {
      return super.setMessageError(message);
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentAction(String action) {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.setCurrentAction');
    try {
      return super.setCurrentAction(action);
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessageSync(String message) {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.setMessageSync');
    try {
      return super.setMessageSync(message);
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProgressDownload(int progressDownload) {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.setProgressDownload');
    try {
      return super.setProgressDownload(progressDownload);
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void somaProgressDownload() {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.somaProgressDownload');
    try {
      return super.somaProgressDownload();
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalDownload(int totalDownload) {
    final _$actionInfo = _$_SyncStoreActionController.startAction(
        name: '_SyncStore.setTotalDownload');
    try {
      return super.setTotalDownload(totalDownload);
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo =
        _$_SyncStoreActionController.startAction(name: '_SyncStore.resetState');
    try {
      return super.resetState();
    } finally {
      _$_SyncStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueProgress: ${valueProgress},
messageError: ${messageError},
hasError: ${hasError},
currentAction: ${currentAction},
messageSync: ${messageSync},
progressDownload: ${progressDownload},
totalProgressDownload: ${totalProgressDownload}
    ''';
  }
}
