import 'package:mobx/mobx.dart';

part 'error_store.g.dart';

///Store que armazena as mensagens de erros (de sincronização) que devem serem exibidas no app
class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {
  // Observable
  @observable
  String _messageError = '';

  // Computed
  @computed
  String get messageError => _messageError;

  // Action
  @action
  void setMessageError(String message) {
    _messageError = message;
  }
}
