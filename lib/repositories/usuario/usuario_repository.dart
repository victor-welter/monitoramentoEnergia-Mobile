import '../../constants/routes/web_routes.dart';
import '../../models/sessao/sessao_model.dart';
import '../../services/http_service.dart';
import '../../services/service_locator.dart';

class UsuarioRepository {
  static Future<String> login() async {
    final sessao = getIt<SessaoModel>();

    final Map<String, dynamic> params = {
      'Login': sessao.usuario,
      'Senha': sessao.senha,
    };

    Future<String> response = await HttpService.get(
      rota: WebRoutes.LOGIN,
      params: params,
    );

    return response;
  }
}
