import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NenhumaInformacao extends StatelessWidget {
  ///Recebe uma `message` e uma `imagePath` e exibe de forma centralizada na tela
  ///
  ///Utilizada para exibir avisos ao usuário
  const NenhumaInformacao({
    required this.message,
    this.imagePath,
    this.actions,
    Key? key,
  }) : super(key: key);

  final String message;
  final String? imagePath;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null) ...[
              SvgPicture.asset(
                imagePath!,
                fit: BoxFit.scaleDown,
                width: 250,
                height: 250,
              ),
            ],
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),
            ),
            if (actions != null) ...[
              const SizedBox(height: 20),
              Column(
                children: actions!,
              )
            ],
          ],
        ),
      ),
    );
  }
}
