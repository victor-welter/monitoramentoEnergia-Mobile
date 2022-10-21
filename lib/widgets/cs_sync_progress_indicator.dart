import 'package:flutter/material.dart';

import '../services/service_locator.dart';

class CsSyncProgressIndicator extends StatefulWidget {
  CsSyncProgressIndicator.success({
    required this.value,
    required this.message,
    required this.progress,
    required this.totalProgress,
    Key? key,
  })  : color = Theme.of(getIt<BuildContext>()).primaryColor,
        super(key: key);

  CsSyncProgressIndicator.error({
    required this.value,
    required this.message,
    required this.progress,
    required this.totalProgress,
    Key? key,
  })  : color = Theme.of(getIt<BuildContext>()).errorColor,
        super(key: key);

  final double value;
  final String message;
  final int progress;
  final int totalProgress;
  final Color color;

  @override
  State<CsSyncProgressIndicator> createState() =>
      _CsSyncProgressIndicatorState();
}

class _CsSyncProgressIndicatorState extends State<CsSyncProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LinearProgressIndicator(
          value: widget.value,
          color: theme.primaryColor,
          backgroundColor: Colors.grey[100],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Text(
                '${widget.message}',
                style: TextStyle(
                  color: theme.colorScheme.primaryContainer,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              '(${widget.progress}/${widget.totalProgress})',
              style: TextStyle(
                color: theme.colorScheme.primaryContainer,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
