import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commons/extensions/dynamic_extensions.dart';

class ProviderLogger extends ProviderObserver {
  ProviderLogger({required this.providerNameToLog});

  final String providerNameToLog;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (providerNameToLog.isEmpty) {
      provider.name != null
          ? logInfo(info: 'NAME: ${provider.name}, VALUE: $value, didAddProvider')
          : logInfo(info: 'TYPE: ${provider.runtimeType}, VALUE: $value, didAddProvider');
    } else if (provider.name == providerNameToLog) {
      provider.name != null
          ? logInfo(info: 'NAME: ${provider.name}, didAddProvider')
          : logInfo(info: 'TYPE: ${provider.runtimeType}, didAddProvider');
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (providerNameToLog.isEmpty) {
      provider.name != null
          ? logInfo(info: 'NAME: ${provider.name}, didUpdateProvider')
          : logInfo(info: 'TYPE: ${provider.runtimeType}, didUpdateProvider');
    } else if (provider.name == providerNameToLog) {
      provider.name != null
          ? logInfo(info: 'NAME: ${provider.name}, didUpdateProvider')
          : logInfo(info: 'TYPE: ${provider.runtimeType}, didUpdateProvider');
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    if (providerNameToLog.isEmpty) {
      provider.name != null
          ? logInfo(info: 'NAME: ${provider.name}, didDisposeProvider')
          : logInfo(info: 'TYPE: ${provider.runtimeType}, didDisposeProvider');
    } else if (provider.name == providerNameToLog) {
      provider.name != null
          ? logInfo(info: 'NAME: ${provider.name}, didDisposeProvider')
          : logInfo(info: 'TYPE: ${provider.runtimeType}, didDisposeProvider');
    }
  }
}
