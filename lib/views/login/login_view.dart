import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/assets/assets_path.dart';
import '../../constants/constants.dart';
import '../../constants/routes/local_routes.dart';
import '../../controllers/usuario/usuarios_controller.dart';
import '../../extensions/int_ext.dart';
import '../../models/erros/error_model.dart';
import '../../models/sessao/sessao_model.dart';
import '../../services/dialog_service.dart';
import '../../services/local_auth_service.dart';
import '../../services/navigation_service.dart';
import '../../services/secure_storage_service.dart';
import '../../services/service_locator.dart';
import '../../stores/error/error_store.dart';
import '../../widgets/animations/fade_widget.dart';
import '../../widgets/cards/card_error_login.dart';
import '../../widgets/cs_circular_progress_indicador.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_text_form_field.dart';
import 'login_state.dart';
import 'login_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody> {
  //State
  final _stateView = LoginState();
  final _sessao = getIt<SessaoModel>();
  final _error = getIt<ErrorStore>();

  //[Controllers]
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  //Form Validation
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _buscaUltimoLogin();
  }

  @override
  void dispose() {
    _error.setMessageError('');

    super.dispose();
  }

  //Busca o último usuário que fez login
  Future<void> _buscaUltimoLogin() async {
    try {
      SessaoModel sessao = await UsuariosController.lastLogin();

      //Copia as infos da sessão
      SessaoModel.copyWith(oldSession: _sessao, newSession: sessao);

      _emailController.text = sessao.usuario!;

      _localAuth();
    } catch (_) {}
  }

  Future<void> _localAuth() async {
    if (_sessao.configuracoes!.biometria.toBool()) {
      try {
        await LocalAuthService.requestAuthentication();

        String password =
            await SecureStorageService.read(SharedKeys.SECURE_PASSWORD) ?? '';

        _senhaController.text = password;

        _login();
      } catch (_) {}
    }
  }

  IconData _iconObscureText() {
    if (_stateView.obscurePassword) {
      return Icons.visibility_outlined;
    }

    return Icons.visibility_off_outlined;
  }

  String _tooltipPassword() {
    if (_stateView.obscurePassword) {
      return 'Mostrar senha';
    }

    return 'Esconder senha';
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();

    _error.setMessageError('');

    if (_stateView.loggingIn) {
      return;
    }

    try {
      _stateView.setLogginIn(value: true);

      if (_formKey.currentState?.validate() ?? false) {
        _formKey.currentState?.save(); //Seta os valores nos campos da model

        // await UsuariosController.login();

        await Future.delayed(const Duration(seconds: 1));

        getIt<NavigationService>()
            .pushNamedAndRemoveUntil(LocalRoutes.SYNC_SERVICE);
      }
    } catch (err) {
      if (err is ErrorModel) {
        if (err.type == ErrorType.internet) {
          bool offline = await UsuariosController.loginOffline();

          if (offline) {
            showSnackbar(
              description: 'O aplicativo está sendo executado no modo offline',
            );

            getIt<NavigationService>().pushNamedAndRemoveUntil(
              LocalRoutes.HOME_SCREEN,
            );
          } else {
            _error.setMessageError(err.descricao!);
          }
        } else {
          _error.setMessageError(err.descricao!);
        }
      } else {
        _error.setMessageError(
          'Ocorreu um erro desconhecido. Por favor, contate o suporte!',
        );
      }
    } finally {
      _stateView.setLogginIn(value: false);
    }
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Campo de E-mail
                    CsTextFormField(
                      hintText: 'Informe seu e-mail',
                      label: 'E-mail',
                      controller: _emailController,
                      validator: LoginValidator.validateUsuario,
                      onChanged: (usuario) {
                        _sessao.setUsuario(usuario);
                      },
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.text,
                      prefixIcon: const CsIconButton(
                        child: CsIcon(
                          icon: Icons.person_outline_rounded,
                        ),
                      ),
                    ),

                    // Campo de senha
                    Observer(
                      builder: (_) {
                        return CsTextFormField(
                          hintText: 'Informe sua senha',
                          label: 'Senha',
                          controller: _senhaController,
                          validator: LoginValidator.validateSenha,
                          onChanged: (senha) {
                            _sessao.setSenha(senha);
                          },
                          obscureText: _stateView.obscurePassword,
                          autocorrect: false,
                          enableSuggestions: false,
                          prefixIcon: const CsIconButton(
                            child: CsIcon.icon(
                              icon: Icons.lock_outline_rounded,
                            ),
                          ),
                          suffixIcon: CsIconButton(
                            tooltip: _tooltipPassword(),
                            onPressed: _stateView.changeObscurePassword,
                            child: CsIcon(
                              icon: _iconObscureText(),
                            ),
                          ),
                        );
                      },
                    ),

                    Observer(builder: (_) {
                      if (_error.messageError.isNotEmpty) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: CardErrorLogin(
                            label: _error.messageError,
                          ),
                        );
                      }

                      return const SizedBox(height: 15);
                    }),

                    Observer(
                      builder: (_) {
                        return AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: _stateView.loggingIn
                              ? const CsCircularProgressIndicador.light()
                              : CsElevatedButton(
                                  label: 'Entrar',
                                  onPressed: () => _login(),
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
