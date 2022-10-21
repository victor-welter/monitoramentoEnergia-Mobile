import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../cs_elevated_button.dart';
import '../cs_icon.dart';
import '../cs_info_inline.dart';
import 'cs_header_content.dart';

class ContentSobreApp extends StatelessWidget {
  const ContentSobreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CsHeaderContent(label: 'Sobre'),

        // Versão
        const CsInfoInline(
          isColumn: false,
          label: 'Versão',
          info: App.VERSION,
          icon: CsIcon(icon: Icons.timeline_rounded),
        ),

        const SizedBox(height: 5),

        // Data Atualização
        const CsInfoInline(
          isColumn: false,
          label: 'Atualização',
          info: App.DATA_ATUALIZACAO,
          icon: CsIcon(icon: Icons.calendar_today_rounded),
        ),

        const SizedBox(height: 5),

        // Desenvolvedora
        const CsInfoInline(
          label: 'Desenvolvedor',
          info: App.DESENVOLVEDOR,
          icon: CsIcon(icon: Icons.person),
        ),

        const SizedBox(height: 20),

        // Button Pesquisar / Voltar
        CsElevatedButton(
          label: 'OK',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
