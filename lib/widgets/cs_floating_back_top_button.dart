import 'package:flutter/material.dart';

import 'cs_floating_action_button.dart';

class CsFloatingBackTopButton extends StatefulWidget {
  const CsFloatingBackTopButton({
    required this.scrollController,
    this.child,
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController;
  final Widget? child;

  @override
  State<CsFloatingBackTopButton> createState() =>
      _CsFloatingBackTopButtonState();
}

class _CsFloatingBackTopButtonState extends State<CsFloatingBackTopButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  bool visible = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      vsync: this,
    );

    animation = CurvedAnimation(
      curve: Curves.easeInToLinear,
      reverseCurve: Curves.easeInToLinear,
      parent: controller,
    );

    widget.scrollController.addListener(_listener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_listener);

    controller.dispose();

    super.dispose();
  }

  void _listener() {
    try {
      if ((widget.scrollController.position.pixels).abs() > 150) {
        controller.forward();

        setState(() {
          visible = true;
        });
      }
      if (widget.scrollController.position.pixels < 20) {
        controller.reverse();

        Future.delayed(const Duration(milliseconds: 500), () {
          visible = false;
          setState(() {});
        });
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: ScaleTransition(
        scale: animation,
        child: CsFloatingActionButton(
          child: widget.child,
          heroTag: animation,
          tooltip: 'Voltar ao topo',
          onPressed: () {
            widget.scrollController.animateTo(
              0,
              duration: const Duration(seconds: 1, milliseconds: 500),
              curve: Curves.linear,
            );
          },
        ),
      ),
    );
  }
}
