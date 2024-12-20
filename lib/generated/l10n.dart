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

  /// `Request timed out. Please try again.`
  String get networkTimeout {
    return Intl.message(
      'Request timed out. Please try again.',
      name: 'networkTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed. Check your network.`
  String get networkConnectionFailed {
    return Intl.message(
      'Connection failed. Check your network.',
      name: 'networkConnectionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid login credentials provided.`
  String get authInvalidCredentials {
    return Intl.message(
      'Invalid login credentials provided.',
      name: 'authInvalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in again.`
  String get authSessionExpired {
    return Intl.message(
      'Your session has expired. Please log in again.',
      name: 'authSessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Credentials do not match authenticated user. Cannot login offline.`
  String get noAuthenticatedUser {
    return Intl.message(
      'Credentials do not match authenticated user. Cannot login offline.',
      name: 'noAuthenticatedUser',
      desc: '',
      args: [],
    );
  }

  /// `The user hasn't been previously authenticated. Cannot login offline.`
  String get noAuthenticatedUserOffline {
    return Intl.message(
      'The user hasn\'t been previously authenticated. Cannot login offline.',
      name: 'noAuthenticatedUserOffline',
      desc: '',
      args: [],
    );
  }

  /// `Different authenticated user offline`
  String get differentOfflineUser {
    return Intl.message(
      'Different authenticated user offline',
      name: 'differentOfflineUser',
      desc: '',
      args: [],
    );
  }

  /// `This account is disabled. contact Administrator for details.`
  String get accountDisabled {
    return Intl.message(
      'This account is disabled. contact Administrator for details.',
      name: 'accountDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to the database.`
  String get databaseConnectionFailed {
    return Intl.message(
      'Failed to connect to the database.',
      name: 'databaseConnectionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred while querying the database.`
  String get databaseQueryFailed {
    return Intl.message(
      'Error occurred while querying the database.',
      name: 'databaseQueryFailed',
      desc: '',
      args: [],
    );
  }

  /// `Database returned an Error ${error}.`
  String databaseInternalError(Object error) {
    return Intl.message(
      'Database returned an Error \$$error.',
      name: 'databaseInternalError',
      desc: '',
      args: [error],
    );
  }

  /// `Error While Trying to Sync data ${error}.`
  String syncError(Object error) {
    return Intl.message(
      'Error While Trying to Sync data \$$error.',
      name: 'syncError',
      desc: '',
      args: [error],
    );
  }

  /// `Error: ${error}.`
  String unknownError(Object error) {
    return Intl.message(
      'Error: \$$error.',
      name: 'unknownError',
      desc: '',
      args: [error],
    );
  }

  /// `Please correct the errors in the form.`
  String get validationError {
    return Intl.message(
      'Please correct the errors in the form.',
      name: 'validationError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while interacting with the API ${error}.`
  String apiError(Object error) {
    return Intl.message(
      'An error occurred while interacting with the API \$$error.',
      name: 'apiError',
      desc: '',
      args: [error],
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

  /// `{count, plural, =0{no forms available} =1{1 form available} =2{2 forms available} other{{count} forms available}}`
  String form(num count) {
    return Intl.plural(
      count,
      zero: 'no forms available',
      one: '1 form available',
      two: '2 forms available',
      other: '$count forms available',
      name: 'form',
      desc: 'A plural message',
      args: [count],
    );
  }

  /// `Expand to View Available Forms`
  String get viewAvailableForms {
    return Intl.message(
      'Expand to View Available Forms',
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

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Item Removed`
  String get itemRemoved {
    return Intl.message(
      'Item Removed',
      name: 'itemRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this section?`
  String get conformDeleteMsg {
    return Intl.message(
      'Are you sure you want to remove this section?',
      name: 'conformDeleteMsg',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get undo {
    return Intl.message(
      'Undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// `selected`
  String get selected {
    return Intl.message(
      'selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `This field is required.`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required.',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `enter a valid email address.`
  String get pleaseEnterAValidEmailAddress {
    return Intl.message(
      'enter a valid email address.',
      name: 'pleaseEnterAValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number.`
  String get enterAValidNumber {
    return Intl.message(
      'Please enter a valid number.',
      name: 'enterAValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `The value must be greater than or equal to ${error}.`
  String valueMustBeGreaterThanOrEqualToError(Object error) {
    return Intl.message(
      'The value must be greater than or equal to \$$error.',
      name: 'valueMustBeGreaterThanOrEqualToError',
      desc: '',
      args: [error],
    );
  }

  /// `The value must be less than or equal to ${error}.`
  String valueMustBeLessThanOrEqualToError(Object error) {
    return Intl.message(
      'The value must be less than or equal to \$$error.',
      name: 'valueMustBeLessThanOrEqualToError',
      desc: '',
      args: [error],
    );
  }

  /// `The maximum allowed length is ${error}.`
  String maximumAllowedLengthIsError(Object error) {
    return Intl.message(
      'The maximum allowed length is \$$error.',
      name: 'maximumAllowedLengthIsError',
      desc: '',
      args: [error],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Fetch From Server`
  String get fetchUpdates {
    return Intl.message(
      'Fetch From Server',
      name: 'fetchUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `User Settings`
  String get userSettings {
    return Intl.message(
      'User Settings',
      name: 'userSettings',
      desc: '',
      args: [],
    );
  }

  /// `Toggle Brightness`
  String get toggleBrightness {
    return Intl.message(
      'Toggle Brightness',
      name: 'toggleBrightness',
      desc: '',
      args: [],
    );
  }

  /// `Select Color Theme`
  String get selectColorTheme {
    return Intl.message(
      'Select Color Theme',
      name: 'selectColorTheme',
      desc: '',
      args: [],
    );
  }

  /// `Select Image for Color Extraction`
  String get selectImageForColorExtraction {
    return Intl.message(
      'Select Image for Color Extraction',
      name: 'selectImageForColorExtraction',
      desc: '',
      args: [],
    );
  }

  /// `Select a seed color`
  String get selectASeedColor {
    return Intl.message(
      'Select a seed color',
      name: 'selectASeedColor',
      desc: '',
      args: [],
    );
  }

  /// `Select a color extraction image`
  String get selectAColorExtractionImage {
    return Intl.message(
      'Select a color extraction image',
      name: 'selectAColorExtractionImage',
      desc: '',
      args: [],
    );
  }

  /// `Organization`
  String get organization {
    return Intl.message(
      'Organization',
      name: 'organization',
      desc: '',
      args: [],
    );
  }

  /// `Current username`
  String get currentUsername {
    return Intl.message(
      'Current username',
      name: 'currentUsername',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `your data will not be deleted when you login back again`
  String get logoutNote {
    return Intl.message(
      'your data will not be deleted when you login back again',
      name: 'logoutNote',
      desc: '',
      args: [],
    );
  }

  /// `Form contains some errors`
  String get formContainsSomeErrors {
    return Intl.message(
      'Form contains some errors',
      name: 'formContainsSomeErrors',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message(
      'Dismiss',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Fields with Error`
  String get fieldsWithErrorInfo {
    return Intl.message(
      'Fields with Error',
      name: 'fieldsWithErrorInfo',
      desc: '',
      args: [],
    );
  }

  /// `Review Form`
  String get reviewFormData {
    return Intl.message(
      'Review Form',
      name: 'reviewFormData',
      desc: '',
      args: [],
    );
  }

  /// `Check Fields later`
  String get checkFieldsLater {
    return Intl.message(
      'Check Fields later',
      name: 'checkFieldsLater',
      desc: '',
      args: [],
    );
  }

  /// `Make Form Final for Send to server, or save as draft!`
  String get makeFormFinalOrSaveBody {
    return Intl.message(
      'Make Form Final for Send to server, or save as draft!',
      name: 'makeFormFinalOrSaveBody',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get deleteConfirmationMessage {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'deleteConfirmationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Form Summary View`
  String get formSummaryView {
    return Intl.message(
      'Form Summary View',
      name: 'formSummaryView',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `No internet access`
  String get noInternetAccess {
    return Intl.message(
      'No internet access',
      name: 'noInternetAccess',
      desc: '',
      args: [],
    );
  }

  /// `online!`
  String get online {
    return Intl.message(
      'online!',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Save and Check`
  String get saveAndCheck {
    return Intl.message(
      'Save and Check',
      name: 'saveAndCheck',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `field Contain Errors`
  String get fieldContainErrors {
    return Intl.message(
      'field Contain Errors',
      name: 'fieldContainErrors',
      desc: '',
      args: [],
    );
  }

  /// `Starting sync...`
  String get startingSync {
    return Intl.message(
      'Starting sync...',
      name: 'startingSync',
      desc: '',
      args: [],
    );
  }

  /// `Server URL`
  String get serverUrl {
    return Intl.message(
      'Server URL',
      name: 'serverUrl',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get appVersion {
    return Intl.message(
      'App Version',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `Person Information`
  String get personInformation {
    return Intl.message(
      'Person Information',
      name: 'personInformation',
      desc: '',
      args: [],
    );
  }

  /// `Login Username`
  String get loginUsername {
    return Intl.message(
      'Login Username',
      name: 'loginUsername',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Sync Time`
  String get lastConfigurationSyncTime {
    return Intl.message(
      'Sync Time',
      name: 'lastConfigurationSyncTime',
      desc: '',
      args: [],
    );
  }

  /// `last sync status`
  String get lastSyncStatus {
    return Intl.message(
      'last sync status',
      name: 'lastSyncStatus',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `App Information`
  String get appInformation {
    return Intl.message(
      'App Information',
      name: 'appInformation',
      desc: '',
      args: [],
    );
  }

  /// `Developer Information`
  String get developerInformation {
    return Intl.message(
      'Developer Information',
      name: 'developerInformation',
      desc: '',
      args: [],
    );
  }

  /// `MOH, NMCP Yemen`
  String get developer {
    return Intl.message(
      'MOH, NMCP Yemen',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `info@nmcpye.org`
  String get developerInfoText {
    return Intl.message(
      'info@nmcpye.org',
      name: 'developerInfoText',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get accountInformation {
    return Intl.message(
      'Account Information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Open settings`
  String get openSettings {
    return Intl.message(
      'Open settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `internet Is Connected`
  String get internetIsConnected {
    return Intl.message(
      'internet Is Connected',
      name: 'internetIsConnected',
      desc: '',
      args: [],
    );
  }

  /// `No sync yet`
  String get noSyncYet {
    return Intl.message(
      'No sync yet',
      name: 'noSyncYet',
      desc: '',
      args: [],
    );
  }

  /// `Daily`
  String get daily {
    return Intl.message(
      'Daily',
      name: 'daily',
      desc: '',
      args: [],
    );
  }

  /// `Every two days`
  String get everyTwoDays {
    return Intl.message(
      'Every two days',
      name: 'everyTwoDays',
      desc: '',
      args: [],
    );
  }

  /// `Weekly`
  String get weekly {
    return Intl.message(
      'Weekly',
      name: 'weekly',
      desc: '',
      args: [],
    );
  }

  /// `Every 15 days`
  String get everyFifteenDays {
    return Intl.message(
      'Every 15 days',
      name: 'everyFifteenDays',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message(
      'Monthly',
      name: 'monthly',
      desc: '',
      args: [],
    );
  }

  /// `Sync Now`
  String get syncNow {
    return Intl.message(
      'Sync Now',
      name: 'syncNow',
      desc: '',
      args: [],
    );
  }

  /// `Sync Interval`
  String get syncInterval {
    return Intl.message(
      'Sync Interval',
      name: 'syncInterval',
      desc: '',
      args: [],
    );
  }

  /// `Sync Settings`
  String get syncSettings {
    return Intl.message(
      'Sync Settings',
      name: 'syncSettings',
      desc: '',
      args: [],
    );
  }

  /// `At least ${error} Item must be provided`
  String atLeastErrorItemMustBeProvided(Object error) {
    return Intl.message(
      'At least \$$error Item must be provided',
      name: 'atLeastErrorItemMustBeProvided',
      desc: '',
      args: [error],
    );
  }

  /// `Scan your code`
  String get scanYourCode {
    return Intl.message(
      'Scan your code',
      name: 'scanYourCode',
      desc: '',
      args: [],
    );
  }

  /// `Barcode/QR Code`
  String get barcodeQrScan {
    return Intl.message(
      'Barcode/QR Code',
      name: 'barcodeQrScan',
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
