import '../constants/constants.dart';

extension IntExt on int {
  bool toBool() {
    if (this == CadOptions.SIM) {
      return true;
    } else {
      return false;
    }
  }
}
