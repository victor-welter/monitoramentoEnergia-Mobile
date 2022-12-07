import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import '../constants/constants.dart';

///Converte a data vinda do banco de dados.
///
///Milissegundos -> DateTime
DateTime? convertDataDB(int? milliseconds) {
  if (milliseconds == null) {
    return null;
  }

  return DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

String? dateFormatBR(DateTime? date) {
  if (date == null) {
    return null;
  }

  return DateFormat('dd/MM/yyyy').format(date);
}

String? uploadDateFormat(DateTime? date) {
  if (date == null) {
    return null;
  }

  return DateFormat('yyyy-MM-dd').format(date);
}

String? uploadHourFormat(DateTime? hour) {
  if (hour == null) {
    return null;
  }

  return DateFormat('HH:mm:ss').format(hour);
}

DateTime? tryParseDate(dynamic value, {int? normalizeDateType}) {
  if (value == null) {
    return null;
  }

  if (normalizeDateType != null) {
    try {
      value = _normalizeDate(normalizeDateType, value);
    } catch (_) {}
  }

  return DateTime.tryParse(value.toString());
}

//Recebe um tipo de data esperada em determinado formato e retorna uma data que pode ser convertida pelo DateTime.tryParse
String? _normalizeDate(int type, dynamic value) {
  switch (type) {
    //Formato esperado: dd/MM/yyyy
    case NormalizeDate.BR_FORMAT:
      String v = (value as String).replaceAll('/', '');
      if (v.length == 8) {
        String year = v.substring(4, 8);
        String month = v.substring(2, 4);
        String day = v.substring(0, 2);
        return '$year$month$day';
      }
      return null;

    //Formato esperado: yyyy-mm-dd
    case NormalizeDate.US_FORMAT:
      String v = (value as String).replaceAll('-', '');
      if (v.length >= 8) {
        String year = v.substring(0, 4);
        String month = v.substring(4, 6);
        String day = v.substring(6, 8);
        return '$year$month$day';
      }
      return null;

    //Formato esperado: HH:mm:ss
    case NormalizeDate.JUST_HOUR:
      if ((value as String).length == 8) {
        DateTime now = DateTime.now();
        String date = '${now.year}${(now.month).toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
        return '$date $value';
      }
      return value;
    default:
      return null;
  }
}

///Retorna uma nova instância da lista clonada (Permite tipagem)
List<T> cloneList<T>(List<dynamic> list) {
  return list.map((e) => e as T).toList();
}

///Recebe um objeto DateTime e retorna um novo DateTime onde apenas as datas são consideradas (horas e minutos são zerados)
DateTime justDate(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

///Recebe um objeto DateTime e retorna um novo DateTime onde apenas as horas, minutos e segundos são considerados
DateTime justHour(DateTime hour) {
  return DateTime(2000, 1, 1, hour.hour, hour.minute, hour.second);
}

///Retorna o primeiro dia do mês atual
DateTime firstDayOfMonth() {
  DateTime now = DateTime.now();

  return DateTime(now.year, now.month);
}

///Retorna o último dia do mês atual
DateTime lastDayOfMonth() {
  DateTime now = DateTime.now();

  return DateTime(
    now.year,
    now.month,
    AgeCalculator.daysInMonth(now.year, now.month),
  );
}

///Fecha o processo do aplicativo encerrando a VM Dart
Future<void> exitApp() async {
  exit(0);
}

bool isNullOrEmpty(String? value) {
  if (value == null || value.isEmpty || value == 'null') {
    return true;
  }

  return false;
}

String extensionFile(String path) {
  return extension(path).replaceAll('.', '');
}

String removeExtensionFile(String path) {
  String ext = extension(path);

  return path.replaceAll(ext, '');
}

String? formatValoresMonetarios(dynamic valor) {
  if (valor == null) {
    return null;
  }

  return 'R\$${NumberFormat.currency(
    locale: 'pt',
    decimalDigits: 2,
    symbol: '',
  ).format(valor)}';
}

String? formatQuantidade(dynamic valor) {
  if (valor == null) {
    return null;
  }

  double quantidade = double.parse(valor.toString());

  double valorArrendondado = quantidade.roundToDouble();

  if (valorArrendondado == quantidade) {
    return '${quantidade.toStringAsFixed(0)}';
  }

  return '$quantidade';
}
