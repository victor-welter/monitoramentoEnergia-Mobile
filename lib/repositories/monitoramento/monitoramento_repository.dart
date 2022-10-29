import '../../constants/routes/web_routes.dart';
import '../../services/http_service.dart';

class MonitoramentoRepository {
  static Future<List<dynamic>> downloadData() async {
    // Map<String, dynamic> headers = {
    //   HttpHeaders.authorizationHeader: await retornaJWT(),
    // };

    List<dynamic> response = await HttpService.get(
      rota: WebRoutes.BUSCAR_MONITORAMENTOS,
      // headers: headers,
    );

    return response;
  }
}
