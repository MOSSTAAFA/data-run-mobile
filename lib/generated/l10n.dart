// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Password cannot be null`
  String get login_error_null_pass {
    return Intl.message(
      'Password cannot be null',
      name: 'login_error_null_pass',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be null`
  String get login_error_null_username {
    return Intl.message(
      'Username cannot be null',
      name: 'login_error_null_username',
      desc: '',
      args: [],
    );
  }

  /// `Unsuccessful response from server`
  String get login_error_unsuccessful_response {
    return Intl.message(
      'Unsuccessful response from server',
      name: 'login_error_unsuccessful_response',
      desc: '',
      args: [],
    );
  }

  /// `Error processing response`
  String get login_error_error_response {
    return Intl.message(
      'Error processing response',
      name: 'login_error_error_response',
      desc: '',
      args: [],
    );
  }

  /// `No server instance found`
  String get login_error_no_am_instance {
    return Intl.message(
      'No server instance found',
      name: 'login_error_no_am_instance',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get login_error_bad_credentials {
    return Intl.message(
      'Invalid credentials',
      name: 'login_error_bad_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Unknown host`
  String get login_error_unknown_host {
    return Intl.message(
      'Unknown host',
      name: 'login_error_unknown_host',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get error_unexpected {
    return Intl.message(
      'An unexpected error occurred',
      name: 'error_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `Too many organizational units`
  String get error_too_manu_org_units {
    return Intl.message(
      'Too many organizational units',
      name: 'error_too_manu_org_units',
      desc: '',
      args: [],
    );
  }

  /// `Max TEI count reached`
  String get error_max_tei_count_reached {
    return Intl.message(
      'Max TEI count reached',
      name: 'error_max_tei_count_reached',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests`
  String get error_many_requests {
    return Intl.message(
      'Too many requests',
      name: 'error_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `User already authenticated`
  String get error_already_authenticated {
    return Intl.message(
      'User already authenticated',
      name: 'error_already_authenticated',
      desc: '',
      args: [],
    );
  }

  /// `Action already executed`
  String get error_already_executed {
    return Intl.message(
      'Action already executed',
      name: 'error_already_executed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid API query`
  String get error_api_invalid_query {
    return Intl.message(
      'Invalid API query',
      name: 'error_api_invalid_query',
      desc: '',
      args: [],
    );
  }

  /// `App name not set`
  String get error_app_name_not_set {
    return Intl.message(
      'App name not set',
      name: 'error_app_name_not_set',
      desc: '',
      args: [],
    );
  }

  /// `App version not set`
  String get error_app_version_not_set {
    return Intl.message(
      'App version not set',
      name: 'error_app_version_not_set',
      desc: '',
      args: [],
    );
  }

  /// `Cannot access keystore`
  String get error_access_keystore {
    return Intl.message(
      'Cannot access keystore',
      name: 'error_access_keystore',
      desc: '',
      args: [],
    );
  }

  /// `Cannot create existing object`
  String get error_create_existing_error {
    return Intl.message(
      'Cannot create existing object',
      name: 'error_create_existing_error',
      desc: '',
      args: [],
    );
  }

  /// `Cannot delete non-existing object`
  String get error_delete_non_existing_object {
    return Intl.message(
      'Cannot delete non-existing object',
      name: 'error_delete_non_existing_object',
      desc: '',
      args: [],
    );
  }

  /// `Cannot instantiate keystore`
  String get error_instance_keystore {
    return Intl.message(
      'Cannot instantiate keystore',
      name: 'error_instance_keystore',
      desc: '',
      args: [],
    );
  }

  /// `Could not reserve value on server`
  String get error_reserve_value_on_server {
    return Intl.message(
      'Could not reserve value on server',
      name: 'error_reserve_value_on_server',
      desc: '',
      args: [],
    );
  }

  /// `Please login to export`
  String get error_export_login {
    return Intl.message(
      'Please login to export',
      name: 'error_export_login',
      desc: '',
      args: [],
    );
  }

  /// `Encrypted export not supported`
  String get error_export_encrypted {
    return Intl.message(
      'Encrypted export not supported',
      name: 'error_export_encrypted',
      desc: '',
      args: [],
    );
  }

  /// `Import already exists`
  String get error_import_exist {
    return Intl.message(
      'Import already exists',
      name: 'error_import_exist',
      desc: '',
      args: [],
    );
  }

  /// `Logout before import`
  String get error_import_logout {
    return Intl.message(
      'Logout before import',
      name: 'error_import_logout',
      desc: '',
      args: [],
    );
  }

  /// `Import version higher than supported`
  String get error_import_version {
    return Intl.message(
      'Import version higher than supported',
      name: 'error_import_version',
      desc: '',
      args: [],
    );
  }

  /// `File not found`
  String get error_file_not_found {
    return Intl.message(
      'File not found',
      name: 'error_file_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Failed resizing image`
  String get error_file_resize {
    return Intl.message(
      'Failed resizing image',
      name: 'error_file_resize',
      desc: '',
      args: [],
    );
  }

  /// `Impossible to generate coordinates`
  String get error_generate_coordinate {
    return Intl.message(
      'Impossible to generate coordinates',
      name: 'error_generate_coordinate',
      desc: '',
      args: [],
    );
  }

  /// `Job report not available`
  String get error_job {
    return Intl.message(
      'Job report not available',
      name: 'error_job',
      desc: '',
      args: [],
    );
  }

  /// `Running low on available values`
  String get error_low_on_available_values {
    return Intl.message(
      'Running low on available values',
      name: 'error_low_on_available_values',
      desc: '',
      args: [],
    );
  }

  /// `No authenticated user`
  String get error_user_no_authenticated {
    return Intl.message(
      'No authenticated user',
      name: 'error_user_no_authenticated',
      desc: '',
      args: [],
    );
  }

  /// `No authenticated user offline`
  String get error_user_no_authenticated_offline {
    return Intl.message(
      'No authenticated user offline',
      name: 'error_user_no_authenticated_offline',
      desc: '',
      args: [],
    );
  }

  /// `Not enough values left to reserve on server`
  String get error_no_values_left_on_server {
    return Intl.message(
      'Not enough values left to reserve on server',
      name: 'error_no_values_left_on_server',
      desc: '',
      args: [],
    );
  }

  /// `Different authenticated user offline`
  String get error_different_offline_user {
    return Intl.message(
      'Different authenticated user offline',
      name: 'error_different_offline_user',
      desc: '',
      args: [],
    );
  }

  /// `Invalid geometry value`
  String get error_invalid_geometry {
    return Intl.message(
      'Invalid geometry value',
      name: 'error_invalid_geometry',
      desc: '',
      args: [],
    );
  }

  /// `No reserved values`
  String get error_no_reserved_values {
    return Intl.message(
      'No reserved values',
      name: 'error_no_reserved_values',
      desc: '',
      args: [],
    );
  }

  /// `Object cannot be updated`
  String get error_object_update {
    return Intl.message(
      'Object cannot be updated',
      name: 'error_object_update',
      desc: '',
      args: [],
    );
  }

  /// `Object cannot be inserted`
  String get error_object_insert {
    return Intl.message(
      'Object cannot be inserted',
      name: 'error_object_insert',
      desc: '',
      args: [],
    );
  }

  /// `Ownership access denied`
  String get error_ownership_access {
    return Intl.message(
      'Ownership access denied',
      name: 'error_ownership_access',
      desc: '',
      args: [],
    );
  }

  /// `Search grid parse error`
  String get online_search_parsing_error {
    return Intl.message(
      'Search grid parse error',
      name: 'online_search_parsing_error',
      desc: '',
      args: [],
    );
  }

  /// `Server URL cannot be null`
  String get error_null_url {
    return Intl.message(
      'Server URL cannot be null',
      name: 'error_null_url',
      desc: '',
      args: [],
    );
  }

  /// `Malformed server URL`
  String get error_server_malformed {
    return Intl.message(
      'Malformed server URL',
      name: 'error_server_malformed',
      desc: '',
      args: [],
    );
  }

  /// `Settings app not supported`
  String get error_settings_app_not_supported {
    return Intl.message(
      'Settings app not supported',
      name: 'error_settings_app_not_supported',
      desc: '',
      args: [],
    );
  }

  /// `Settings app not installed`
  String get error_settings_app_not_intalled {
    return Intl.message(
      'Settings app not installed',
      name: 'error_settings_app_not_intalled',
      desc: '',
      args: [],
    );
  }

  /// `Socket timeout`
  String get error_socket_timeout {
    return Intl.message(
      'Socket timeout',
      name: 'error_socket_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Relationships cannot be updated`
  String get error_relationship_updated {
    return Intl.message(
      'Relationships cannot be updated',
      name: 'error_relationship_updated',
      desc: '',
      args: [],
    );
  }

  /// `Too many periods`
  String get error_too_many_periods {
    return Intl.message(
      'Too many periods',
      name: 'error_too_many_periods',
      desc: '',
      args: [],
    );
  }

  /// `URL not found`
  String get error_url_not_found {
    return Intl.message(
      'URL not found',
      name: 'error_url_not_found',
      desc: '',
      args: [],
    );
  }

  /// `User account disabled`
  String get error_account_disabled {
    return Intl.message(
      'User account disabled',
      name: 'error_account_disabled',
      desc: '',
      args: [],
    );
  }

  /// `User account locked`
  String get error_account_locked {
    return Intl.message(
      'User account locked',
      name: 'error_account_locked',
      desc: '',
      args: [],
    );
  }

  /// `Value cannot be set`
  String get error_set_value {
    return Intl.message(
      'Value cannot be set',
      name: 'error_set_value',
      desc: '',
      args: [],
    );
  }

  /// `Values reservation took too long`
  String get error_value_reservation_time {
    return Intl.message(
      'Values reservation took too long',
      name: 'error_value_reservation_time',
      desc: '',
      args: [],
    );
  }

  /// `SSL error`
  String get error_ssl {
    return Intl.message(
      'SSL error',
      name: 'error_ssl',
      desc: '',
      args: [],
    );
  }

  /// `SMS not supported`
  String get error_sms_not_supported {
    return Intl.message(
      'SMS not supported',
      name: 'error_sms_not_supported',
      desc: '',
      args: [],
    );
  }

  /// `Minimum search attributes required`
  String get error_min_attributes {
    return Intl.message(
      'Minimum search attributes required',
      name: 'error_min_attributes',
      desc: '',
      args: [],
    );
  }

  /// `Org unit not in search scope`
  String get error_org_unit_scope {
    return Intl.message(
      'Org unit not in search scope',
      name: 'error_org_unit_scope',
      desc: '',
      args: [],
    );
  }

  /// `Invalid characters`
  String get error_invalid_characters {
    return Intl.message(
      'Invalid characters',
      name: 'error_invalid_characters',
      desc: '',
      args: [],
    );
  }

  /// `Not mapped error`
  String get not_mapped_error {
    return Intl.message(
      'Not mapped error',
      name: 'not_mapped_error',
      desc: '',
      args: [],
    );
  }

  /// `MASS PRO`
  String get app_name {
    return Intl.message(
      'MASS PRO',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Show Password`
  String get show_password {
    return Intl.message(
      'Show Password',
      name: 'show_password',
      desc: '',
      args: [],
    );
  }

  /// `Hide Password`
  String get hide_password {
    return Intl.message(
      'Hide Password',
      name: 'hide_password',
      desc: '',
      args: [],
    );
  }

  /// `Syncing Configuration`
  String get syncing_configuration {
    return Intl.message(
      'Syncing Configuration',
      name: 'syncing_configuration',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Configuration Ready`
  String get configuration_ready {
    return Intl.message(
      'Configuration Ready',
      name: 'configuration_ready',
      desc: '',
      args: [],
    );
  }

  /// `Syncing Data`
  String get syncing_data {
    return Intl.message(
      'Syncing Data',
      name: 'syncing_data',
      desc: '',
      args: [],
    );
  }

  /// `Syncing Events`
  String get syncing_events {
    return Intl.message(
      'Syncing Events',
      name: 'syncing_events',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `user`
  String get user {
    return Intl.message(
      'user',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `View List`
  String get view_list {
    return Intl.message(
      'View List',
      name: 'view_list',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get add_new {
    return Intl.message(
      'Add New',
      name: 'add_new',
      desc: '',
      args: [],
    );
  }

  /// `form`
  String get form {
    return Intl.message(
      'form',
      name: 'form',
      desc: '',
      args: [],
    );
  }

  /// `View Available Forms`
  String get view_available_forms {
    return Intl.message(
      'View Available Forms',
      name: 'view_available_forms',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Username`
  String get enter_your_username {
    return Intl.message(
      'Enter Your Username',
      name: 'enter_your_username',
      desc: '',
      args: [],
    );
  }

  /// `Sync Form Data`
  String get sync_form_data {
    return Intl.message(
      'Sync Form Data',
      name: 'sync_form_data',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sync the selected entities?`
  String get confirm_sync_form_data_question {
    return Intl.message(
      'Are you sure you want to sync the selected entities?',
      name: 'confirm_sync_form_data_question',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Final Data`
  String get mark_final_data {
    return Intl.message(
      'Final Data',
      name: 'mark_final_data',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Open New Form`
  String get open_new_form {
    return Intl.message(
      'Open New Form',
      name: 'open_new_form',
      desc: '',
      args: [],
    );
  }

  /// `Error Opening New Form`
  String get error_opening_new_form {
    return Intl.message(
      'Error Opening New Form',
      name: 'error_opening_new_form',
      desc: '',
      args: [],
    );
  }

  /// `Make the form Final before exiting.`
  String get mark_final_data_message {
    return Intl.message(
      'Make the form Final before exiting.',
      name: 'mark_final_data_message',
      desc: '',
      args: [],
    );
  }

  /// `Not Now`
  String get not_now {
    return Intl.message(
      'Not Now',
      name: 'not_now',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `NMCP Yemen`
  String get nmcp_yemen {
    return Intl.message(
      'NMCP Yemen',
      name: 'nmcp_yemen',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
