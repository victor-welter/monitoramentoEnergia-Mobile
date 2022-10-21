import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_settings/open_settings.dart';

import '../../constants/constants.dart';
import '../../controllers/usuario/usuarios_controller.dart';
import '../../extensions/bool_ext.dart';
import '../../extensions/int_ext.dart';
import '../../models/sessao/sessao_model.dart';
import '../../services/dialog_service.dart';
import '../../services/local_auth_service.dart';
import '../../services/service_locator.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_button_item.dart';
import '../../widgets/cs_slider_item.dart';
import '../../widgets/cs_switch_item.dart';
import '../../widgets/dialog-content/content_sobre_app.dart';

class ConfiguracoesView extends StatefulWidget {
  const ConfiguracoesView({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesView> createState() => _ConfiguracoesViewState();
}

class _ConfiguracoesViewState extends State<ConfiguracoesView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CsAppBar(title: 'Configurações'),
      body: _ConfiguracoesBody(),
    );
  }
}

class _ConfiguracoesBody extends StatefulWidget {
  const _ConfiguracoesBody({Key? key}) : super(key: key);

  @override
  State<_ConfiguracoesBody> createState() => _ConfiguracoesBodyState();
}

class _ConfiguracoesBodyState extends State<_ConfiguracoesBody> {
  final configuracoes = getIt<SessaoModel>().configuracoes;

  Future<void> _onUpdateConfiguracoes() async {
    await UsuariosController.updateConfiguracoes();
  }

  Future<void> _onChangedBiometria(bool value) async {
    if (value) {
      try {
        if (!await LocalAuthService.hasDeviceSupport()) {
          configuracoes!.setBiometria(CadOptions.NAO);

          showSnackbar(
            description:
                'O dispositivo não possui suporte a leitura biométrica',
            seconds: 3,
          );

          return;
        }
      } catch (_) {
        configuracoes!.setBiometria(CadOptions.NAO);
        return;
      }
    }

    configuracoes!.setBiometria(value.toInt());

    await _onUpdateConfiguracoes();
  }

  Future<void> _onChangedTextFactor(double factor) async {
    configuracoes!.setTextFactor(factor);

    await _onUpdateConfiguracoes();
  }

  Future<void> _openWifiSettings() async {
    try {
      await OpenSettings.openWIFISetting();
    } catch (_) {
      showSnackbar(description: 'Falha ao abrir as configurações', seconds: 3);
    }
  }

  Future<void> _openSecuritySettings() async {
    try {
      await OpenSettings.openSecuritySetting();
    } catch (_) {
      showSnackbar(description: 'Falha ao abrir as configurações', seconds: 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _HeaderSection(
          label: 'Ajuda',
          child: CsButtonItem(
            icon: Icons.info_outline_rounded,
            title: 'Sobre o aplicativo',
            onPressed: () async => await openDialogWithContent(
              content: const ContentSobreApp(),
              icon: Icons.info_outline_rounded,
            ),
          ),
        ),
        _HeaderSection(
          label: 'Internet',
          child: CsButtonItem(
            title: 'Configurações de internet',
            icon: Icons.wifi_rounded,
            onPressed: _openWifiSettings,
          ),
        ),
        _HeaderSection(
          label: 'Acessibilidade',
          child: Observer(builder: (_) {
            return CsSliderItem(
              title: 'Alterar tamanho da fonte do aplicativo',
              icon: Icons.format_size_rounded,
              min: 1,
              max: 1.5,
              divisions: 4,
              value: configuracoes!.textFactor,
              onChanged: _onChangedTextFactor,
            );
          }),
        ),
        _HeaderSection(
          label: 'Segurança',
          child: Observer(builder: (_) {
            return Column(
              children: [
                CsSwitchItem(
                  icon: Icons.fingerprint_rounded,
                  title: 'Desbloqueio por biometria',
                  onChanged: _onChangedBiometria,
                  value: configuracoes!.biometria.toBool(),
                ),
                Visibility(
                  visible: configuracoes!.biometria.toBool(),
                  child: CsButtonItem(
                    icon: Icons.touch_app_outlined,
                    title: 'Configurações biometria',
                    onPressed: _openSecuritySettings,
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({
    required this.label,
    required this.child,
    Key? key,
  }) : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15),
          child: Text(
            '$label',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: theme.colorScheme.primaryContainer,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: child,
        )
      ],
    );
  }
}
