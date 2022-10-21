import 'dart:io';

import '../../constants/routes/web_routes.dart';
import '../../services/http_service.dart';
import '../../utils/request_utils.dart';

class MonitoramentoRepository {
  static Future<Map<String, dynamic>> downloadData() async {
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: await retornaJWT(),
    };

    Map<String, dynamic> response = await HttpService.get(
      rota: WebRoutes.BUSCAR_MONITORAMENTOS,
      headers: headers,
    );

    return response;
  }
}
