import 'package:dio/dio.dart' show DioError, Response;

import '../constants/routes/local_routes.dart';
import '../constants/routes/web_routes.dart';
import '../models/erros/error_model.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import '../services/service_locator.dart';

class ResponseValidate {
  static void validate({
    required Response resp,
    required String rota,
  }) {
    int statusCode = resp.statusCode ?? 0;
    Map<String, dynamic> response = resp.data;

    if (response.containsKey('message')) {
      if (response['message'] == 'Autenticação expirada') {
        showSnackbar(
          description: 'A sua sessão expirou. Faça login novamente!',
        );
        getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.LOGIN);
        throw ErrorModel.session();
      }
    }

    if (resp.statusCode == 200) {
      return;
    }

    if (statusCode >= 500) {
      throw ErrorModel.http(
        descricao:
            'O servidor está temporariamente fora do ar. Por favor, contate o suporte!',
      );
    }

    //Deixar por último
    //Tratamento genérico
    if ((statusCode > 0 && statusCode < 200) || statusCode >= 400) {
      throw ErrorModel.http(
        descricao:
            'Ocorreu um erro desconhecido ao efetuar a sua requisição. Por favor, contate o suporte!',
      );
    }
  }

  static void validateDioError({
    required DioError error,
    required String rota,
  }) {
    if (error.message.contains('401')) {
      showSnackbar(description: 'A sua sessão expirou. Faça login novamente!');
      getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.LOGIN);
      throw ErrorModel.session();
    }

    if (error.message.contains('404')) {
      if (rota == WebRoutes.LOGIN) {
        throw ErrorModel.login(
          descricao:
              'O munícipio selecionado está inválido. Por favor, contate o suporte!',
        );
      }

      throw ErrorModel.http(
        descricao:
            'A operação solicitada não existe. Por favor, contate o suporte!',
      );
    } else if (error.message.contains('429')) {
      throw ErrorModel.http(
        descricao:
            'Muitas requisições foram efetuadas nos últimos minutos. Por favor, aguarde e tente novamente mais tarde!',
      );
    } else if (error.message.contains('502') || error.message.contains('500')) {
      throw ErrorModel.http(
        descricao:
            'O servidor está temporariamente fora do ar. Por favor, contate o suporte!',
      );
    } else if (error.message.contains('SocketException') ||
        error.message.contains('HttpException')) {
      throw ErrorModel.http(
        descricao:
            'A conexão com a internet foi perdida. Verifique o seu WI-FI ou dados móveis para continuar!',
      );
    } else {
      throw ErrorModel.http(
        descricao:
            'Não foi possível prosseguir com a solicitação. Por favor, contate o suporte!',
      );
    }
  }
}
