import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../l10n/app_localizations.dart';

class SelectableError extends StatelessWidget {
  const SelectableError({super.key, this.errorMessage = ''});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!.localized!;
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: SelectableText(
              errorMessage,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.content_copy),
              tooltip: localization.copyError,
              onPressed: () {
                Clipboard.setData(ClipboardData(text: errorMessage));
              }),
        ],
      ),
    );
  }
}
