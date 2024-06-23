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

  /// `NMCP Yemen`
  String get appTitle {
    return Intl.message(
      'NMCP Yemen',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
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

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
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

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `select`
  String get select {
    return Intl.message(
      'select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `id`
  String get id {
    return Intl.message(
      'id',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Short Name`
  String get shortName {
    return Intl.message(
      'Short Name',
      name: 'shortName',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `quantity`
  String get quantity {
    return Intl.message(
      'quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Stock quantity`
  String get stockQuantity {
    return Intl.message(
      'Stock quantity',
      name: 'stockQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get ascending {
    return Intl.message(
      'Ascending',
      name: 'ascending',
      desc: '',
      args: [],
    );
  }

  /// `Descending`
  String get descending {
    return Intl.message(
      'Descending',
      name: 'descending',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get notCompleted {
    return Intl.message(
      'New',
      name: 'notCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get draft {
    return Intl.message(
      'Draft',
      name: 'draft',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message(
      'Sent',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Synced`
  String get synced {
    return Intl.message(
      'Synced',
      name: 'synced',
      desc: '',
      args: [],
    );
  }

  /// `copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `edit columns`
  String get editColumns {
    return Intl.message(
      'edit columns',
      name: 'editColumns',
      desc: '',
      args: [],
    );
  }

  /// `reset`
  String get reset {
    return Intl.message(
      'reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `multiselect`
  String get multiselect {
    return Intl.message(
      'multiselect',
      name: 'multiselect',
      desc: '',
      args: [],
    );
  }

  /// `filter`
  String get filter {
    return Intl.message(
      'filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `show table`
  String get showTable {
    return Intl.message(
      'show table',
      name: 'showTable',
      desc: '',
      args: [],
    );
  }

  /// `show list`
  String get showList {
    return Intl.message(
      'show list',
      name: 'showList',
      desc: '',
      args: [],
    );
  }

  /// `sort`
  String get sort {
    return Intl.message(
      'sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `columns`
  String get columns {
    return Intl.message(
      'columns',
      name: 'columns',
      desc: '',
      args: [],
    );
  }

  /// `savedSettings`
  String get savedSettings {
    return Intl.message(
      'savedSettings',
      name: 'savedSettings',
      desc: '',
      args: [],
    );
  }

  /// `addColumn`
  String get addColumn {
    return Intl.message(
      'addColumn',
      name: 'addColumn',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Filtered by :value`
  String get filteredBy {
    return Intl.message(
      'Filtered by :value',
      name: 'filteredBy',
      desc: '',
      args: [],
    );
  }

  /// `none`
  String get none {
    return Intl.message(
      'none',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `clickPlusToAddItem`
  String get clickPlusToAddItem {
    return Intl.message(
      'clickPlusToAddItem',
      name: 'clickPlusToAddItem',
      desc: '',
      args: [],
    );
  }

  /// `chvMalariaCases`
  String get chvMalariaCases {
    return Intl.message(
      'chvMalariaCases',
      name: 'chvMalariaCases',
      desc: '',
      args: [],
    );
  }

  /// `chvStockMovements`
  String get chvStockMovements {
    return Intl.message(
      'chvStockMovements',
      name: 'chvStockMovements',
      desc: '',
      args: [],
    );
  }

  /// `No record selected`
  String get noRecordSelected {
    return Intl.message(
      'No record selected',
      name: 'noRecordSelected',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get documents {
    return Intl.message(
      'Documents',
      name: 'documents',
      desc: '',
      args: [],
    );
  }

  /// `Refresh complete`
  String get refreshComplete {
    return Intl.message(
      'Refresh complete',
      name: 'refreshComplete',
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

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
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

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
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

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Why are you leaving?`
  String get whyAreYouLeaving {
    return Intl.message(
      'Why are you leaving?',
      name: 'whyAreYouLeaving',
      desc: '',
      args: [],
    );
  }

  /// `Ok!`
  String get ok {
    return Intl.message(
      'Ok!',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Please, type to confirm`
  String get pleaseTypeToConfirm {
    return Intl.message(
      'Please, type to confirm',
      name: 'pleaseTypeToConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Discard changes?`
  String get discardChanges {
    return Intl.message(
      'Discard changes?',
      name: 'discardChanges',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded document`
  String get uploadedDocument {
    return Intl.message(
      'Uploaded document',
      name: 'uploadedDocument',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Test result`
  String get malariaTestResult {
    return Intl.message(
      'Test result',
      name: 'malariaTestResult',
      desc: '',
      args: [],
    );
  }

  /// `Malaria drugs given`
  String get malariaMidsGiven {
    return Intl.message(
      'Malaria drugs given',
      name: 'malariaMidsGiven',
      desc: '',
      args: [],
    );
  }

  /// `Test bar image`
  String get testBarImage {
    return Intl.message(
      'Test bar image',
      name: 'testBarImage',
      desc: '',
      args: [],
    );
  }

  /// `Referral`
  String get referral {
    return Intl.message(
      'Referral',
      name: 'referral',
      desc: '',
      args: [],
    );
  }

  /// `Sync chv Malaria Cases`
  String get syncChvMalariaCases {
    return Intl.message(
      'Sync chv Malaria Cases',
      name: 'syncChvMalariaCases',
      desc: '',
      args: [],
    );
  }

  /// `Sync chv Malaria Case`
  String get syncChvMalariaCase {
    return Intl.message(
      'Sync chv Malaria Case',
      name: 'syncChvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `Deleted chv Malaria Cases`
  String get deletedChvMalariaCases {
    return Intl.message(
      'Deleted chv Malaria Cases',
      name: 'deletedChvMalariaCases',
      desc: '',
      args: [],
    );
  }

  /// `Deleted chv Malaria Case`
  String get deletedChvMalariaCase {
    return Intl.message(
      'Deleted chv Malaria Case',
      name: 'deletedChvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `Unanswered`
  String get unAnswered {
    return Intl.message(
      'Unanswered',
      name: 'unAnswered',
      desc: '',
      args: [],
    );
  }

  /// `:count selected`
  String get countSelected {
    return Intl.message(
      ':count selected',
      name: 'countSelected',
      desc: '',
      args: [],
    );
  }

  /// `more`
  String get more {
    return Intl.message(
      'more',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `actions`
  String get actions {
    return Intl.message(
      'actions',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `pdf Min Requirements version :version`
  String get pdfMinRequirements {
    return Intl.message(
      'pdf Min Requirements version :version',
      name: 'pdfMinRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Error unsaved changes`
  String get errorUnsavedChanges {
    return Intl.message(
      'Error unsaved changes',
      name: 'errorUnsavedChanges',
      desc: '',
      args: [],
    );
  }

  /// `Continue editing?`
  String get continueEditing {
    return Intl.message(
      'Continue editing?',
      name: 'continueEditing',
      desc: '',
      args: [],
    );
  }

  /// `Failed to find record!`
  String get failedToFindRecord {
    return Intl.message(
      'Failed to find record!',
      name: 'failedToFindRecord',
      desc: '',
      args: [],
    );
  }

  /// `Refresh data`
  String get refreshData {
    return Intl.message(
      'Refresh data',
      name: 'refreshData',
      desc: '',
      args: [],
    );
  }

  /// `Edit record`
  String get editRecord {
    return Intl.message(
      'Edit record',
      name: 'editRecord',
      desc: '',
      args: [],
    );
  }

  /// `debugModeIsEnabled`
  String get debugModeIsEnabled {
    return Intl.message(
      'debugModeIsEnabled',
      name: 'debugModeIsEnabled',
      desc: '',
      args: [],
    );
  }

  /// `debugModeIsEnabledHelp`
  String get debugModeIsEnabledHelp {
    return Intl.message(
      'debugModeIsEnabledHelp',
      name: 'debugModeIsEnabledHelp',
      desc: '',
      args: [],
    );
  }

  /// `Verify phone number help`
  String get verifyPhoneNumberHelp {
    return Intl.message(
      'Verify phone number help',
      name: 'verifyPhoneNumberHelp',
      desc: '',
      args: [],
    );
  }

  /// `warning`
  String get warning {
    return Intl.message(
      'warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `companyDisabledWarning`
  String get companyDisabledWarning {
    return Intl.message(
      'companyDisabledWarning',
      name: 'companyDisabledWarning',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade`
  String get upgrade {
    return Intl.message(
      'Upgrade',
      name: 'upgrade',
      desc: '',
      args: [],
    );
  }

  /// `cronsNotEnabled`
  String get cronsNotEnabled {
    return Intl.message(
      'cronsNotEnabled',
      name: 'cronsNotEnabled',
      desc: '',
      args: [],
    );
  }

  /// `learnMore`
  String get learnMore {
    return Intl.message(
      'learnMore',
      name: 'learnMore',
      desc: '',
      args: [],
    );
  }

  /// `updateAvailable`
  String get updateAvailable {
    return Intl.message(
      'updateAvailable',
      name: 'updateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `recommendMobile`
  String get recommendMobile {
    return Intl.message(
      'recommendMobile',
      name: 'recommendMobile',
      desc: '',
      args: [],
    );
  }

  /// `recommendDesktop`
  String get recommendDesktop {
    return Intl.message(
      'recommendDesktop',
      name: 'recommendDesktop',
      desc: '',
      args: [],
    );
  }

  /// `download`
  String get download {
    return Intl.message(
      'download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `remindMe`
  String get remindMe {
    return Intl.message(
      'remindMe',
      name: 'remindMe',
      desc: '',
      args: [],
    );
  }

  /// `contactUs`
  String get contactUs {
    return Intl.message(
      'contactUs',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `supportForum`
  String get supportForum {
    return Intl.message(
      'supportForum',
      name: 'supportForum',
      desc: '',
      args: [],
    );
  }

  /// `userGuide`
  String get userGuide {
    return Intl.message(
      'userGuide',
      name: 'userGuide',
      desc: '',
      args: [],
    );
  }

  /// `about`
  String get about {
    return Intl.message(
      'about',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `hideMenu`
  String get hideMenu {
    return Intl.message(
      'hideMenu',
      name: 'hideMenu',
      desc: '',
      args: [],
    );
  }

  /// `showMenu`
  String get showMenu {
    return Intl.message(
      'showMenu',
      name: 'showMenu',
      desc: '',
      args: [],
    );
  }

  /// `viewSettings`
  String get viewSettings {
    return Intl.message(
      'viewSettings',
      name: 'viewSettings',
      desc: '',
      args: [],
    );
  }

  /// `viewLicenses`
  String get viewLicenses {
    return Intl.message(
      'viewLicenses',
      name: 'viewLicenses',
      desc: '',
      args: [],
    );
  }

  /// `documentation`
  String get documentation {
    return Intl.message(
      'documentation',
      name: 'documentation',
      desc: '',
      args: [],
    );
  }

  /// `appPlatforms`
  String get appPlatforms {
    return Intl.message(
      'appPlatforms',
      name: 'appPlatforms',
      desc: '',
      args: [],
    );
  }

  /// `sourceCode`
  String get sourceCode {
    return Intl.message(
      'sourceCode',
      name: 'sourceCode',
      desc: '',
      args: [],
    );
  }

  /// `healthCheck`
  String get healthCheck {
    return Intl.message(
      'healthCheck',
      name: 'healthCheck',
      desc: '',
      args: [],
    );
  }

  /// `updateApp`
  String get updateApp {
    return Intl.message(
      'updateApp',
      name: 'updateApp',
      desc: '',
      args: [],
    );
  }

  /// `forceUpdate`
  String get forceUpdate {
    return Intl.message(
      'forceUpdate',
      name: 'forceUpdate',
      desc: '',
      args: [],
    );
  }

  /// `reviewApp`
  String get reviewApp {
    return Intl.message(
      'reviewApp',
      name: 'reviewApp',
      desc: '',
      args: [],
    );
  }

  /// `send`
  String get send {
    return Intl.message(
      'send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get message {
    return Intl.message(
      'message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `includeRecentErrors`
  String get includeRecentErrors {
    return Intl.message(
      'includeRecentErrors',
      name: 'includeRecentErrors',
      desc: '',
      args: [],
    );
  }

  /// `yourMessageHasBeenReceived`
  String get yourMessageHasBeenReceived {
    return Intl.message(
      'yourMessageHasBeenReceived',
      name: 'yourMessageHasBeenReceived',
      desc: '',
      args: [],
    );
  }

  /// `enabled`
  String get enabled {
    return Intl.message(
      'enabled',
      name: 'enabled',
      desc: '',
      args: [],
    );
  }

  /// `disabled`
  String get disabled {
    return Intl.message(
      'disabled',
      name: 'disabled',
      desc: '',
      args: [],
    );
  }

  /// `Please, select a village!`
  String get pleaseSelectAVillage {
    return Intl.message(
      'Please, select a village!',
      name: 'pleaseSelectAVillage',
      desc: '',
      args: [],
    );
  }

  /// `Created Malaria case`
  String get createdChvMalariaCase {
    return Intl.message(
      'Created Malaria case',
      name: 'createdChvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `Updated Malaria case`
  String get updatedChvMalariaCase {
    return Intl.message(
      'Updated Malaria case',
      name: 'updatedChvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `pending`
  String get pending {
    return Intl.message(
      'pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `editChvMalariaCase`
  String get editChvMalariaCase {
    return Intl.message(
      'editChvMalariaCase',
      name: 'editChvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `basic info`
  String get basicInfo {
    return Intl.message(
      'basic info',
      name: 'basicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Diagnose info`
  String get diagnoseInfo {
    return Intl.message(
      'Diagnose info',
      name: 'diagnoseInfo',
      desc: '',
      args: [],
    );
  }

  /// `Treatment`
  String get treatment {
    return Intl.message(
      'Treatment',
      name: 'treatment',
      desc: '',
      args: [],
    );
  }

  /// `addItem`
  String get addItem {
    return Intl.message(
      'addItem',
      name: 'addItem',
      desc: '',
      args: [],
    );
  }

  /// `comments`
  String get comments {
    return Intl.message(
      'comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `remove`
  String get remove {
    return Intl.message(
      'remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `createNew`
  String get createNew {
    return Intl.message(
      'createNew',
      name: 'createNew',
      desc: '',
      args: [],
    );
  }

  /// `drugsTypes`
  String get drugsTypes {
    return Intl.message(
      'drugsTypes',
      name: 'drugsTypes',
      desc: '',
      args: [],
    );
  }

  /// `Drug type`
  String get drugType {
    return Intl.message(
      'Drug type',
      name: 'drugType',
      desc: '',
      args: [],
    );
  }

  /// `done`
  String get done {
    return Intl.message(
      'done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Please, select an orgUnit`
  String get pleaseSelectAnOrgUnit {
    return Intl.message(
      'Please, select an orgUnit',
      name: 'pleaseSelectAnOrgUnit',
      desc: '',
      args: [],
    );
  }

  /// `Organisation unit`
  String get organisationUnit {
    return Intl.message(
      'Organisation unit',
      name: 'organisationUnit',
      desc: '',
      args: [],
    );
  }

  /// `Village`
  String get village {
    return Intl.message(
      'Village',
      name: 'village',
      desc: '',
      args: [],
    );
  }

  /// `Case No.`
  String get caseNo {
    return Intl.message(
      'Case No.',
      name: 'caseNo',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter a case number!`
  String get pleaseEnterACaseNumber {
    return Intl.message(
      'Please, enter a case number!',
      name: 'pleaseEnterACaseNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter a patient name!`
  String get pleaseEnterAPatientNumber {
    return Intl.message(
      'Please, enter a patient name!',
      name: 'pleaseEnterAPatientNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter patient's age!`
  String get pleaseEnterAge {
    return Intl.message(
      'Please, enter patient\'s age!',
      name: 'pleaseEnterAge',
      desc: '',
      args: [],
    );
  }

  /// `Is this female pregnant?`
  String get isFemalePregnant {
    return Intl.message(
      'Is this female pregnant?',
      name: 'isFemalePregnant',
      desc: '',
      args: [],
    );
  }

  /// `Select one`
  String get selectOne {
    return Intl.message(
      'Select one',
      name: 'selectOne',
      desc: '',
      args: [],
    );
  }

  /// `Locked`
  String get locked {
    return Intl.message(
      'Locked',
      name: 'locked',
      desc: '',
      args: [],
    );
  }

  /// `Authenticate`
  String get authenticate {
    return Intl.message(
      'Authenticate',
      name: 'authenticate',
      desc: '',
      args: [],
    );
  }

  /// `changeToDekstopLayout`
  String get changeToDekstopLayout {
    return Intl.message(
      'changeToDekstopLayout',
      name: 'changeToDekstopLayout',
      desc: '',
      args: [],
    );
  }

  /// `changeToMobileLayout`
  String get changeToMobileLayout {
    return Intl.message(
      'changeToMobileLayout',
      name: 'changeToMobileLayout',
      desc: '',
      args: [],
    );
  }

  /// `change`
  String get change {
    return Intl.message(
      'change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `menuSidebar`
  String get menuSidebar {
    return Intl.message(
      'menuSidebar',
      name: 'menuSidebar',
      desc: '',
      args: [],
    );
  }

  /// `New user`
  String get newUser {
    return Intl.message(
      'New user',
      name: 'newUser',
      desc: '',
      args: [],
    );
  }

  /// `Select a user action`
  String get selectUserAction {
    return Intl.message(
      'Select a user action',
      name: 'selectUserAction',
      desc: '',
      args: [],
    );
  }

  /// `waitForLoading`
  String get waitForLoading {
    return Intl.message(
      'waitForLoading',
      name: 'waitForLoading',
      desc: '',
      args: [],
    );
  }

  /// `waitForSaving`
  String get waitForSaving {
    return Intl.message(
      'waitForSaving',
      name: 'waitForSaving',
      desc: '',
      args: [],
    );
  }

  /// `waitForData`
  String get waitForData {
    return Intl.message(
      'waitForData',
      name: 'waitForData',
      desc: '',
      args: [],
    );
  }

  /// `Recover password email sent`
  String get recoverPasswordEmailSent {
    return Intl.message(
      'Recover password email sent',
      name: 'recoverPasswordEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
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

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your email!`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please, enter your email!',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your password!`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please, enter your password!',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your username!`
  String get pleaseEnterYourUsername {
    return Intl.message(
      'Please, enter your username!',
      name: 'pleaseEnterYourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Show password`
  String get showPassword {
    return Intl.message(
      'Show password',
      name: 'showPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide password`
  String get hidePassword {
    return Intl.message(
      'Hide password',
      name: 'hidePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get passwordIsTooShort {
    return Intl.message(
      'Password is too short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password is too easy`
  String get passwordIsTooEasy {
    return Intl.message(
      'Password is too easy',
      name: 'passwordIsTooEasy',
      desc: '',
      args: [],
    );
  }

  /// `Copy error`
  String get copyError {
    return Intl.message(
      'Copy error',
      name: 'copyError',
      desc: '',
      args: [],
    );
  }

  /// `Recover password`
  String get recoverPassword {
    return Intl.message(
      'Recover password',
      name: 'recoverPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email signUp`
  String get emailSignUp {
    return Intl.message(
      'Email signUp',
      name: 'emailSignUp',
      desc: '',
      args: [],
    );
  }

  /// `microsoftSignUp`
  String get microsoftSignUp {
    return Intl.message(
      'microsoftSignUp',
      name: 'microsoftSignUp',
      desc: '',
      args: [],
    );
  }

  /// `googleSignUp`
  String get googleSignUp {
    return Intl.message(
      'googleSignUp',
      name: 'googleSignUp',
      desc: '',
      args: [],
    );
  }

  /// `emailSignIn`
  String get emailSignIn {
    return Intl.message(
      'emailSignIn',
      name: 'emailSignIn',
      desc: '',
      args: [],
    );
  }

  /// `microsoftSignIn`
  String get microsoftSignIn {
    return Intl.message(
      'microsoftSignIn',
      name: 'microsoftSignIn',
      desc: '',
      args: [],
    );
  }

  /// `googleSignIn`
  String get googleSignIn {
    return Intl.message(
      'googleSignIn',
      name: 'googleSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Simple`
  String get simple {
    return Intl.message(
      'Simple',
      name: 'simple',
      desc: '',
      args: [],
    );
  }

  /// `Severe`
  String get severe {
    return Intl.message(
      'Severe',
      name: 'severe',
      desc: '',
      args: [],
    );
  }

  /// `P.F`
  String get pf {
    return Intl.message(
      'P.F',
      name: 'pf',
      desc: '',
      args: [],
    );
  }

  /// `P.V`
  String get pv {
    return Intl.message(
      'P.V',
      name: 'pv',
      desc: '',
      args: [],
    );
  }

  /// `MIX`
  String get mix {
    return Intl.message(
      'MIX',
      name: 'mix',
      desc: '',
      args: [],
    );
  }

  /// `Invalid`
  String get invalid {
    return Intl.message(
      'Invalid',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `negative`
  String get negative {
    return Intl.message(
      'negative',
      name: 'negative',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `ACT 20`
  String get act20 {
    return Intl.message(
      'ACT 20',
      name: 'act20',
      desc: '',
      args: [],
    );
  }

  /// `ACT 40`
  String get act40 {
    return Intl.message(
      'ACT 40',
      name: 'act40',
      desc: '',
      args: [],
    );
  }

  /// `ACT 60`
  String get act60 {
    return Intl.message(
      'ACT 60',
      name: 'act60',
      desc: '',
      args: [],
    );
  }

  /// `ACT 80`
  String get act80 {
    return Intl.message(
      'ACT 80',
      name: 'act80',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get created {
    return Intl.message(
      'Created',
      name: 'created',
      desc: '',
      args: [],
    );
  }

  /// `Updated`
  String get updated {
    return Intl.message(
      'Updated',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  /// `CreatedBy`
  String get createdBy {
    return Intl.message(
      'CreatedBy',
      name: 'createdBy',
      desc: '',
      args: [],
    );
  }

  /// `Entity state`
  String get entityState {
    return Intl.message(
      'Entity state',
      name: 'entityState',
      desc: '',
      args: [],
    );
  }

  /// `Is synced?`
  String get isSynced {
    return Intl.message(
      'Is synced?',
      name: 'isSynced',
      desc: '',
      args: [],
    );
  }

  /// `Malaria Case`
  String get chvMalariaCase {
    return Intl.message(
      'Malaria Case',
      name: 'chvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `Stock Movement`
  String get chvStockMovement {
    return Intl.message(
      'Stock Movement',
      name: 'chvStockMovement',
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

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Organisation Unit`
  String get orgUnit {
    return Intl.message(
      'Organisation Unit',
      name: 'orgUnit',
      desc: '',
      args: [],
    );
  }

  /// `Chv`
  String get chv {
    return Intl.message(
      'Chv',
      name: 'chv',
      desc: '',
      args: [],
    );
  }

  /// `Stock Type`
  String get stockType {
    return Intl.message(
      'Stock Type',
      name: 'stockType',
      desc: '',
      args: [],
    );
  }

  /// `Person`
  String get person {
    return Intl.message(
      'Person',
      name: 'person',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `New Malaria Case`
  String get newChvMalariaCase {
    return Intl.message(
      'New Malaria Case',
      name: 'newChvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `New Stock Movement`
  String get newChvStockMovement {
    return Intl.message(
      'New Stock Movement',
      name: 'newChvStockMovement',
      desc: '',
      args: [],
    );
  }

  /// `Approve`
  String get approve {
    return Intl.message(
      'Approve',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Disapprove`
  String get disapprove {
    return Intl.message(
      'Disapprove',
      name: 'disapprove',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Malaria Case`
  String get cancelChvMalariaCase {
    return Intl.message(
      'Cancel Malaria Case',
      name: 'cancelChvMalariaCase',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get restore {
    return Intl.message(
      'Restore',
      name: 'restore',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `list`
  String get list {
    return Intl.message(
      'list',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `table`
  String get table {
    return Intl.message(
      'table',
      name: 'table',
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

  /// `Desktop`
  String get desktop {
    return Intl.message(
      'Desktop',
      name: 'desktop',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Unapproved`
  String get unapproved {
    return Intl.message(
      'Unapproved',
      name: 'unapproved',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Patient Name`
  String get patientName {
    return Intl.message(
      'Patient Name',
      name: 'patientName',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get dateOfExamination {
    return Intl.message(
      'Date',
      name: 'dateOfExamination',
      desc: '',
      args: [],
    );
  }

  /// `Is pregnant?`
  String get isPregnant {
    return Intl.message(
      'Is pregnant?',
      name: 'isPregnant',
      desc: '',
      args: [],
    );
  }

  /// `Severity`
  String get severity {
    return Intl.message(
      'Severity',
      name: 'severity',
      desc: '',
      args: [],
    );
  }

  /// `Drugs`
  String get malariaMidGiven {
    return Intl.message(
      'Drugs',
      name: 'malariaMidGiven',
      desc: '',
      args: [],
    );
  }

  /// `subVillage`
  String get subVillage {
    return Intl.message(
      'subVillage',
      name: 'subVillage',
      desc: '',
      args: [],
    );
  }

  /// `comment`
  String get comment {
    return Intl.message(
      'comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `lastSynced`
  String get lastSynced {
    return Intl.message(
      'lastSynced',
      name: 'lastSynced',
      desc: '',
      args: [],
    );
  }

  /// `Search Malaria Cases`
  String get searchChvMalariaCases {
    return Intl.message(
      'Search Malaria Cases',
      name: 'searchChvMalariaCases',
      desc: '',
      args: [],
    );
  }

  /// `Search Stock`
  String get searchStockTypes {
    return Intl.message(
      'Search Stock',
      name: 'searchStockTypes',
      desc: '',
      args: [],
    );
  }

  /// `Search organisation units`
  String get searchOrganisationUnits {
    return Intl.message(
      'Search organisation units',
      name: 'searchOrganisationUnits',
      desc: '',
      args: [],
    );
  }

  /// `Sync`
  String get sync {
    return Intl.message(
      'Sync',
      name: 'sync',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Organisation Units`
  String get organisationUnits {
    return Intl.message(
      'Organisation Units',
      name: 'organisationUnits',
      desc: '',
      args: [],
    );
  }

  /// `C. Health Workers`
  String get chvs {
    return Intl.message(
      'C. Health Workers',
      name: 'chvs',
      desc: '',
      args: [],
    );
  }

  /// `Stock types`
  String get stockTypes {
    return Intl.message(
      'Stock types',
      name: 'stockTypes',
      desc: '',
      args: [],
    );
  }

  /// `:value deleted movements`
  String get deletedChvStockMovements {
    return Intl.message(
      ':value deleted movements',
      name: 'deletedChvStockMovements',
      desc: '',
      args: [],
    );
  }

  /// `deleted Movement`
  String get deletedChvStockMovement {
    return Intl.message(
      'deleted Movement',
      name: 'deletedChvStockMovement',
      desc: '',
      args: [],
    );
  }

  /// `:value sync movements`
  String get syncChvStockMovements {
    return Intl.message(
      ':value sync movements',
      name: 'syncChvStockMovements',
      desc: '',
      args: [],
    );
  }

  /// `sync Movement`
  String get syncChvStockMovement {
    return Intl.message(
      'sync Movement',
      name: 'syncChvStockMovement',
      desc: '',
      args: [],
    );
  }

  /// `Basic Settings`
  String get basicSettings {
    return Intl.message(
      'Basic Settings',
      name: 'basicSettings',
      desc: '',
      args: [],
    );
  }

  /// `and more`
  String get andMore {
    return Intl.message(
      'and more',
      name: 'andMore',
      desc: '',
      args: [],
    );
  }

  /// `syncChv`
  String get syncChv {
    return Intl.message(
      'syncChv',
      name: 'syncChv',
      desc: '',
      args: [],
    );
  }

  /// `syncChvs`
  String get syncChvs {
    return Intl.message(
      'syncChvs',
      name: 'syncChvs',
      desc: '',
      args: [],
    );
  }

  /// `deletedChvs`
  String get deletedChvs {
    return Intl.message(
      'deletedChvs',
      name: 'deletedChvs',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive {
    return Intl.message(
      'Inactive',
      name: 'inactive',
      desc: '',
      args: [],
    );
  }

  /// `New Chv`
  String get newChv {
    return Intl.message(
      'New Chv',
      name: 'newChv',
      desc: '',
      args: [],
    );
  }

  /// `Deleted Chv`
  String get deletedChv {
    return Intl.message(
      'Deleted Chv',
      name: 'deletedChv',
      desc: '',
      args: [],
    );
  }

  /// `couldNotLaunch`
  String get couldNotLaunch {
    return Intl.message(
      'couldNotLaunch',
      name: 'couldNotLaunch',
      desc: '',
      args: [],
    );
  }

  /// `standing`
  String get standing {
    return Intl.message(
      'standing',
      name: 'standing',
      desc: '',
      args: [],
    );
  }

  /// `address`
  String get address {
    return Intl.message(
      'address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `contacts`
  String get contacts {
    return Intl.message(
      'contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `:value deleted user`
  String get deletedUsers {
    return Intl.message(
      ':value deleted user',
      name: 'deletedUsers',
      desc: '',
      args: [],
    );
  }

  /// `Deleted user`
  String get deletedUser {
    return Intl.message(
      'Deleted user',
      name: 'deletedUser',
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

  /// `List View`
  String get listView {
    return Intl.message(
      'List View',
      name: 'listView',
      desc: '',
      args: [],
    );
  }

  /// `Map View`
  String get mapView {
    return Intl.message(
      'Map View',
      name: 'mapView',
      desc: '',
      args: [],
    );
  }

  /// `Table View`
  String get tableView {
    return Intl.message(
      'Table View',
      name: 'tableView',
      desc: '',
      args: [],
    );
  }

  /// `Data Entry`
  String get dataEntry {
    return Intl.message(
      'Data Entry',
      name: 'dataEntry',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Programs`
  String get programs {
    return Intl.message(
      'Programs',
      name: 'programs',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Relationships`
  String get relationships {
    return Intl.message(
      'Relationships',
      name: 'relationships',
      desc: '',
      args: [],
    );
  }

  /// `Show Help`
  String get showHelp {
    return Intl.message(
      'Show Help',
      name: 'showHelp',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `enter_text`
  String get enter_text {
    return Intl.message(
      'enter_text',
      name: 'enter_text',
      desc: '',
      args: [],
    );
  }

  /// `enter_value`
  String get enter_value {
    return Intl.message(
      'enter_value',
      name: 'enter_value',
      desc: '',
      args: [],
    );
  }

  /// `tei`
  String get tei {
    return Intl.message(
      'tei',
      name: 'tei',
      desc: '',
      args: [],
    );
  }

  /// `forms`
  String get forms {
    return Intl.message(
      'forms',
      name: 'forms',
      desc: '',
      args: [],
    );
  }

  /// `ITN`
  String get itn {
    return Intl.message(
      'ITN',
      name: 'itn',
      desc: '',
      args: [],
    );
  }

  /// `IRS`
  String get irs {
    return Intl.message(
      'IRS',
      name: 'irs',
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
