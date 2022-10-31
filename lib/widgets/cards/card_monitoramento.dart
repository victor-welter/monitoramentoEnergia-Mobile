import 'package:flutter/material.dart';

import '../../models/monitoramento/monitoramento_model.dart';
import '../cs_icon.dart';
import '../cs_info_inline.dart';

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
        onTap: () {},
        splashColor: theme.colorScheme.onPrimary,
        focusColor: theme.colorScheme.onPrimary,
        hoverColor: theme.colorScheme.onPrimary,
        highlightColor: theme.colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CsInfoInline(
                      isColumn: true,
                      icon: const CsIcon(icon: Icons.calendar_today_rounded),
                      label: 'Data',
                      info: monitoramento.dataMonitoramento,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CsInfoInline(
                      isColumn: true,
                      icon: const CsIcon(icon: Icons.access_time_rounded),
                      label: 'Horário',
                      info: monitoramento.horarioMonitoramento,
                    ),
                  ),
                ],
              ),
              CsInfoInline(
                icon: const CsIcon(icon: Icons.bolt_rounded),
                label: 'Voltagem',
                info: monitoramento.voltagem.toString(),
              ),
              CsInfoInline(
                icon: const CsIcon(icon: Icons.bolt_rounded),
                label: 'Amperagem',
                info: monitoramento.amperagem.toString(),
              ),
              CsInfoInline(
                icon: const CsIcon(icon: Icons.bolt_rounded),
                label: 'Resistencia',
                info: monitoramento.resistencia.toString(),
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
