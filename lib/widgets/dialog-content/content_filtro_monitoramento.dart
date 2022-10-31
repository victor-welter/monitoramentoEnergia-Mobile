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
  final _dataInicialController = TextEditingController();
  final _dataFinalController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _setFilters();
  }

  void _setFilters() {
    _codigoOrigemController.text = _filters.codigoOrigem ?? '';
    _dataInicialController.text = dateFormatBR(_filters.dataInicial) ?? '';
    _dataFinalController.text = dateFormatBR(_filters.dataFinal) ?? '';
  }

  Widget? _limpaDataInicial() {
    return Observer(
      builder: (_) {
        if (_filters.dataInicial == null) {
          return const SizedBox();
        }

        return CsIconButton(
          child: CsIcon(
            icon: Icons.close_rounded,
            color: Theme.of(getIt<BuildContext>()).colorScheme.primaryContainer,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();

            _filters.setDataInicial(null);
            _dataInicialController.clear();

            widget.onSearch!();
          },
        );
      },
    );
  }

  Widget? _limpaDataFinal() {
    return Observer(
      builder: (_) {
        if (_filters.dataFinal == null) {
          return const SizedBox();
        }

        return CsIconButton(
          child: CsIcon(
            icon: Icons.close_rounded,
            color: Theme.of(getIt<BuildContext>()).colorScheme.primaryContainer,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();

            _filters.setDataFinal(null);
            _dataFinalController.clear();

            widget.onSearch!();
          },
        );
      },
    );
  }

  /// Seleciona a Data
  Future<void> _onTapDataInicial() async {
    FocusScope.of(context).unfocus();

    DateTime? data = await getDate(
      firstDate: DateTime.now().add(const Duration(days: -365)),
      lastDate: DateTime.now(),
      initialDate: _filters.dataInicial,
    );

    if (data != null) {
      _dataInicialController.text = dateFormatBR(data)!;
      _filters.setDataInicial(data);

      widget.onSearch!();
    }
  }

  /// Seleciona a Data Final
  Future<void> _onTapDataFinal() async {
    FocusScope.of(context).unfocus();

    DateTime? data = await getDate(
      firstDate: DateTime.now().add(const Duration(days: -365)),
      lastDate: DateTime.now(),
      initialDate: _filters.dataFinal,
    );

    if (data != null) {
      _dataFinalController.text = dateFormatBR(data)!;
      _filters.setDataFinal(data);

      widget.onSearch!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CsHeaderContent(label: 'Filtro'),

        CsTextFormField(
          onTap: _onTapDataInicial,
          label: 'Data Inicial',
          hintText: 'Selecione a data inicial',
          controller: _dataInicialController,
          enabled: false,
          suffixIcon: _limpaDataInicial(),
        ),

        CsTextFormField(
          onTap: _onTapDataFinal,
          label: 'Data Final',
          hintText: 'Selecione a data final',
          controller: _dataFinalController,
          enabled: false,
          suffixIcon: _limpaDataFinal(),
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
