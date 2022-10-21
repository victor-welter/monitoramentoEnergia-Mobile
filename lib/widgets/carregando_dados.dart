import 'package:flutter/material.dart';

import 'cs_circular_progress_indicador.dart';

class CarregandoDados extends StatelessWidget {
  ///[Widget] default para indicar que dados assíncronos estão sendo carregados
  const CarregandoDados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CsCircularProgressIndicador.light(),
        Text(
          'Aguarde, carregando',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: theme.colorScheme.secondary,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
