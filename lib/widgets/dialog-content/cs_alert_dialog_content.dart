import 'package:flutter/material.dart';

import '../cs_icon.dart';

class CsAlertDialogContent extends StatelessWidget {
  ///Widget utilizado para exibir um [AlertDialog] com o seu conteúdo totalmente personalizado
  const CsAlertDialogContent({
    required this.content,
    required this.icon,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final Widget content;
  final IconData icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return AlertDialog(
      // Dados obrigatórios
      content: SizedBox(
        width: double.maxFinite,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            content,
            Positioned(
              top: -45,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: CsIcon(
                  icon: icon,
                  color: theme.backgroundColor,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),

      // Default
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    );
  }
}
