import 'package:flutter/material.dart';

import '../../models/monitoramento/monitoramento_model.dart';
import '../../services/dialog_service.dart';
import '../cs_icon.dart';
import '../cs_info_inline.dart';
import '../dialog-content/content_dados_monitoramento.dart';

class CardMonitoramento extends StatelessWidget {
  const CardMonitoramento({
    required this.monitoramento,
    Key? key,
  }) : super(key: key);

  final MonitoramentoModel monitoramento;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.scaffoldBackgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: theme.primaryColor),
      ),
      child: InkWell(
        onTap: () async => await openDialogWithContent(
          content: ContentDadosMonitoramento(
            monitoramento: monitoramento,
          ),
          icon: Icons.bolt_rounded,
        ),
        splashColor: theme.colorScheme.onPrimary,
        focusColor: theme.colorScheme.onPrimary,
        hoverColor: theme.colorScheme.onPrimary,
        highlightColor: theme.colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            children: [
              CsInfoInline(
                icon: const CsIcon(icon: Icons.calendar_today_rounded),
                label: 'Data',
                info: monitoramento.dataMonitoramento,
              ),
              CsInfoInline(
                icon: const CsIcon(icon: Icons.access_time_rounded),
                label: 'Horário',
                info: monitoramento.horarioMonitoramento,
              ),
              CsInfoInline(
                icon: const CsIcon(icon: Icons.attach_money_rounded),
                label: 'Custo',
                info: monitoramento.custoMonitoramento.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
