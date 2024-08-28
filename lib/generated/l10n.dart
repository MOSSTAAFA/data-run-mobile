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
  String get loginErrorNullPass {
    return Intl.message(
      'Password cannot be null',
      name: 'loginErrorNullPass',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be null`
  String get loginErrorNullUsername {
    return Intl.message(
      'Username cannot be null',
      name: 'loginErrorNullUsername',
      desc: '',
      args: [],
    );
  }

  /// `Unsuccessful response from server`
  String get loginErrorUnsuccessfulResponse {
    return Intl.message(
      'Unsuccessful response from server',
      name: 'loginErrorUnsuccessfulResponse',
      desc: '',
      args: [],
    );
  }

  /// `Error processing response`
  String get loginErrorErrorResponse {
    return Intl.message(
      'Error processing response',
      name: 'loginErrorErrorResponse',
      desc: '',
      args: [],
    );
  }

  /// `No server instance found`
  String get loginErrorNoDataRunInstance {
    return Intl.message(
      'No server instance found',
      name: 'loginErrorNoDataRunInstance',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials`
  String get loginErrorBadCredentials {
    return Intl.message(
      'Invalid credentials',
      name: 'loginErrorBadCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Unknown host`
  String get loginErrorUnknownHost {
    return Intl.message(
      'Unknown host',
      name: 'loginErrorUnknownHost',
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
  String get notMappedError {
    return Intl.message(
      'Not mapped error',
      name: 'notMappedError',
      desc: '',
      args: [],
    );
  }

  /// `Datarun`
  String get appName {
    return Intl.message(
      'Datarun',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Show Password`
  String get showPassword {
    return Intl.message(
      'Show Password',
      name: 'showPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide Password`
  String get hidePassword {
    return Intl.message(
      'Hide Password',
      name: 'hidePassword',
      desc: '',
      args: [],
    );
  }

  /// `Syncing Configuration`
  String get syncingConfiguration {
    return Intl.message(
      'Syncing Configuration',
      name: 'syncingConfiguration',
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
  String get configurationReady {
    return Intl.message(
      'Configuration Ready',
      name: 'configurationReady',
      desc: '',
      args: [],
    );
  }

  /// `Syncing Data`
  String get syncingData {
    return Intl.message(
      'Syncing Data',
      name: 'syncingData',
      desc: '',
      args: [],
    );
  }

  /// `Syncing Events`
  String get syncingEvents {
    return Intl.message(
      'Syncing Events',
      name: 'syncingEvents',
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
  String get viewList {
    return Intl.message(
      'View List',
      name: 'viewList',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get addNew {
    return Intl.message(
      'Add New',
      name: 'addNew',
      desc: '',
      args: [],
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
      args: [count],
    );
  }

  /// `View Available Forms`
  String get viewAvailableForms {
    return Intl.message(
      'View Available Forms',
      name: 'viewAvailableForms',
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
  String get enterYourUsername {
    return Intl.message(
      'Enter Your Username',
      name: 'enterYourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Sync Form Data`
  String get syncFormData {
    return Intl.message(
      'Sync Form Data',
      name: 'syncFormData',
      desc: 'Cancel button label',
      args: [],
    );
  }

  /// `Are you sure you want to sync the selected entities?`
  String get confirmSyncFormData {
    return Intl.message(
      'Are you sure you want to sync the selected entities?',
      name: 'confirmSyncFormData',
      desc: 'Cancel button label',
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
      desc: 'Cancel button label',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Confirm button label',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: 'ok button label',
      args: [],
    );
  }

  /// `Final Data`
  String get finalData {
    return Intl.message(
      'Final Data',
      name: 'finalData',
      desc: 'Yes finalData button label',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: 'discard button label',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: 'open button label',
      args: [],
    );
  }

  /// `Open New Form`
  String get openNewForm {
    return Intl.message(
      'Open New Form',
      name: 'openNewForm',
      desc: 'initial entity dialog info submit button label',
      args: [],
    );
  }

  /// `Error Opening New Form`
  String get errorOpeningNewForm {
    return Intl.message(
      'Error Opening New Form',
      name: 'errorOpeningNewForm',
      desc: 'Error message when opening new form',
      args: [],
    );
  }

  /// `Make the form Final before exiting.`
  String get markAsFinalData {
    return Intl.message(
      'Make the form Final before exiting.',
      name: 'markAsFinalData',
      desc: 'confirmation mark as final data dialog body\'s message',
      args: [],
    );
  }

  /// `Not Now`
  String get notNow {
    return Intl.message(
      'Not Now',
      name: 'notNow',
      desc: 'notNow button label',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: 'send button label',
      args: [],
    );
  }

  /// `NMCP Yemen`
  String get nmcpYemen {
    return Intl.message(
      'NMCP Yemen',
      name: 'nmcpYemen',
      desc: '',
      args: [],
    );
  }

  /// `objectAccessDenied`
  String get objectAccessDenied {
    return Intl.message(
      'objectAccessDenied',
      name: 'objectAccessDenied',
      desc: '',
      args: [],
    );
  }

  /// `objectAccessClosed`
  String get objectAccessClosed {
    return Intl.message(
      'objectAccessClosed',
      name: 'objectAccessClosed',
      desc: '',
      args: [],
    );
  }

  /// `No forms available`
  String get noFormsAvailable {
    return Intl.message(
      'No forms available',
      name: 'noFormsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get years {
    return Intl.message(
      'Years',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get and {
    return Intl.message(
      'And',
      name: 'and',
      desc: '',
      args: [],
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
      args: [count],
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
      args: [count],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Select Org Unit`
  String get orgUnitHelpText {
    return Intl.message(
      'Select Org Unit',
      name: 'orgUnitHelpText',
      desc: '',
      args: [],
    );
  }

  /// `Select Org Unit`
  String get orgUnitInputLabel {
    return Intl.message(
      'Select Org Unit',
      name: 'orgUnitInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Search for and Select OrgUnit`
  String get orgUnitDialogTitle {
    return Intl.message(
      'Search for and Select OrgUnit',
      name: 'orgUnitDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search Org Units...`
  String get searchOrgUnitsHelpText {
    return Intl.message(
      'Search Org Units...',
      name: 'searchOrgUnitsHelpText',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get submissionInitialData {
    return Intl.message(
      'Main',
      name: 'submissionInitialData',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get submissionDataEntry {
    return Intl.message(
      'Data',
      name: 'submissionDataEntry',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Middle Name`
  String get middleName {
    return Intl.message(
      'Middle Name',
      name: 'middleName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
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
