import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'constants/routes/local_routes.dart';
import 'models/sessao/sessao_model.dart';
import 'services/service_locator.dart';
import 'views/configuracoes/configuracoes_view.dart';
import 'views/home-screen/home_screen_view.dart';
import 'views/login/login_view.dart';
import 'views/splash-screen/splash_screen_view.dart';
import 'views/sync-service/sync_service_view.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.SPLASH_SCREEN:
        return _PageBuilder(
          child: const SplashScreenView(),
          settings: settings,
        );

      case LocalRoutes.LOGIN:
        return _PageBuilder(
          child: const LoginView(),
          settings: settings,
        );

      case LocalRoutes.SYNC_SERVICE:
        return _PageBuilder(
          child: const SyncServiceView(),
          settings: settings,
        );

      case LocalRoutes.HOME_SCREEN:
        return _PageBuilder(
          child: const HomeScreenView(),
          settings: settings,
        );

      case LocalRoutes.CONFIGURACOES:
        return _PageBuilder(
          child: const ConfiguracoesView(),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: Container(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  /// Responsável pelo efeito de 'fade transition' entre as transições de telas
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secAnimation, child) {
            final fadeAnimation = CurvedAnimation(
              curve: Curves.easeInToLinear,
              reverseCurve: Curves.easeInToLinear,
              parent: animation,
            );

            ThemeData theme = Theme.of(context);

            MediaQueryData media = MediaQuery.of(context);

            final configs = getIt<SessaoModel>().configuracoes;

            return Observer(builder: (_) {
              return MediaQuery(
                data: media.copyWith(
                  textScaleFactor: configs!.textFactor,
                  alwaysUse24HourFormat: true,
                ),
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: theme.splashColor,
                  ),
                  child: SafeArea(
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: theme.scaffoldBackgroundColor,
                            ),
                          ),
                          FadeTransition(
                            opacity: fadeAnimation,
                            child: child,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          },
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}
