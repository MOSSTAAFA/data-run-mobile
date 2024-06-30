// import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// @riverpod
// class FormStateNotifier extends _$FormStateNotifier {
//   @override
//   FocusNotifier build() async {
//     return FocusNotifier();
//   }
// }
//
// class FocusNotifier with ChangeNotifier {
//   final Map<String, FocusNode> _focusNodes = {};
//
//   void addFocusNode(String key, FocusNode focusNode) {
//     _focusNodes[key] = focusNode;
//     focusNode.addListener(() {
//       if (!focusNode.hasFocus) {
//         notifyListeners();
//       }
//     });
//   }
//
//   FocusNode? getFocusNode(String key) => _focusNodes[key];
//
//   void dispose() {
//     _focusNodes.values.forEach((node) => node.dispose());
//     _focusNodes.clear();
//   }
// }
