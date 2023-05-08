import 'package:d2_remote/core/common/exception/exception.dart';
import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/core/maintenance/d2_error_code.dart';
import 'package:dartlin/control_flow.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../../main/l10n/app_localizations.dart';

part 'd2_error_utils.g.dart';

@riverpod
D2ErrorUtils d2ErrorUtils(D2ErrorUtilsRef ref) {
  return const D2ErrorUtils();
}

class D2ErrorUtils {
  const D2ErrorUtils();

  String getErrorMessage(Exception exception) {
    return when(true, {
      exception is ThrowableException: () => when(true, {
            (exception as ThrowableException).cause is D2Error: () =>
                _handleD2Error(exception.cause as D2Error?),
            exception is D2Error: () => _handleD2Error(exception as D2Error)
          }),
    }).orElse(() => exception.toString());
  }

  String _handleD2Error(D2Error? d2Error) {
    final AppLocalization localization = navigatorKey.localization;

    return when(d2Error?.errorCode, {
      D2ErrorCode.LOGIN_PASSWORD_NULL: () =>
          localization.lookup('login_error_null_pass'),
      D2ErrorCode.LOGIN_USERNAME_NULL: () =>
          localization.lookup('login_error_null_username'),
      // D2ErrorCode.INVALID_DHIS_VERSION:
      // () => String.format(
      // localization.lookup('login_error_dhis_version_v2),
      // TextUtils.join(", ", DHISVersion.allowedVersionsAsStr()))
      D2ErrorCode.API_UNSUCCESSFUL_RESPONSE: () =>
          localization.lookup('login_error_unsuccessful_response'),
      D2ErrorCode.API_RESPONSE_PROCESS_ERROR: () =>
          localization.lookup('login_error_error_response'),
      D2ErrorCode.NO_DHIS2_SERVER: () =>
          localization.lookup('login_error_no_am_instance'),
      D2ErrorCode.BAD_CREDENTIALS: () =>
          localization.lookup('login_error_bad_credentials'),
      D2ErrorCode.UNKNOWN_HOST: () =>
          localization.lookup('login_error_unknown_host'),
      D2ErrorCode.UNEXPECTED: () => localization.lookup('error_unexpected'),
      D2ErrorCode.TOO_MANY_ORG_UNITS: () =>
          localization.lookup('error_too_manu_org_units'),
      D2ErrorCode.MAX_TEI_COUNT_REACHED: () =>
          localization.lookup('error_max_tei_count_reached'),
      D2ErrorCode.TOO_MANY_REQUESTS: () =>
          localization.lookup('error_many_requests'),
      D2ErrorCode.ALREADY_AUTHENTICATED: () =>
          localization.lookup('error_already_authenticated'),
      D2ErrorCode.ALREADY_EXECUTED: () =>
          localization.lookup('error_already_executed'),
      D2ErrorCode.API_INVALID_QUERY: () =>
          localization.lookup('error_api_invalid_query'),
      D2ErrorCode.APP_NAME_NOT_SET: () =>
          localization.lookup('error_app_name_not_set'),
      D2ErrorCode.APP_VERSION_NOT_SET: () =>
          localization.lookup('error_app_version_not_set'),
      D2ErrorCode.CANT_ACCESS_KEYSTORE: () =>
          localization.lookup('error_access_keystore'),
      D2ErrorCode.CANT_CREATE_EXISTING_OBJECT: () =>
          localization.lookup('error_create_existing_error'),
      D2ErrorCode.CANT_DELETE_NON_EXISTING_OBJECT: () =>
          localization.lookup('error_delete_non_existing_object'),
      D2ErrorCode.CANT_INSTANTIATE_KEYSTORE: () =>
          localization.lookup('error_instance_keystore'),
      D2ErrorCode.COULD_NOT_RESERVE_VALUE_ON_SERVER: () =>
          localization.lookup('error_reserve_value_on_server'),
      D2ErrorCode.DATABASE_EXPORT_LOGIN_FIRST: () =>
          localization.lookup('error_export_login'),
      D2ErrorCode.DATABASE_EXPORT_ENCRYPTED_NOT_SUPPORTED: () =>
          localization.lookup('error_export_encrypted'),
      D2ErrorCode.DATABASE_IMPORT_ALREADY_EXISTS: () =>
          localization.lookup('error_import_exist'),
      D2ErrorCode.DATABASE_IMPORT_LOGOUT_FIRST: () =>
          localization.lookup('error_import_logout'),
      D2ErrorCode.DATABASE_IMPORT_VERSION_HIGHER_THAN_SUPPORTED: () =>
          localization.lookup('error_import_version'),
      D2ErrorCode.FILE_NOT_FOUND: () =>
          localization.lookup('error_file_not_found'),
      D2ErrorCode.FAIL_RESIZING_IMAGE: () =>
          localization.lookup('error_file_resize'),
      D2ErrorCode.IMPOSSIBLE_TO_GENERATE_COORDINATES: () =>
          localization.lookup('error_generate_coordinate'),
      D2ErrorCode.JOB_REPORT_NOT_AVAILABLE: () =>
          localization.lookup('error_job'),
      D2ErrorCode.MIGHT_BE_RUNNING_LOW_ON_AVAILABLE_VALUES: () =>
          localization.lookup('error_low_on_available_values'),
      D2ErrorCode.NO_AUTHENTICATED_USER: () =>
          localization.lookup('error_user_no_authenticated'),
      D2ErrorCode.NO_AUTHENTICATED_USER_OFFLINE: () =>
          localization.lookup('error_user_no_authenticated_offline'),
      D2ErrorCode.NOT_ENOUGH_VALUES_LEFT_TO_RESERVE_ON_SERVER: () =>
          localization.lookup('error_no_values_left_on_server'),
      D2ErrorCode.DIFFERENT_AUTHENTICATED_USER_OFFLINE: () =>
          localization.lookup('error_different_offline_user'),
      D2ErrorCode.INVALID_GEOMETRY_VALUE: () =>
          localization.lookup('error_invalid_geometry'),
      D2ErrorCode.NO_RESERVED_VALUES: () =>
          localization.lookup('error_no_reserved_values'),
      D2ErrorCode.OBJECT_CANT_BE_UPDATED: () =>
          localization.lookup('error_object_update'),
      D2ErrorCode.OBJECT_CANT_BE_INSERTED: () =>
          localization.lookup('error_object_insert'),
      D2ErrorCode.OWNERSHIP_ACCESS_DENIED: () =>
          localization.lookup('error_ownership_access'),
      D2ErrorCode.SEARCH_GRID_PARSE: () =>
          localization.lookup('online_search_parsing_error'),
      D2ErrorCode.SERVER_URL_NULL: () => localization.lookup('error_null_url'),
      D2ErrorCode.SERVER_URL_MALFORMED: () =>
          localization.lookup('error_server_malformed'),
      D2ErrorCode.SETTINGS_APP_NOT_SUPPORTED: () =>
          localization.lookup('error_settings_app_not_supported'),
      D2ErrorCode.SETTINGS_APP_NOT_INSTALLED: () =>
          localization.lookup('error_settings_app_not_intalled'),
      D2ErrorCode.SOCKET_TIMEOUT: () =>
          localization.lookup('error_socket_timeout'),
      D2ErrorCode.RELATIONSHIPS_CANT_BE_UPDATED: () =>
          localization.lookup('error_relationship_updated'),
      D2ErrorCode.TOO_MANY_PERIODS: () =>
          localization.lookup('error_too_many_periods'),
      D2ErrorCode.URL_NOT_FOUND: () =>
          localization.lookup('error_url_not_found'),
      D2ErrorCode.USER_ACCOUNT_DISABLED: () =>
          localization.lookup('error_account_disabled'),
      D2ErrorCode.USER_ACCOUNT_LOCKED: () =>
          localization.lookup('error_account_locked'),
      D2ErrorCode.VALUE_CANT_BE_SET: () =>
          localization.lookup('error_set_value'),
      D2ErrorCode.VALUES_RESERVATION_TOOK_TOO_LONG: () =>
          localization.lookup('error_value_reservation_time'),
      D2ErrorCode.SSL_ERROR: () => localization.lookup('error_ssl'),
      D2ErrorCode.SMS_NOT_SUPPORTED: () =>
          localization.lookup('error_sms_not_supported'),
      D2ErrorCode.MIN_SEARCH_ATTRIBUTES_REQUIRED: () =>
          localization.lookup('error_min_attributes'),
      D2ErrorCode.ORGUNIT_NOT_IN_SEARCH_SCOPE: () =>
          localization.lookup('error_org_unit_scope'),
      D2ErrorCode.INVALID_CHARACTERS: () =>
          localization.lookup('error_invalid_characters'),
      D2ErrorCode.PROGRAM_ACCESS_CLOSED: () =>
          'TODO("Implement for ANDROAPP-657")'
    }).orElse(() => localization.lookup('not_mapped_error'));
  }
}
