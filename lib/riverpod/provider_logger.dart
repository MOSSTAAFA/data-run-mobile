import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commons/extensions/dynamic_extensions.dart';

class ProviderLogger extends ProviderObserver {
  ProviderLogger({required this.providersNameToLog});

  final IList<String> providersNameToLog;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (providersNameToLog.isEmpty) {
      provider.name != null
          ? logInfo(
              info: 'didAddProvider, NAME: ${provider.name}, VALUE: $value')
          : logInfo(
              info:
                  'didAddProvider, TYPE: ${provider.runtimeType}, VALUE: $value');
    } else {
      if (providersNameToLog.contains(provider.name)) {
        provider.name != null
            ? logInfo(info: 'didAddProvider, VALUE: $value')
            : logInfo(
                info:
                    'didAddProvider, TYPE: ${provider.runtimeType}, VALUE: $value');
      }
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (providersNameToLog.isEmpty) {
      provider.name != null
          ? logInfo(info: 'didUpdateProvider, newValue: $newValue')
          : logInfo(
              info:
                  'didUpdateProvider, TYPE: ${provider.runtimeType}, newValue: $newValue');
    } else {
      if (providersNameToLog.contains(provider.name)) {
        provider.name != null
            ? logInfo(info: 'didUpdateProvider, newValue: $newValue')
            : logInfo(
                info:
                    'didUpdateProvider, TYPE: ${provider.runtimeType}, newValue: $newValue');
      }
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    if (providersNameToLog.isEmpty) {
      provider.name != null
          ? logInfo(info: 'NAME: ${provider.name}, didDisposeProvider')
          : logInfo(info: 'TYPE: ${provider.runtimeType}, didDisposeProvider');
    } else {
      if (providersNameToLog.contains(provider.name)) {
        provider.name != null
            ? logInfo(info: 'NAME: ${provider.name}, didDisposeProvider')
            : logInfo(
                info: 'TYPE: ${provider.runtimeType}, didDisposeProvider');
      }
    }
  }
}
