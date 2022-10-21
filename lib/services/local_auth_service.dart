import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

import '../models/erros/error_model.dart';

class LocalAuthService {
  static Future<bool> hasDeviceSupport() async {
    try {
      return await LocalAuthentication().canCheckBiometrics;
    } catch (_) {
      return false;
    }
  }

  static Future<void> requestAuthentication() async {
    try {
      bool auth = await LocalAuthentication().authenticate(
        localizedReason:
            'Utilize a autenticação biométrica para logar no aplicativo',
        authMessages: {
          const AndroidAuthMessages(
            cancelButton: 'Cancelar',
            signInTitle: 'Autenticação Biométrica',
            biometricSuccess: 'Reconhecido',
            biometricNotRecognized: 'Não reconhecido',
            biometricHint: '',
            biometricRequiredTitle: '',
            deviceCredentialsSetupDescription: '',
            deviceCredentialsRequiredTitle: '',
            goToSettingsButton: '',
            goToSettingsDescription: '',
          ),
        },
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: false,
          stickyAuth: true,
        ),
      );

      if (!auth) {
        throw ErrorModel();
      }
    } catch (_) {
      rethrow;
    }
  }
}
