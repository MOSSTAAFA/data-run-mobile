import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commons/extensions/dynamic_extensions.dart';

class ProviderLogger extends ProviderObserver {
  @override
  // void didUpdateProvider(
  //   ProviderBase<Object?> provider,
  //   Object? previousValue,
  //   Object? newValue,
  //   ProviderContainer container,
  // ) {
  //   logInfo(
  //       info: 'didUpdateProvider: ${provider.name ?? provider.runtimeType}');
  // }

  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logInfo(info: 'didAddProvider: ${provider.name ?? provider.runtimeType}');
  }

  // void didDisposeProvider(
  //   ProviderBase<Object?> provider,
  //   ProviderContainer container,
  // ) {
  //   logInfo(
  //       info: 'didDisposeProvider: ${provider.name ?? provider.runtimeType}');
  // }
}
