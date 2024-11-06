import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datarun/utils/mass_utils/utils.dart';

class SelectableError extends StatelessWidget {
  const SelectableError({super.key, this.errorMessage = ''});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
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
              tooltip: L('copyError'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: errorMessage));
              }),
        ],
      ),
    );
  }
}
