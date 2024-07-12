import 'package:mass_pro/data_run/errors_management/error_management.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/l10n/app_localizations.dart';
import 'package:mass_pro/utils/navigator_key.dart';

class DErrorLocalization {
  const DErrorLocalization();

  String getErrorMessage(Object exception) {
    return switch (exception) {
      final DError error => _handleDError(error),
      DException(:final message, :final DError source) => _handleDError(source),
      _ => exception.toString(),
    };
  }

  String _handleDError(DError d2Error) {
    final L localization = navigatorKey.localization;

    return switch (d2Error.errorCode) {
      DErrorCode.LOGIN_PASSWORD_NULL => S.current.loginErrorNullPass,
      DErrorCode.LOGIN_USERNAME_NULL => S.current.loginErrorNullUsername,
      // DErrorCode.INVALID_DHIS_VERSION:
      // () => String.format(
      // 'login_error_dhis_version_v2,
      // TextUtils.join(", ", DHISVersion.allowedVersionsAsStr()))
      DErrorCode.API_UNSUCCESSFUL_RESPONSE =>
        S.current.loginErrorUnsuccessfulResponse,
      DErrorCode.API_RESPONSE_PROCESS_ERROR =>
        S.current.loginErrorErrorResponse,
      DErrorCode.BAD_CREDENTIALS => S.current.loginErrorBadCredentials,
      DErrorCode.UNKNOWN_HOST => S.current.loginErrorUnknownHost,
      DErrorCode.UNEXPECTED => S.current.error_unexpected,
      DErrorCode.ALREADY_AUTHENTICATED => S.current.error_already_authenticated,
      DErrorCode.APP_NAME_NOT_SET => S.current.error_app_name_not_set,
      DErrorCode.APP_VERSION_NOT_SET => S.current.error_app_version_not_set,
      DErrorCode.CANT_CREATE_EXISTING_OBJECT =>
        S.current.error_create_existing_error,
      DErrorCode.CANT_DELETE_NON_EXISTING_OBJECT =>
        S.current.error_delete_non_existing_object,
      DErrorCode.NO_AUTHENTICATED_USER => S.current.error_user_no_authenticated,
      DErrorCode.NO_AUTHENTICATED_USER_OFFLINE =>
        S.current.error_user_no_authenticated_offline,
      DErrorCode.NO_RESERVED_VALUES => S.current.error_no_reserved_values,
      DErrorCode.OBJECT_CANT_BE_UPDATED => S.current.error_object_update,
      DErrorCode.OBJECT_CANT_BE_INSERTED => S.current.error_object_insert,
      DErrorCode.SERVER_URL_NULL => S.current.error_null_url,
      DErrorCode.SERVER_URL_MALFORMED => S.current.error_server_malformed,
      DErrorCode.SOCKET_TIMEOUT => S.current.error_socket_timeout,
      DErrorCode.URL_NOT_FOUND => S.current.error_url_not_found,
      DErrorCode.USER_ACCOUNT_DISABLED => S.current.error_account_disabled,
      DErrorCode.USER_ACCOUNT_LOCKED => S.current.error_account_locked,
      DErrorCode.OBJECT_ACCESS_DENIED => S.current.objectAccessDenied,
      DErrorCode.OBJECT_ACCESS_CLOSED => S.current.objectAccessClosed,
    };
  }
}
