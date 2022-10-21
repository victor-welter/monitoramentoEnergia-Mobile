import '../constants/constants.dart';
import '../constants/routes/local_routes.dart';
import '../models/erros/error_model.dart';
import '../services/dialog_service.dart';
import '../services/navigation_service.dart';
import '../services/secure_storage_service.dart';
import '../services/service_locator.dart';

Future<String> retornaJWT() async {
  return (await SecureStorageService.read(SharedKeys.SECURE_TOKEN_JWT))!;
}

void validaResponse(
  Map<String, dynamic> response,
  String? message,
  ErrorType type,
) {
  if (response['status'] != 'success') {
    if (response['message'] == 'Acesso não autorizado' ||
        response['message'] == 'Autenticação expirada' ||
        response['message'] == 'Token inválido') {
      showSnackbar(
        description: 'A sua sessão expirou. Faça login novamente!',
      );
      getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.LOGIN);

      throw ErrorModel.expiredSession();
    }

    throw ErrorModel(
      descricao: message ?? '',
      type: type,
    );
  }
}
