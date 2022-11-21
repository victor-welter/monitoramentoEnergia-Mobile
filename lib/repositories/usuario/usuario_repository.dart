import '../../constants/routes/web_routes.dart';
import '../../models/sessao/sessao_model.dart';
import '../../services/http_service.dart';
import '../../services/service_locator.dart';

class UsuarioRepository {
  static Future<Map<String, dynamic>> login() async {
    final sessao = getIt<SessaoModel>();

    final Map<String, dynamic> params = {
      'usuario': sessao.usuario,
      'senha': sessao.senha,
    };

    dynamic response = await HttpService.post(
      rota: WebRoutes.LOGIN,
      params: params,
    );

    return response;
  }
}
