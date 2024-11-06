import 'package:datarun/data_run/errors_management/d_error_handler_service.dart';
import 'package:datarun/data_run/errors_management/d_error_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'd_error_handler_service.dart';
export 'd_error_localization.dart';
export 'error_handling_observer.dart';
export 'errors/d_error.dart';
export 'errors/d_error_code.dart';
export 'errors/d_exception.dart';

part 'error_management.g.dart';

@riverpod
DErrorLocalization dErrorLocalization(DErrorLocalizationRef ref) {
  return const DErrorLocalization();
}

@riverpod
DErrorHandlerService dErrorHandlerService(DErrorHandlerServiceRef ref) {
  return const DErrorHandlerService();
}
