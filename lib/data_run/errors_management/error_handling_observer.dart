import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorHandlingObserver extends ProviderObserver {

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    // const DErrorMessageLocalizer().getErrorMessage(error);
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
