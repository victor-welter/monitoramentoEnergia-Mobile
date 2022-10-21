import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  ///Verifica se o dispositivo está conectado a uma rede `WI-FI` ou `DADOS MÓVEIS`
  static Future<bool> hasInternet() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      //Há conexão
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      //Sem conexão
      return false;
    }

    return false;
  }
}
