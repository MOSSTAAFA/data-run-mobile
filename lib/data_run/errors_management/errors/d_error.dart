import 'package:datarun/data_run/errors_management/errors/d_error_code.dart';
import 'package:datarun/data_run/errors_management/errors/d_exception.dart';

class DError implements DException {
  const DError(
      {this.url,
      this.errorComponent,
      required this.errorCode,
      required this.errorDescription,
      this.httpErrorCode,
      this.originalException,
      this.created,
      this.stackTrace,
      this.shouldShowMessage = true});

  final String? url;
  final DErrorComponent? errorComponent;
  final DErrorCode errorCode;
  final String errorDescription;
  final int? httpErrorCode;
  final Object? originalException;
  final DateTime? created;
  final StackTrace? stackTrace;
  final bool shouldShowMessage;

  bool isOffline() {
    return errorCode == DErrorCode.SOCKET_TIMEOUT ||
        errorCode == DErrorCode.UNKNOWN_HOST;
  }

  @override
  String get message => errorDescription;

  @override
  dynamic get source => originalException;

// return switch (originalException) {
//   final String s => s,
//   DException(:final message, :final source) => source,
//   _ => originalException,
// };
//
// originalException != null ? originalException is DException
//     ? DException(originalException.message, originalException)
//     : null;
// }
}
