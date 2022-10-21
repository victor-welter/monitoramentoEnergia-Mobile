// ignore_for_file: constant_identifier_names

class App {
  static const String NAME = 'Monitoramento de energia';

  static const String VERSION = '1.0.0';

  static const String ANDROID_ID =
      'bbr.com.flutter.monitoramento_energia_mobile';

  static const String DATA_ATUALIZACAO = '18/07/2022';

  static const String DESENVOLVEDOR = 'Víctor Vinícius Welter';

  static const int QUANTIDADE_LOGIN = 15;
}

enum DialogAction { ok, sim_nao, none }

enum ErrorType {
  generic,
  internet,
  login,
  login_offline,
  http_request,
  session,
  sync,
  expiredToken,
}

class SharedKeys {
  static const SECURE_TOKEN_JWT = 'secure_token_jwt';

  static const SECURE_PASSWORD = 'secure_password';
}

class CadOptions {
  static const SIM = 1;

  static const NAO = 0;
}

class NormalizeDate {
  ///dd/MM/yyyy
  static const BR_FORMAT = 1;

  static const JUST_HOUR = 2;
}

class SearchOffset {
  static const MONITORAMENTOS = 20;
}
