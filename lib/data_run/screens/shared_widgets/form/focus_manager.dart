// FocusManager.dart

import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_manager.g.dart';

@riverpod
FocusManager focusManager(FocusManagerRef ref) {
  return FocusManager();
}

class FocusManager {
  final List<FocusNode> _focusNodes = [];

  FocusNode getFocusNode(int fieldIndex) {
    if (_focusNodes.length <= fieldIndex) {
      _focusNodes.add(FocusNode());
    }
    return _focusNodes[fieldIndex];
  }

  void addFocusListener(int fieldIndex, QFieldModel fieldModel) {
    final focusNode = getFocusNode(fieldIndex);
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        // Focus lost, update field and submit intent
        // fieldModel.onTextChange(fieldModel.value);
        debugPrint('### dispose ${FormIntent.onFocus(fieldModel.uid, fieldModel.value)}');
        fieldModel
            .invokeIntent(FormIntent.onFocus(fieldModel.uid, fieldModel.value));
      }
    });
  }

  void dispose() {
    debugPrint('### dispose $runtimeType');
    for (final focusNode in _focusNodes) {
      debugPrint('### dispose $focusNode');
      focusNode.dispose();
    }
  }
}
