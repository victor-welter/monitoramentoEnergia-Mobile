import 'package:flutter/material.dart';

class CsCircularProgressIndicador extends StatelessWidget {
  const CsCircularProgressIndicador.light({
    this.backgroundColor = Colors.red,
    Key? key,
  }) : super(key: key);

  const CsCircularProgressIndicador.dark({
    this.backgroundColor = Colors.white,
    Key? key,
  }) : super(key: key);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
        ),
      ),
    );
  }
}
