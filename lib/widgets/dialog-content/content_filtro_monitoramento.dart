import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../services/dialog_service.dart';
import '../../services/service_locator.dart';
import '../../stores/filtros/filtros_store.dart';
import '../../utils/functions_utils.dart';
import '../cs_elevated_button.dart';
import '../cs_icon.dart';
import '../cs_icon_button.dart';
import '../cs_text_form_field.dart';
import 'cs_header_content.dart';

class ContentFiltroMonitoramento extends StatefulWidget {
  const ContentFiltroMonitoramento({
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onSearch;

  @override
  State<ContentFiltroMonitoramento> createState() =>
      _ContentFiltroMonitoramentoState();
}

class _ContentFiltroMonitoramentoState
    extends State<ContentFiltroMonitoramento> {
  final _filters = getIt<FiltrosStore>().monitoramento;

  final _codigoOrigemController = TextEditingController();
  final _dataController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _setFilters();
  }

  void _setFilters() {
    _codigoOrigemController.text = _filters.codigoOrigem ?? '';
    _dataController.text = dateFormatBR(_filters.data) ?? '';
  }

  // Widget? _limpaCodigoOrigem() {
  //   return Observer(
  //     builder: (_) {
  //       if (_filters.codigoOrigem == null || _filters.codigoOrigem!.isEmpty) {
  //         return const SizedBox();
  //       }

  //       return CsIconButton(
  //         child: CsIcon(
  //           icon: Icons.close_rounded,
  //           color: Theme.of(getIt<BuildContext>()).colorScheme.primaryContainer,
  //         ),
  //         onPressed: () {
  //           FocusScope.of(context).unfocus();

  //           _filters.setCodigoOrigem(null);
  //           _codigoOrigemController.clear();

  //           widget.onSearch!();
  //         },
  //       );
  //     },
  //   );
  // }

  Widget? _limpaData() {
    return Observer(
      builder: (_) {
        if (_filters.data == null) {
          return const SizedBox();
        }

        return CsIconButton(
          child: CsIcon(
            icon: Icons.close_rounded,
            color: Theme.of(getIt<BuildContext>()).colorScheme.primaryContainer,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();

            _filters.setData(DateTime.now());
            _dataController.text = dateFormatBR(_filters.data)!;

            widget.onSearch!();
          },
        );
      },
    );
  }

  /// Seleciona a Data
  Future<void> _onTapData() async {
    FocusScope.of(context).unfocus();

    DateTime? data = await getDate(
      firstDate: DateTime.now().add(const Duration(days: -365)),
      lastDate: DateTime.now(),
      initialDate: _filters.data,
    );

    if (data != null) {
      _dataController.text = dateFormatBR(data)!;
      _filters.setData(data);

      widget.onSearch!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CsHeaderContent(label: 'Filtro'),

        // CsTextFormField(
        //   label: 'Código',
        //   hintText: 'Informe o Código',
        //   onChanged: (codigoOrigem) {
        //     _filters.setCodigoOrigem(codigoOrigem);

        //     widget.onSearch!();
        //   },
        //   controller: _codigoOrigemController,
        //   suffixIcon: _limpaCodigoOrigem(),
        // ),

        CsTextFormField(
          onTap: _onTapData,
          label: 'Data',
          hintText: 'Informe a Data',
          controller: _dataController,
          enabled: false,
          suffixIcon: _limpaData(),
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
