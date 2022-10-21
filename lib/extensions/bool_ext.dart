extension BoolExt on bool {
  int toInt() {
    if (this) {
      return 1;
    } else {
      return 0;
    }
  }
}
