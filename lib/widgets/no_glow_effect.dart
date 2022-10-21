import 'package:flutter/material.dart';

class NoGlowEffect extends ScrollBehavior {
  /// Widget criado para retirar o efeito de 'glowing effect' ao ter um 'overscroll' em uma lista
  const NoGlowEffect();

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
