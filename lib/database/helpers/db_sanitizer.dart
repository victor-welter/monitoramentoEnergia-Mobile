String sanitizeSQL(dynamic param) {
  param = param.toString();

  param = param.replaceAll(RegExp('\'', caseSensitive: false), '');
  param = param.replaceAll(RegExp('"', caseSensitive: false), '');
  param = param.replaceAll(RegExp('drop', caseSensitive: false), '');
  param = param.replaceAll(RegExp('insert', caseSensitive: false), '');
  param = param.replaceAll(RegExp('delete', caseSensitive: false), '');
  param = param.replaceAll(RegExp('update', caseSensitive: false), '');
  param = param.replaceAll(RegExp('create', caseSensitive: false), '');

  return param;
}
