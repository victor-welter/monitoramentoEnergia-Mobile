// ignore_for_file: constant_identifier_names

class App {
  static const NAME = 'Monitoramento de Energia';

  static const VERSION = '1.0.0';

  static const ANDROID_ID = 'br.com.flutter.monitoramento_energia_mobile';

  static const DATA_ATUALIZACAO = '18/07/2022';

  static const DESENVOLVEDOR = 'Víctor Vinícius Welter';
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

  //yyyy-mm-dd
  static const US_FORMAT = 3;
}

class SearchOffset {
  static const MONITORAMENTOS = 20;
}
