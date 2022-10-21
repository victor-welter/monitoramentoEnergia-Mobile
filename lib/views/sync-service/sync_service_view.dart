import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wakelock/wakelock.dart';

import '../../constants/assets/assets_path.dart';
import '../../constants/constants.dart';
import '../../constants/routes/local_routes.dart';
import '../../controllers/sync/sync_controller.dart';
import '../../models/erros/error_model.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../stores/sync/sync_store.dart';
import '../../widgets/animations/fade_widget.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_sync_progress_indicator.dart';
import '../../widgets/cs_text_button.dart';

final _stateView = getIt<SyncStore>();

Future<void> _syncService() async {
  try {
    Wakelock.enable();

    await SyncController.syncService();

    getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.HOME_SCREEN);
  } catch (err) {
    _stateView.setHasError(value: true);

    if (err is ErrorModel) {
      final errors = {
        ErrorType.http_request,
        ErrorType.sync,
        ErrorType.internet
      };

      if (errors.contains(err.type)) {
        _stateView.setMessageError(err.descricao!);
      }
    } else {
      _stateView.setMessageError(
        'Ocorreu um erro desconhecido durante o processo de sincronização',
      );
    }
  } finally {
    Wakelock.disable();
  }
}

class SyncServiceView extends StatefulWidget {
  const SyncServiceView({Key? key}) : super(key: key);

  @override
  State<SyncServiceView> createState() => _SyncServiceViewState();
}

class _SyncServiceViewState extends State<SyncServiceView> {
  @override
  initState() {
    super.initState();

    _syncService();
  }

  @override
  void dispose() {
    _stateView.resetState();
    _stateView.resetControlSync();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const _SyncServiceBody(),
    );
  }
}

class _SyncServiceBody extends StatefulWidget {
  const _SyncServiceBody({Key? key}) : super(key: key);

  @override
  State<_SyncServiceBody> createState() => _SyncServiceBodyState();
}

class _SyncServiceBodyState extends State<_SyncServiceBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FadeWidget(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Image.asset(
              AssetsPath.LOGO,
              fit: BoxFit.scaleDown,
              height: 400,
              width: 400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Observer(builder: (_) {
                if (_stateView.hasError) {
                  return const _SyncServiceError();
                }

                return const _SyncServiceDownload();
              }),
            ),
          ),
        )
      ],
    );
  }
}

class _SyncServiceDownload extends StatelessWidget {
  const _SyncServiceDownload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Observer(builder: (_) {
          return Text(
            _stateView.currentAction,
            style: TextStyle(
              color: theme.colorScheme.primaryContainer,
              fontSize: 20,
            ),
          );
        }),
        const SizedBox(height: 25),
        Observer(builder: (_) {
          return CsSyncProgressIndicator.success(
            value: _stateView.valueProgress,
            message: _stateView.messageSync,
            progress: _stateView.progressDownload,
            totalProgress: _stateView.totalProgressDownload,
          );
        }),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _SyncServiceError extends StatelessWidget {
  const _SyncServiceError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Text(
          'Erro ao baixar dados',
          style: TextStyle(
            color: theme.errorColor,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          _stateView.messageError,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: theme.colorScheme.primaryContainer,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Observer(builder: (_) {
          return CsSyncProgressIndicator.error(
            value: _stateView.valueProgress,
            message: _stateView.messageSync,
            progress: _stateView.progressDownload,
            totalProgress: _stateView.totalProgressDownload,
          );
        }),
        const SizedBox(height: 20),
        CsElevatedButton(
          height: 40,
          label: 'TENTAR NOVAMENTE',
          onPressed: () {
            _stateView.resetState();
            _syncService();
          },
        ),
        const SizedBox(height: 10),
        CsTextButton(
          label: 'CANCELAR',
          onTap: () {
            getIt<NavigationService>().pushNamedAndRemoveUntil(
              LocalRoutes.LOGIN,
            );
          },
        ),
      ],
    );
  }
}
