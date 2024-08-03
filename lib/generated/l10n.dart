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
    final String name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final S instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final S? instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Password cannot be null`
  String get loginErrorNullPass {
    return Intl.message(
      'Password cannot be null',
      name: 'loginErrorNullPass',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Username cannot be null`
  String get loginErrorNullUsername {
    return Intl.message(
      'Username cannot be null',
      name: 'loginErrorNullUsername',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Unsuccessful response from server`
  String get loginErrorUnsuccessfulResponse {
    return Intl.message(
      'Unsuccessful response from server',
      name: 'loginErrorUnsuccessfulResponse',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Error processing response`
  String get loginErrorErrorResponse {
    return Intl.message(
      'Error processing response',
      name: 'loginErrorErrorResponse',
      desc: '',
      args: <Object>[],
    );
  }

  /// `No server instance found`
  String get loginErrorNoDataRunInstance {
    return Intl.message(
      'No server instance found',
      name: 'loginErrorNoDataRunInstance',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Invalid credentials`
  String get loginErrorBadCredentials {
    return Intl.message(
      'Invalid credentials',
      name: 'loginErrorBadCredentials',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Unknown host`
  String get loginErrorUnknownHost {
    return Intl.message(
      'Unknown host',
      name: 'loginErrorUnknownHost',
      desc: '',
      args: <Object>[],
    );
  }

  /// `An unexpected error occurred`
  String get error_unexpected {
    return Intl.message(
      'An unexpected error occurred',
      name: 'error_unexpected',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Too many organizational units`
  String get error_too_manu_org_units {
    return Intl.message(
      'Too many organizational units',
      name: 'error_too_manu_org_units',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Max TEI count reached`
  String get error_max_tei_count_reached {
    return Intl.message(
      'Max TEI count reached',
      name: 'error_max_tei_count_reached',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Too many requests`
  String get error_many_requests {
    return Intl.message(
      'Too many requests',
      name: 'error_many_requests',
      desc: '',
      args: <Object>[],
    );
  }

  /// `User already authenticated`
  String get error_already_authenticated {
    return Intl.message(
      'User already authenticated',
      name: 'error_already_authenticated',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Action already executed`
  String get error_already_executed {
    return Intl.message(
      'Action already executed',
      name: 'error_already_executed',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Invalid API query`
  String get error_api_invalid_query {
    return Intl.message(
      'Invalid API query',
      name: 'error_api_invalid_query',
      desc: '',
      args: <Object>[],
    );
  }

  /// `App name not set`
  String get error_app_name_not_set {
    return Intl.message(
      'App name not set',
      name: 'error_app_name_not_set',
      desc: '',
      args: <Object>[],
    );
  }

  /// `App version not set`
  String get error_app_version_not_set {
    return Intl.message(
      'App version not set',
      name: 'error_app_version_not_set',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Cannot access keystore`
  String get error_access_keystore {
    return Intl.message(
      'Cannot access keystore',
      name: 'error_access_keystore',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Cannot create existing object`
  String get error_create_existing_error {
    return Intl.message(
      'Cannot create existing object',
      name: 'error_create_existing_error',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Cannot delete non-existing object`
  String get error_delete_non_existing_object {
    return Intl.message(
      'Cannot delete non-existing object',
      name: 'error_delete_non_existing_object',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Cannot instantiate keystore`
  String get error_instance_keystore {
    return Intl.message(
      'Cannot instantiate keystore',
      name: 'error_instance_keystore',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Could not reserve value on server`
  String get error_reserve_value_on_server {
    return Intl.message(
      'Could not reserve value on server',
      name: 'error_reserve_value_on_server',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Please login to export`
  String get error_export_login {
    return Intl.message(
      'Please login to export',
      name: 'error_export_login',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Encrypted export not supported`
  String get error_export_encrypted {
    return Intl.message(
      'Encrypted export not supported',
      name: 'error_export_encrypted',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Import already exists`
  String get error_import_exist {
    return Intl.message(
      'Import already exists',
      name: 'error_import_exist',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Logout before import`
  String get error_import_logout {
    return Intl.message(
      'Logout before import',
      name: 'error_import_logout',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Import version higher than supported`
  String get error_import_version {
    return Intl.message(
      'Import version higher than supported',
      name: 'error_import_version',
      desc: '',
      args: <Object>[],
    );
  }

  /// `File not found`
  String get error_file_not_found {
    return Intl.message(
      'File not found',
      name: 'error_file_not_found',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Failed resizing image`
  String get error_file_resize {
    return Intl.message(
      'Failed resizing image',
      name: 'error_file_resize',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Impossible to generate coordinates`
  String get error_generate_coordinate {
    return Intl.message(
      'Impossible to generate coordinates',
      name: 'error_generate_coordinate',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Job report not available`
  String get error_job {
    return Intl.message(
      'Job report not available',
      name: 'error_job',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Running low on available values`
  String get error_low_on_available_values {
    return Intl.message(
      'Running low on available values',
      name: 'error_low_on_available_values',
      desc: '',
      args: <Object>[],
    );
  }

  /// `No authenticated user`
  String get error_user_no_authenticated {
    return Intl.message(
      'No authenticated user',
      name: 'error_user_no_authenticated',
      desc: '',
      args: <Object>[],
    );
  }

  /// `No authenticated user offline`
  String get error_user_no_authenticated_offline {
    return Intl.message(
      'No authenticated user offline',
      name: 'error_user_no_authenticated_offline',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Not enough values left to reserve on server`
  String get error_no_values_left_on_server {
    return Intl.message(
      'Not enough values left to reserve on server',
      name: 'error_no_values_left_on_server',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Different authenticated user offline`
  String get error_different_offline_user {
    return Intl.message(
      'Different authenticated user offline',
      name: 'error_different_offline_user',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Invalid geometry value`
  String get error_invalid_geometry {
    return Intl.message(
      'Invalid geometry value',
      name: 'error_invalid_geometry',
      desc: '',
      args: <Object>[],
    );
  }

  /// `No reserved values`
  String get error_no_reserved_values {
    return Intl.message(
      'No reserved values',
      name: 'error_no_reserved_values',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Object cannot be updated`
  String get error_object_update {
    return Intl.message(
      'Object cannot be updated',
      name: 'error_object_update',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Object cannot be inserted`
  String get error_object_insert {
    return Intl.message(
      'Object cannot be inserted',
      name: 'error_object_insert',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Ownership access denied`
  String get error_ownership_access {
    return Intl.message(
      'Ownership access denied',
      name: 'error_ownership_access',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Search grid parse error`
  String get online_search_parsing_error {
    return Intl.message(
      'Search grid parse error',
      name: 'online_search_parsing_error',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Server URL cannot be null`
  String get error_null_url {
    return Intl.message(
      'Server URL cannot be null',
      name: 'error_null_url',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Malformed server URL`
  String get error_server_malformed {
    return Intl.message(
      'Malformed server URL',
      name: 'error_server_malformed',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Settings app not supported`
  String get error_settings_app_not_supported {
    return Intl.message(
      'Settings app not supported',
      name: 'error_settings_app_not_supported',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Settings app not installed`
  String get error_settings_app_not_intalled {
    return Intl.message(
      'Settings app not installed',
      name: 'error_settings_app_not_intalled',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Socket timeout`
  String get error_socket_timeout {
    return Intl.message(
      'Socket timeout',
      name: 'error_socket_timeout',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Relationships cannot be updated`
  String get error_relationship_updated {
    return Intl.message(
      'Relationships cannot be updated',
      name: 'error_relationship_updated',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Too many periods`
  String get error_too_many_periods {
    return Intl.message(
      'Too many periods',
      name: 'error_too_many_periods',
      desc: '',
      args: <Object>[],
    );
  }

  /// `URL not found`
  String get error_url_not_found {
    return Intl.message(
      'URL not found',
      name: 'error_url_not_found',
      desc: '',
      args: <Object>[],
    );
  }

  /// `User account disabled`
  String get error_account_disabled {
    return Intl.message(
      'User account disabled',
      name: 'error_account_disabled',
      desc: '',
      args: <Object>[],
    );
  }

  /// `User account locked`
  String get error_account_locked {
    return Intl.message(
      'User account locked',
      name: 'error_account_locked',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Value cannot be set`
  String get error_set_value {
    return Intl.message(
      'Value cannot be set',
      name: 'error_set_value',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Values reservation took too long`
  String get error_value_reservation_time {
    return Intl.message(
      'Values reservation took too long',
      name: 'error_value_reservation_time',
      desc: '',
      args: <Object>[],
    );
  }

  /// `SSL error`
  String get error_ssl {
    return Intl.message(
      'SSL error',
      name: 'error_ssl',
      desc: '',
      args: <Object>[],
    );
  }

  /// `SMS not supported`
  String get error_sms_not_supported {
    return Intl.message(
      'SMS not supported',
      name: 'error_sms_not_supported',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Minimum search attributes required`
  String get error_min_attributes {
    return Intl.message(
      'Minimum search attributes required',
      name: 'error_min_attributes',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Org unit not in search scope`
  String get error_org_unit_scope {
    return Intl.message(
      'Org unit not in search scope',
      name: 'error_org_unit_scope',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Invalid characters`
  String get error_invalid_characters {
    return Intl.message(
      'Invalid characters',
      name: 'error_invalid_characters',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Not mapped error`
  String get notMappedError {
    return Intl.message(
      'Not mapped error',
      name: 'notMappedError',
      desc: '',
      args: <Object>[],
    );
  }

  /// `MASS PRO`
  String get appName {
    return Intl.message(
      'MASS PRO',
      name: 'appName',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Show Password`
  String get showPassword {
    return Intl.message(
      'Show Password',
      name: 'showPassword',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Hide Password`
  String get hidePassword {
    return Intl.message(
      'Hide Password',
      name: 'hidePassword',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Syncing Configuration`
  String get syncingConfiguration {
    return Intl.message(
      'Syncing Configuration',
      name: 'syncingConfiguration',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Configuration Ready`
  String get configurationReady {
    return Intl.message(
      'Configuration Ready',
      name: 'configurationReady',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Syncing Data`
  String get syncingData {
    return Intl.message(
      'Syncing Data',
      name: 'syncingData',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Syncing Events`
  String get syncingEvents {
    return Intl.message(
      'Syncing Events',
      name: 'syncingEvents',
      desc: '',
      args: <Object>[],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: <Object>[],
    );
  }

  /// `user`
  String get user {
    return Intl.message(
      'user',
      name: 'user',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: <Object>[],
    );
  }

  /// `View List`
  String get viewList {
    return Intl.message(
      'View List',
      name: 'viewList',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Add New`
  String get addNew {
    return Intl.message(
      'Add New',
      name: 'addNew',
      desc: '',
      args: <Object>[],
    );
  }

  /// `{count, plural, =0{no forms} =1{1 form} =2{2 forms} other{{count} forms}}`
  String form(num count) {
    return Intl.plural(
      count,
      zero: 'no forms',
      one: '1 form',
      two: '2 forms',
      other: '$count forms',
      name: 'form',
      desc: 'A plural message',
      args: <Object>[count],
    );
  }

  /// `View Available Forms`
  String get viewAvailableForms {
    return Intl.message(
      'View Available Forms',
      name: 'viewAvailableForms',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Enter Your Username`
  String get enterYourUsername {
    return Intl.message(
      'Enter Your Username',
      name: 'enterYourUsername',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Sync Form Data`
  String get syncFormData {
    return Intl.message(
      'Sync Form Data',
      name: 'syncFormData',
      desc: 'Cancel button label',
      args: <Object>[],
    );
  }

  /// `Are you sure you want to sync the selected entities?`
  String get confirmSyncFormData {
    return Intl.message(
      'Are you sure you want to sync the selected entities?',
      name: 'confirmSyncFormData',
      desc: 'Cancel button label',
      args: <Object>[],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel button label',
      args: <Object>[],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Confirm button label',
      args: <Object>[],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: 'ok button label',
      args: <Object>[],
    );
  }

  /// `Final Data`
  String get finalData {
    return Intl.message(
      'Final Data',
      name: 'finalData',
      desc: 'Yes finalData button label',
      args: <Object>[],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: 'discard button label',
      args: <Object>[],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: 'open button label',
      args: <Object>[],
    );
  }

  /// `Open New Form`
  String get openNewForm {
    return Intl.message(
      'Open New Form',
      name: 'openNewForm',
      desc: 'initial entity dialog info submit button label',
      args: <Object>[],
    );
  }

  /// `Error Opening New Form`
  String get errorOpeningNewForm {
    return Intl.message(
      'Error Opening New Form',
      name: 'errorOpeningNewForm',
      desc: 'Error message when opening new form',
      args: <Object>[],
    );
  }

  /// `Make the form Final before exiting.`
  String get markAsFinalData {
    return Intl.message(
      'Make the form Final before exiting.',
      name: 'markAsFinalData',
      desc: 'confirmation mark as final data dialog body\'s message',
      args: <Object>[],
    );
  }

  /// `Not Now`
  String get notNow {
    return Intl.message(
      'Not Now',
      name: 'notNow',
      desc: 'notNow button label',
      args: <Object>[],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: 'send button label',
      args: <Object>[],
    );
  }

  /// `NMCP Yemen`
  String get nmcpYemen {
    return Intl.message(
      'NMCP Yemen',
      name: 'nmcpYemen',
      desc: '',
      args: <Object>[],
    );
  }

  /// `objectAccessDenied`
  String get objectAccessDenied {
    return Intl.message(
      'objectAccessDenied',
      name: 'objectAccessDenied',
      desc: '',
      args: <Object>[],
    );
  }

  /// `objectAccessClosed`
  String get objectAccessClosed {
    return Intl.message(
      'objectAccessClosed',
      name: 'objectAccessClosed',
      desc: '',
      args: <Object>[],
    );
  }

  /// `No forms available`
  String get noFormsAvailable {
    return Intl.message(
      'No forms available',
      name: 'noFormsAvailable',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Years`
  String get years {
    return Intl.message(
      'Years',
      name: 'years',
      desc: '',
      args: <Object>[],
    );
  }

  /// `And`
  String get and {
    return Intl.message(
      'And',
      name: 'and',
      desc: '',
      args: <Object>[],
    );
  }

  /// `{count, plural, =0{ } =1{1 Year} =2{2 Years} few{{count} Years} other{{count} Years}}`
  String year(num count) {
    return Intl.plural(
      count,
      zero: ' ',
      one: '1 Year',
      two: '2 Years',
      few: '$count Years',
      other: '$count Years',
      name: 'year',
      desc: 'A plural message',
      args: <Object>[count],
    );
  }

  /// `{count, plural, =0{ } =1{1 Month} =2{2 Months} few{{count} Years} other{{count} Months}}`
  String month(num count) {
    return Intl.plural(
      count,
      zero: ' ',
      one: '1 Month',
      two: '2 Months',
      few: '$count Years',
      other: '$count Months',
      name: 'month',
      desc: 'A plural message',
      args: <Object>[count],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: <Object>[],
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
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
