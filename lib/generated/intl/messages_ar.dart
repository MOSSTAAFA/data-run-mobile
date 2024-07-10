// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("MASS PRO"),
        "error_access_keystore":
            MessageLookupByLibrary.simpleMessage("Cannot access keystore"),
        "error_account_disabled":
            MessageLookupByLibrary.simpleMessage("User account disabled"),
        "error_account_locked":
            MessageLookupByLibrary.simpleMessage("User account locked"),
        "error_already_authenticated":
            MessageLookupByLibrary.simpleMessage("User already authenticated"),
        "error_already_executed":
            MessageLookupByLibrary.simpleMessage("Action already executed"),
        "error_api_invalid_query":
            MessageLookupByLibrary.simpleMessage("Invalid API query"),
        "error_app_name_not_set":
            MessageLookupByLibrary.simpleMessage("App name not set"),
        "error_app_version_not_set":
            MessageLookupByLibrary.simpleMessage("App version not set"),
        "error_create_existing_error": MessageLookupByLibrary.simpleMessage(
            "Cannot create existing object"),
        "error_delete_non_existing_object":
            MessageLookupByLibrary.simpleMessage(
                "Cannot delete non-existing object"),
        "error_different_offline_user": MessageLookupByLibrary.simpleMessage(
            "Different authenticated user offline"),
        "error_export_encrypted": MessageLookupByLibrary.simpleMessage(
            "Encrypted export not supported"),
        "error_export_login":
            MessageLookupByLibrary.simpleMessage("Please login to export"),
        "error_file_not_found":
            MessageLookupByLibrary.simpleMessage("File not found"),
        "error_file_resize":
            MessageLookupByLibrary.simpleMessage("Failed resizing image"),
        "error_generate_coordinate": MessageLookupByLibrary.simpleMessage(
            "Impossible to generate coordinates"),
        "error_import_exist":
            MessageLookupByLibrary.simpleMessage("Import already exists"),
        "error_import_logout":
            MessageLookupByLibrary.simpleMessage("Logout before import"),
        "error_import_version": MessageLookupByLibrary.simpleMessage(
            "Import version higher than supported"),
        "error_instance_keystore":
            MessageLookupByLibrary.simpleMessage("Cannot instantiate keystore"),
        "error_invalid_characters":
            MessageLookupByLibrary.simpleMessage("Invalid characters"),
        "error_invalid_geometry":
            MessageLookupByLibrary.simpleMessage("Invalid geometry value"),
        "error_job":
            MessageLookupByLibrary.simpleMessage("Job report not available"),
        "error_low_on_available_values": MessageLookupByLibrary.simpleMessage(
            "Running low on available values"),
        "error_many_requests":
            MessageLookupByLibrary.simpleMessage("Too many requests"),
        "error_max_tei_count_reached":
            MessageLookupByLibrary.simpleMessage("Max TEI count reached"),
        "error_min_attributes": MessageLookupByLibrary.simpleMessage(
            "Minimum search attributes required"),
        "error_no_reserved_values":
            MessageLookupByLibrary.simpleMessage("No reserved values"),
        "error_no_values_left_on_server": MessageLookupByLibrary.simpleMessage(
            "Not enough values left to reserve on server"),
        "error_null_url":
            MessageLookupByLibrary.simpleMessage("Server URL cannot be null"),
        "error_object_insert":
            MessageLookupByLibrary.simpleMessage("Object cannot be inserted"),
        "error_object_update":
            MessageLookupByLibrary.simpleMessage("Object cannot be updated"),
        "error_org_unit_scope": MessageLookupByLibrary.simpleMessage(
            "Org unit not in search scope"),
        "error_ownership_access":
            MessageLookupByLibrary.simpleMessage("Ownership access denied"),
        "error_relationship_updated": MessageLookupByLibrary.simpleMessage(
            "Relationships cannot be updated"),
        "error_reserve_value_on_server": MessageLookupByLibrary.simpleMessage(
            "Could not reserve value on server"),
        "error_server_malformed":
            MessageLookupByLibrary.simpleMessage("Malformed server URL"),
        "error_set_value":
            MessageLookupByLibrary.simpleMessage("Value cannot be set"),
        "error_settings_app_not_intalled":
            MessageLookupByLibrary.simpleMessage("Settings app not installed"),
        "error_settings_app_not_supported":
            MessageLookupByLibrary.simpleMessage("Settings app not supported"),
        "error_sms_not_supported":
            MessageLookupByLibrary.simpleMessage("SMS not supported"),
        "error_socket_timeout":
            MessageLookupByLibrary.simpleMessage("Socket timeout"),
        "error_ssl": MessageLookupByLibrary.simpleMessage("SSL error"),
        "error_too_manu_org_units": MessageLookupByLibrary.simpleMessage(
            "Too many organizational units"),
        "error_too_many_periods":
            MessageLookupByLibrary.simpleMessage("Too many periods"),
        "error_unexpected": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred"),
        "error_url_not_found":
            MessageLookupByLibrary.simpleMessage("URL not found"),
        "error_user_no_authenticated":
            MessageLookupByLibrary.simpleMessage("No authenticated user"),
        "error_user_no_authenticated_offline":
            MessageLookupByLibrary.simpleMessage(
                "No authenticated user offline"),
        "error_value_reservation_time": MessageLookupByLibrary.simpleMessage(
            "Values reservation took too long"),
        "login_error_bad_credentials":
            MessageLookupByLibrary.simpleMessage("Invalid credentials"),
        "login_error_error_response":
            MessageLookupByLibrary.simpleMessage("Error processing response"),
        "login_error_no_am_instance":
            MessageLookupByLibrary.simpleMessage("No server instance found"),
        "login_error_null_pass":
            MessageLookupByLibrary.simpleMessage("Password cannot be null"),
        "login_error_null_username":
            MessageLookupByLibrary.simpleMessage("Username cannot be null"),
        "login_error_unknown_host":
            MessageLookupByLibrary.simpleMessage("Unknown host"),
        "login_error_unsuccessful_response":
            MessageLookupByLibrary.simpleMessage(
                "Unsuccessful response from server"),
        "not_mapped_error":
            MessageLookupByLibrary.simpleMessage("Not mapped error"),
        "online_search_parsing_error":
            MessageLookupByLibrary.simpleMessage("Search grid parse error")
      };
}
