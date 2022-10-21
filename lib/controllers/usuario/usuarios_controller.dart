import 'package:sqflite/sqflite.dart';

import '../../constants/constants.dart';
import '../../database/controllers/db_usuarios_controller.dart';
import '../../extensions/int_ext.dart';
import '../../models/erros/error_model.dart';
import '../../models/sessao/sessao_model.dart';
import '../../repositories/usuario/usuario_repository.dart';
import '../../services/secure_storage_service.dart';
import '../../services/service_locator.dart';
import '../../utils/request_utils.dart';

class UsuariosController {
  ///Responsável por efetuar o login do usuário
  static Future<void> login() async {
    final sessao = getIt<SessaoModel>();

    Map<String, dynamic> response = await UsuarioRepository.login();

    validaResponse(
      response,
      response['message'],
      ErrorType.login,
    );

    sessao
      ..setCodigoUsuario(response['data']['idUsuario'])
      ..setTokenJWT(response['token']);

    //Persiste o token do usuário em armazenamento criptografado
    await SecureStorageService.save(
      SharedKeys.SECURE_TOKEN_JWT,
      sessao.tokenJWT,
    );

    //Persiste a senha do usuário para login offline em armazenamento criptografado
    await SecureStorageService.save(
      SharedKeys.SECURE_PASSWORD,
      sessao.senha!,
    );

    int pkUsuario = await DBUsuariosController.insertUsuario(sessao);

    sessao
      ..setPKUsuario(pkUsuario)
      ..setSenha(null);
  }

  static Future<bool> loginOffline() async {
    final bool synkedData = UsuariosController.usuarioSynkedData();

    final sessao = getIt<SessaoModel>();

    final String password =
        await SecureStorageService.read(SharedKeys.SECURE_PASSWORD) ?? '';

    bool isValid = synkedData && (sessao.senha == password);

    if (isValid) {
      await SecureStorageService.save(SharedKeys.SECURE_TOKEN_JWT, '');

      SessaoModel newSession = await UsuariosController.lastLogin();

      //Copia as infos da sessão
      SessaoModel.copyWith(oldSession: sessao, newSession: newSession);
    }

    return isValid;
  }

  ///Recupera as informações do último usuário que fez login
  static Future<SessaoModel> lastLogin() async {
    Map<String, dynamic>? response = await DBUsuariosController.lastLogin();

    if (response == null) {
      throw ErrorModel.login(descricao: 'Nenhum usuário encontrado');
    }

    SessaoModel sessao = SessaoModel.fromDatabase(response);

    String token =
        (await SecureStorageService.read(SharedKeys.SECURE_TOKEN_JWT))!;

    sessao.setTokenJWT(token);

    return sessao;
  }

  ///Verifica se um usuário já realizou a primeira sincronização
  static bool usuarioSynkedData() {
    final sessao = getIt<SessaoModel>();

    return sessao.configuracoes!.synkedData.toBool();
  }

  static Future<void> updateConfiguracoes({Transaction? transaction}) async {
    final sessao = getIt<SessaoModel>();

    await DBUsuariosController.updateConfiguracoes(
      sessao,
      transaction: transaction,
    );
  }
}
