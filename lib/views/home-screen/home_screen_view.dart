import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/assets/assets_path.dart';
import '../../constants/constants.dart';
import '../../controllers/monitoramento/monitoramento_controller.dart';
import '../../models/monitoramento/monitoramento_model.dart';
import '../../services/dialog_service.dart';
import '../../services/service_locator.dart';
import '../../stores/filtros/filtros_store.dart';
import '../../widgets/cards/card_monitoramento.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_circular_progress_indicador.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_floating_back_top_button.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/dialog-content/content_filtro_monitoramento.dart';
import '../../widgets/menu/cs_drawer.dart';
import '../../widgets/nenhuma_informacao.dart';
import 'home_screen_state.dart';

final _stateView = HomeScreenState();

final _scrollController = ScrollController();

Future<void> _searchMonitoramentos() async {
  try {
    if (_stateView.loading) {
      return;
    }

    _stateView
      ..setLoading(value: true)
      ..setHasError(value: false);

    if (_stateView.useFilter) {
      _stateView.setPage(page: 0);
      _stateView.setFinishLoading(value: false);
      _stateView.monitoramentos.clear();
    }

    List monitoramentos = await MonitoramentoController.searchMonitoramentos(
      page: _stateView.page,
    );

    if (monitoramentos.isEmpty) {
      _stateView.setFinishLoading(value: true);
    } else {
      _stateView.monitoramentos
          .addAll(monitoramentos as List<MonitoramentoModel>);
    }

    _stateView.setUseFilter(value: false);

    _stateView.incPage();
  } catch (_) {
    _stateView.setHasError(value: true);
  } finally {
    _stateView.setLoading(value: false);
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      drawer: const CsDrawer(),
      appBar: CsAppBar(
        title: App.NAME,
        actions: [
          CsIconButton(
            child: CsIcon(
              color: theme.backgroundColor,
              icon: Icons.search_rounded,
            ),
            onPressed: () async => await openDialogWithContent(
              content: ContentFiltroMonitoramento(
                onSearch: () {
                  _stateView.setUseFilter(value: true);
                  _stateView.isUsedFilter();

                  _searchMonitoramentos();
                },
              ),
              icon: Icons.search_rounded,
            ),
          )
        ],
      ),
      floatingActionButton: CsFloatingBackTopButton(
        scrollController: _scrollController,
        child: CsIcon(
          icon: Icons.arrow_upward_rounded,
          color: theme.scaffoldBackgroundColor,
        ),
      ),
      body: const _HomeScreenBody(),
    );
  }
}

class _HomeScreenBody extends StatefulWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<_HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<_HomeScreenBody> {
  final _filters = getIt<FiltrosStore>().monitoramento;

  @override
  void initState() {
    super.initState();

    _searchMonitoramentos();
    _scrollController.addListener(_listenerScrollController);
  }

  @override
  void dispose() {
    _stateView.resetState();
    _filters.resetFiltros();
    _scrollController.removeListener(_listenerScrollController);

    super.dispose();
  }

  /// Listener utilizado para paginação
  void _listenerScrollController() {
    try {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (!_stateView.loading && !_stateView.finishLoading) {
          _searchMonitoramentos();
        }
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_stateView.loading && _stateView.monitoramentos.isEmpty) {
        return const CsCircularProgressIndicador.light();
      }

      if (_stateView.hasError) {
        return const NenhumaInformacao(
          message:
              'Aconteceu um erro inesperado. Por favor, tente novamente ou entre em contato com a equipe responsável.',
          imagePath: AssetsPath.NO_DATA,
        );
      }

      if (_stateView.monitoramentos.isEmpty && !_stateView.loading) {
        if (_stateView.usedFilter) {
          return NenhumaInformacao(
            imagePath: AssetsPath.SEARCH,
            message: 'Nenhum setor encontrado',
            actions: [
              CsElevatedButton(
                height: 35,
                label: 'Limpar filtros',
                onPressed: () {
                  _filters.resetFiltros();
                  _searchMonitoramentos();
                },
              ),
            ],
          );
        }

        return const NenhumaInformacao(
          imagePath: AssetsPath.DOCUMENTS,
          message: 'Nenhum setor encontrado',
        );
      }

      return Scrollbar(
        radius: const Radius.circular(50),
        child: ListView.builder(
          controller: _scrollController,
          itemCount:
              _stateView.monitoramentos.length + (_stateView.loading ? 1 : 0),
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(0),
          itemBuilder: (_, index) {
            if (index < _stateView.monitoramentos.length) {
              final monitoramento = _stateView.monitoramentos[index];

              return CardMonitoramento(
                monitoramento: monitoramento,
              );
            }

            return const CsCircularProgressIndicador.light();
          },
        ),
      );
    });
  }
}
