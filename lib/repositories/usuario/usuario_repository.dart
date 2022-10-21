import '../../constants/routes/web_routes.dart';
import '../../models/sessao/sessao_model.dart';
import '../../services/http_service.dart';
import '../../services/service_locator.dart';

class UsuarioRepository {
  static Future<Map<String, dynamic>> login() async {
    final sessao = getIt<SessaoModel>();

    final Map<String, dynamic> body = {
      'Login': sessao.usuario,
      'Senha': sessao.senha,
    };

    Map<String, dynamic> response = await HttpService.post(
      rota: WebRoutes.LOGIN,
      body: body,
    );

    return response;
  }
}
