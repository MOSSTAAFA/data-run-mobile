import 'package:d2_remote/d2_remote.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/errors_management/error_management.dart';

// class LogInExceptions {
void throwExceptionIfUsernameNull(String? username) {
  if (username.isNullOrEmpty) {
    throw const DError(
        errorCode: DErrorCode.LOGIN_USERNAME_NULL,
        errorDescription: 'Username is null',
        errorComponent: DErrorComponent.SDK);
  }
}

void throwExceptionIfPasswordNull(String? password) {
  if (password.isNullOrEmpty) {
    throw const DError(
        errorCode: DErrorCode.LOGIN_PASSWORD_NULL,
        errorDescription: 'Password is null',
        errorComponent: DErrorComponent.SDK);
  }
}

Future<void> throwExceptionIfAlreadyAuthenticated(String? username) async {
  final authenticated = await D2Remote.isAuthenticated();
  if (authenticated) {
    throw DError(
        errorCode: DErrorCode.ALREADY_AUTHENTICATED,
        errorDescription: 'A user is already authenticated: $username',
        errorComponent: DErrorComponent.SDK);
  }
}

DError noUserOfflineError() {
  return const DError(
      errorCode: DErrorCode.NO_AUTHENTICATED_USER_OFFLINE,
      errorDescription:
          "The user hasn't been previously authenticated. Cannot login offline.",
      errorComponent: DErrorComponent.SDK);
}

DError badCredentialsError() {
  return const DError(
      errorCode: DErrorCode.BAD_CREDENTIALS,
      errorDescription:
          'Credentials do not match authenticated user. Cannot login offline.',
      errorComponent: DErrorComponent.SDK);
}

DError serverError() {
  return const DError(
      errorCode: DErrorCode.UNEXPECTED,
      errorDescription: 'Server Error.',
      errorComponent: DErrorComponent.SDK);
}
// }
