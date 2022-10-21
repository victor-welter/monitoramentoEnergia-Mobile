import 'package:flutter/material.dart';

import '../../services/dialog_service.dart';
import '../../utils/functions_utils.dart';
import '../cs_elevated_button.dart';
import '../cs_text_form_field.dart';
import 'cs_header_content.dart';

class ContentFiltroMonitoramento extends StatefulWidget {
  const ContentFiltroMonitoramento({Key? key}) : super(key: key);

  @override
  State<ContentFiltroMonitoramento> createState() =>
      _ContentFiltroMonitoramentoState();
}

class _ContentFiltroMonitoramentoState
    extends State<ContentFiltroMonitoramento> {
  final _codigoController = TextEditingController();
  final _dataController = TextEditingController();

  /// Seleciona a Data
  Future<void> _onTapData() async {
    FocusScope.of(context).unfocus();

    DateTime? data = await getDate(
      firstDate: DateTime.now().add(const Duration(days: -365)),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(), // _filters.data,
    );

    if (data != null) {
      _dataController.text = dateFormatBR(data)!;
      // _filters.setData(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CsHeaderContent(label: 'Filtro'),

        CsTextFormField(
          label: 'Código',
          hintText: 'Informe o Código',
          controller: _codigoController,
        ),

        CsTextFormField(
          onTap: _onTapData,
          label: 'Data',
          hintText: 'Informe a Data',
          controller: _dataController,
          enabled: false,
        ),

        const SizedBox(height: 25),

        // Button Pesquisar / Voltar
        CsElevatedButton(
          label: 'Pesquisar',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
