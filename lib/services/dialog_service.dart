import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/assets/assets_path.dart';
import '../constants/constants.dart';
import '../widgets/cs_text_button.dart';
import '../widgets/cs_theme_date_picker.dart';
import '../widgets/dialog-content/cs_alert_dialog.dart';
import '../widgets/dialog-content/cs_alert_dialog_content.dart';
import 'navigation_service.dart';
import 'service_locator.dart';

final _navigatorKey = getIt<NavigationService>().navigatorKey;

bool _dialogOpen = false;

Future<T?> openSimpleDialog<T>({
  required String title,
  required String description,
  List<Widget>? actions,
  DialogAction defaultAction = DialogAction.none,
  bool tapDismiss = true,
}) async {
  actions = _defaultAction(defaultAction);

  _dialogOpen = true;

  return await showDialog<T>(
    context: _navigatorKey.currentContext!,
    barrierDismissible: tapDismiss,
    useSafeArea: true,
    builder: (context) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(tapDismiss);
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: CsAlertDialog(
            title: title,
            description: description,
            actions: actions,
          ),
        ),
      );
    },
  ).then((value) {
    _dialogOpen = false;
    return value;
  });
}

Future<dynamic> openDialogWithContent<T>({
  required Widget content,
  required IconData icon,
  bool tapDismiss = true,
}) async {
  _dialogOpen = true;

  return await showDialog<T>(
    context: _navigatorKey.currentContext!,
    barrierDismissible: tapDismiss,
    builder: (context) {
      return CsAlertDialogContent(
        content: content,
        icon: icon,
      );
    },
  ).then((value) {
    _dialogOpen = false;
    return value;
  });
}

void closeDialog() async {
  if (_dialogOpen) {
    Navigator.pop(_navigatorKey.currentContext!);
  }
}

Future<DateTime?> getDate({
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? initialDate,
  DatePickerMode datePickerMode = DatePickerMode.day,
  DatePickerEntryMode entryMode = DatePickerEntryMode.calendarOnly,
}) async {
  return await showDatePicker(
    context: _navigatorKey.currentContext!,
    locale: const Locale('pt', 'BR'),
    initialDatePickerMode: datePickerMode,
    initialEntryMode: entryMode,
    firstDate: firstDate, //Range inicial
    lastDate: lastDate, //Range final
    initialDate: initialDate ?? DateTime.now(), //Data inicial selecionada
    builder: (_, child) {
      return CsThemeDatePicker(child: child!);
    },
  );
}

List<Widget>? _defaultAction(DialogAction defaultAction) {
  if (defaultAction == DialogAction.ok) {
    return [
      CsTextButton(
        label: 'OK',
        color: Theme.of(_navigatorKey.currentContext!).primaryColor,
        onTap: () => Navigator.pop(_navigatorKey.currentContext!),
      ),
    ];
  } else if (defaultAction == DialogAction.sim_nao) {
    return [
      CsTextButton(
        label: 'SIM',
        color: Theme.of(_navigatorKey.currentContext!).primaryColor,
        onTap: () => Navigator.pop(_navigatorKey.currentContext!, true),
      ),
      CsTextButton(
        label: 'NÃO',
        color: Theme.of(_navigatorKey.currentContext!).primaryColor,
        onTap: () => Navigator.pop(_navigatorKey.currentContext!, false),
      ),
    ];
  }

  return null;
}

void showSnackbar({
  required String description,
  int seconds = 5,
  SnackBarAction? action,
  SnackBarBehavior? behavior,
}) {
  ScaffoldMessenger.of(_navigatorKey.currentContext!).removeCurrentSnackBar();

  ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Image.asset(AssetsPath.LOGO, width: 30, height: 30),
          const SizedBox(width: 5),
          Expanded(child: Text(description, textAlign: TextAlign.justify)),
        ],
      ),
      duration: Duration(seconds: seconds),
      behavior: behavior ?? SnackBarBehavior.floating,
      action: action,
    ),
  );
}
