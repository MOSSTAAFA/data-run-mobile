import 'dart:convert';

import 'package:flutter/material.dart';

enum OUSelectionType { CAPTURE, SEARCH }

class OrgUnitSelectorDialog extends StatelessWidget {
  const OrgUnitSelectorDialog(
      {super.key,
      required this.textChangedConsumer,
      required this.onDialogCancelled,
      required this.onClear});

  final void Function(String, String) textChangedConsumer;
  final void Function() onDialogCancelled;
  final void Function() onClear;

  @override
  Widget build(BuildContext context) {

    return Container();
  }
}
