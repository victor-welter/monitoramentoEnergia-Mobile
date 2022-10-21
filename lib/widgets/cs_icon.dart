import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CsIcon extends StatelessWidget {
  const CsIcon({
    this.icon,
    this.svgPath,
    this.size = 24,
    this.color,
    Key? key,
  })  : assert(!(icon == null && svgPath == null)),
        super(key: key);

  const CsIcon.icon({
    required this.icon,
    this.size = 24,
    this.color,
    Key? key,
  })  : svgPath = null,
        super(key: key);

  const CsIcon.svg({
    required this.svgPath,
    this.size = 30,
    this.color,
    Key? key,
  })  : icon = null,
        super(key: key);

  final String? svgPath;
  final IconData? icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final Color color = this.color ?? theme.primaryColor;

    if (svgPath != null) {
      return SvgPicture.asset(
        svgPath!,
        width: size,
        height: size,
        color: color,
      );
    }

    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
