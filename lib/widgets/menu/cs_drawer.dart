import 'package:flutter/material.dart';

import '../../constants/assets/assets_path.dart';
import '../../constants/constants.dart';
import '../../constants/routes/local_routes.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../utils/functions_utils.dart';
import 'cs_drawer_button_item.dart';

class CsDrawer extends StatelessWidget {
  const CsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Future<void> _exitApp() async {
      await exitApp();
    }

    return Drawer(
      elevation: 5,
      backgroundColor: theme.backgroundColor,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.asset(
              AssetsPath.LOGO,
              height: 150,
              color: theme.primaryColor,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5)
                  .copyWith(bottom: 15),
              child: Text(
                App.NAME,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                  fontSize: 24,
                ),
              ),
            ),

            const _HeaderSection(label: 'Opções do Aplicativo'),

            // Button retorna ao Início
            CsDrawerButtonItem(
              icon: Icons.home_outlined,
              title: "Início",
              backgroundColor: Colors.red[50],
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),

            CsDrawerButtonItem(
              title: "Sincronizar Dados",
              icon: Icons.autorenew_rounded,
              onPressed: () {
                getIt<NavigationService>().pushNamedAndRemoveUntil(
                  LocalRoutes.SYNC_SERVICE,
                );
              },
            ),

            const _HeaderSection(label: 'Ferramentas'),

            // Button de configurações do app
            CsDrawerButtonItem(
              title: "Configurações",
              icon: Icons.settings_outlined,
              onPressed: () {
                getIt<NavigationService>().popAndPushNamed(
                  LocalRoutes.CONFIGURACOES,
                );
              },
            ),

            // Button Desloga e retorna para o login
            //
            // Quando está no modo debug
            CsDrawerButtonItem(
              icon: Icons.logout_outlined,
              title: "Voltar ao login",
              onPressed: () {
                //TODO refreshDataServiceLocator();

                getIt<NavigationService>().pushNamedAndRemoveUntil(
                  LocalRoutes.LOGIN,
                );
              },
            ),

            CsDrawerButtonItem(
              icon: Icons.exit_to_app_outlined,
              title: "Sair",
              onPressed: _exitApp,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 15, left: 10),
      child: Text(
        label,
        style: TextStyle(
          color: theme.secondaryHeaderColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
