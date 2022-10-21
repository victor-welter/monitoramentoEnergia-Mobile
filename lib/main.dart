import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/constants.dart';
import 'constants/routes/local_routes.dart';
import 'constants/theme/theme_app.dart';
import 'router_app.dart';
import 'services/navigation_service.dart';
import 'services/service_locator.dart';
import 'widgets/no_glow_effect.dart';

final routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  // Bloqueia a orientação do dispositivo como "Somente Retrato"
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: App.NAME,
      themeMode: ThemeMode.light,
      theme: ThemeApp.themeApp,
      color: theme.primaryColor,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      navigatorObservers: [routeObserver],
      builder: (context, child) {
        if (!getIt.isRegistered<BuildContext>()) {
          getIt.registerSingleton<BuildContext>(context);
        }

        return ScrollConfiguration(
          behavior: const NoGlowEffect(),
          child: child!,
        );
      },
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      initialRoute: LocalRoutes.SPLASH_SCREEN,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
