import 'package:get_it/get_it.dart';

import '../models/sessao/sessao_model.dart';
import '../stores/error/error_store.dart';
import '../stores/filtros/filtros_store.dart';
import '../stores/sync/sync_store.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

///Registra todas as [Stores] utilizadas pelo app
setupServiceLocator({bool firstTime = true}) {
  _registerSingleton<NavigationService>(
    instance: NavigationService(),
    allowAgain: false,
    firstTime: firstTime,
  );

  _registerSingleton<SessaoModel>(
    instance: SessaoModel(),
    allowAgain: true,
    firstTime: firstTime,
  );

  _registerSingleton<ErrorStore>(
    instance: ErrorStore(),
    allowAgain: false,
    firstTime: firstTime,
  );

  _registerLazySingleton<SyncStore>(
    instance: SyncStore(),
    allowAgain: false,
    firstTime: firstTime,
  );

  _registerLazySingleton<FiltrosStore>(
    instance: FiltrosStore(),
    allowAgain: true,
    firstTime: firstTime,
  );
}

///Ao deslogar, limpa os dados que foram carregados para o usuário anterior
refreshDataServiceLocator() {
  _unregister<SessaoModel>();
  _unregister<FiltrosStore>();

  //Deixar sempre por último
  setupServiceLocator(firstTime: false);
}

void _unregister<T extends Object>() {
  if (getIt.isRegistered<T>()) {
    getIt.unregister<T>();
  }
}

void _registerSingleton<T extends Object>({
  required T instance,
  required bool allowAgain,
  required bool firstTime,
}) {
  if (allowAgain) {
    if (!firstTime) {
      return;
    }
  }

  getIt.registerSingleton<T>(instance);
}

void _registerLazySingleton<T extends Object>({
  required T instance,
  required bool allowAgain,
  required bool firstTime,
}) {
  if (allowAgain) {
    if (!firstTime) {
      return;
    }
  }

  getIt.registerSingleton<T>(instance);
}
