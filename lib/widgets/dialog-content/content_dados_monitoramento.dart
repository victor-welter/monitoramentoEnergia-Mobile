import 'package:flutter/material.dart';

import '../../models/monitoramento/monitoramento_model.dart';
import '../../utils/functions_utils.dart';
import '../../utils/string_format_utils.dart';
import '../cs_elevated_button.dart';
import '../cs_icon.dart';
import '../cs_info_inline.dart';
import 'cs_header_content.dart';

class ContentDadosMonitoramento extends StatelessWidget {
  const ContentDadosMonitoramento({
    required this.monitoramento,
    Key? key,
  }) : super(key: key);

  final MonitoramentoModel monitoramento;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CsHeaderContent(label: 'Dados'),

        CsInfoInline(
          icon: const CsIcon(icon: Icons.calendar_today_rounded),
          label: 'Data',
          info: dateFormatBR(monitoramento.dataMonitoramento),
        ),

        CsInfoInline(
          icon: const CsIcon(icon: Icons.access_time_rounded),
          label: 'Horário',
          info: monitoramento.horarioMonitoramento,
        ),

        CsInfoInline(
          icon: const CsIcon(icon: Icons.bolt_rounded),
          label: 'Voltagem',
          info: valorNull(formatQuantidade(monitoramento.voltagem)),
        ),

        CsInfoInline(
          icon: const CsIcon(icon: Icons.bolt_rounded),
          label: 'Amperagem',
          info: valorNull(formatQuantidade(monitoramento.amperagem)),
        ),

        CsInfoInline(
          icon: const CsIcon(icon: Icons.bolt_rounded),
          label: 'resistência',
          info: valorNull(formatQuantidade(monitoramento.resistencia)),
        ),

        CsInfoInline(
          icon: const CsIcon(icon: Icons.attach_money_rounded),
          label: 'Custo',
          info: valorNull(formatValoresMonetarios(monitoramento.custoMonitoramento)),
        ),

        const SizedBox(height: 20),

        // Button Voltar
        CsElevatedButton(
          label: 'Voltar',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
