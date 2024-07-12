import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/errors_management/d_error_localization.dart';

class ErrorHandlingObserver extends ProviderObserver {

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    // const DErrorMessageLocalizer().getErrorMessage(error);
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
