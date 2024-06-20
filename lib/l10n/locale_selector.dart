import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_selector.g.dart';

@Riverpod(keepAlive: true)
class LocaleSelector extends _$LocaleSelector {
  @override
  Locale build() {
    return const Locale('en');
  }

  void setLocale(Locale Function(Locale locale) localeSetter) {
    state = localeSetter.call(state);
  }

  void clearLocale() {
    state = const Locale('en');
  }
}
