// ignore_for_file: unnecessary_this

extension StringExt on String {
  bool toBool() {
    if (this.toLowerCase() == 'true') {
      return true;
    } else {
      return false;
    }
  }

  int? toInt() {
    try {
      return int.tryParse(this);
    } catch (_) {
      return null;
    }
  }
}
