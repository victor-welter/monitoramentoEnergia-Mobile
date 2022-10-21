import 'package:flutter/material.dart';

import 'cs_header_content.dart';

class CsAlertDialog extends StatelessWidget {
  const CsAlertDialog({
    required this.title,
    required this.description,
    this.actions,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: double.maxFinite,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CsHeaderContent(label: title),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    );
  }
}