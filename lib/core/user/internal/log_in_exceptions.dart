import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/core/maintenance/d2_error_code.dart';
import 'package:d2_remote/core/maintenance/d2_error_component.dart';
import 'package:d2_remote/d2_remote.dart';

import '../../../commons/extensions/string_extension.dart';

// class LogInExceptions {
void throwExceptionIfUsernameNull(String? username) {
  if (username.isNullOrEmpty) {
    throw const D2Error(
        errorCode: D2ErrorCode.LOGIN_USERNAME_NULL,
        errorDescription: 'Username is null',
        errorComponent: D2ErrorComponent.SDK);
  }
}

void throwExceptionIfPasswordNull(String? password) {
  if (password.isNullOrEmpty) {
    throw const D2Error(
        errorCode: D2ErrorCode.LOGIN_PASSWORD_NULL,
        errorDescription: 'Password is null',
        errorComponent: D2ErrorComponent.SDK);
  }
}

Future<void> throwExceptionIfAlreadyAuthenticated(String? username) async {
  final authenticated = await D2Remote.isAuthenticated();
  if (authenticated) {
    throw D2Error(
        errorCode: D2ErrorCode.ALREADY_AUTHENTICATED,
        errorDescription: 'A user is already authenticated: $username',
        errorComponent: D2ErrorComponent.SDK);
  }
}

D2Error noDHIS2Server() {
  return const D2Error(
      errorCode: D2ErrorCode.NO_DHIS2_SERVER,
      errorDescription: 'The URL is no Compatible server',
      errorComponent: D2ErrorComponent.SDK);
}

D2Error noUserOfflineError() {
  return const D2Error(
      errorCode: D2ErrorCode.NO_AUTHENTICATED_USER_OFFLINE,
      errorDescription:
          "The user hasn't been previously authenticated. Cannot login offline.",
      errorComponent: D2ErrorComponent.SDK);
}

D2Error badCredentialsError() {
  return const D2Error(
      errorCode: D2ErrorCode.BAD_CREDENTIALS,
      errorDescription:
          'Credentials do not match authenticated user. Cannot login offline.',
      errorComponent: D2ErrorComponent.SDK);
}

D2Error serverError() {
  return const D2Error(
      errorCode: D2ErrorCode.SERVER_ERROR,
      errorDescription: 'Server Error.',
      errorComponent: D2ErrorComponent.SDK);
}
// }
