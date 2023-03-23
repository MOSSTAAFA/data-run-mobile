
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_ar.dart';
import 'app_localization_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'NMCP Yemen'**
  String get appTitle;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'no'**
  String get no;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get delete;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'select'**
  String get select;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'id'**
  String get id;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @shortName.
  ///
  /// In en, this message translates to:
  /// **'Short Name'**
  String get shortName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'quantity'**
  String get quantity;

  /// No description provided for @stockQuantity.
  ///
  /// In en, this message translates to:
  /// **'Stock quantity'**
  String get stockQuantity;

  /// No description provided for @ascending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get ascending;

  /// No description provided for @descending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get descending;

  /// No description provided for @notCompleted.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get notCompleted;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get draft;

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get sent;

  /// No description provided for @synced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get synced;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @editColumns.
  ///
  /// In en, this message translates to:
  /// **'edit columns'**
  String get editColumns;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'reset'**
  String get reset;

  /// No description provided for @multiselect.
  ///
  /// In en, this message translates to:
  /// **'multiselect'**
  String get multiselect;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'filter'**
  String get filter;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @showTable.
  ///
  /// In en, this message translates to:
  /// **'show table'**
  String get showTable;

  /// No description provided for @showList.
  ///
  /// In en, this message translates to:
  /// **'show list'**
  String get showList;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'sort'**
  String get sort;

  /// No description provided for @columns.
  ///
  /// In en, this message translates to:
  /// **'columns'**
  String get columns;

  /// No description provided for @savedSettings.
  ///
  /// In en, this message translates to:
  /// **'savedSettings'**
  String get savedSettings;

  /// No description provided for @addColumn.
  ///
  /// In en, this message translates to:
  /// **'addColumn'**
  String get addColumn;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'loading'**
  String get loading;

  /// No description provided for @filteredBy.
  ///
  /// In en, this message translates to:
  /// **'Filtered by :value'**
  String get filteredBy;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'none'**
  String get none;

  /// No description provided for @clickPlusToAddItem.
  ///
  /// In en, this message translates to:
  /// **'clickPlusToAddItem'**
  String get clickPlusToAddItem;

  /// No description provided for @chvMalariaCases.
  ///
  /// In en, this message translates to:
  /// **'chvMalariaCases'**
  String get chvMalariaCases;

  /// No description provided for @newChvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'New Malaria Case'**
  String get newChvMalariaCase;

  /// No description provided for @chvStockMovements.
  ///
  /// In en, this message translates to:
  /// **'chvStockMovements'**
  String get chvStockMovements;

  /// No description provided for @newChvStockMovement.
  ///
  /// In en, this message translates to:
  /// **'New Stock Movement'**
  String get newChvStockMovement;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @noRecordSelected.
  ///
  /// In en, this message translates to:
  /// **'No record selected'**
  String get noRecordSelected;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @refreshComplete.
  ///
  /// In en, this message translates to:
  /// **'Refresh Complete'**
  String get refreshComplete;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'error'**
  String get error;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @whyAreYouLeaving.
  ///
  /// In en, this message translates to:
  /// **'Why are you leaving?'**
  String get whyAreYouLeaving;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok!'**
  String get ok;

  /// No description provided for @pleaseTypeToConfirm.
  ///
  /// In en, this message translates to:
  /// **'Please, type to confirm'**
  String get pleaseTypeToConfirm;

  /// No description provided for @discardChanges.
  ///
  /// In en, this message translates to:
  /// **'Discard changes?'**
  String get discardChanges;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @uploadedDocument.
  ///
  /// In en, this message translates to:
  /// **'Uploaded document'**
  String get uploadedDocument;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @malariaTestResult.
  ///
  /// In en, this message translates to:
  /// **'Test result'**
  String get malariaTestResult;

  /// No description provided for @malariaMidsGiven.
  ///
  /// In en, this message translates to:
  /// **'Malaria drugs given'**
  String get malariaMidsGiven;

  /// No description provided for @testBarImage.
  ///
  /// In en, this message translates to:
  /// **'Test bar image'**
  String get testBarImage;

  /// No description provided for @severity.
  ///
  /// In en, this message translates to:
  /// **'Severity'**
  String get severity;

  /// No description provided for @referral.
  ///
  /// In en, this message translates to:
  /// **'Referral'**
  String get referral;

  /// No description provided for @syncChvMalariaCases.
  ///
  /// In en, this message translates to:
  /// **'Sync chv Malaria Cases'**
  String get syncChvMalariaCases;

  /// No description provided for @syncChvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'Sync chv Malaria Case'**
  String get syncChvMalariaCase;

  /// No description provided for @deletedChvMalariaCases.
  ///
  /// In en, this message translates to:
  /// **'Deleted chv Malaria Cases'**
  String get deletedChvMalariaCases;

  /// No description provided for @deletedChvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'Deleted chv Malaria Case'**
  String get deletedChvMalariaCase;

  /// No description provided for @unAnswered.
  ///
  /// In en, this message translates to:
  /// **'Unanswered'**
  String get unAnswered;

  /// No description provided for @countSelected.
  ///
  /// In en, this message translates to:
  /// **':count selected'**
  String get countSelected;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'more'**
  String get more;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'actions'**
  String get actions;

  /// No description provided for @pdfMinRequirements.
  ///
  /// In en, this message translates to:
  /// **'pdf Min Requirements version :version'**
  String get pdfMinRequirements;

  /// No description provided for @errorUnsavedChanges.
  ///
  /// In en, this message translates to:
  /// **'Error unsaved changes'**
  String get errorUnsavedChanges;

  /// No description provided for @continueEditing.
  ///
  /// In en, this message translates to:
  /// **'Continue editing?'**
  String get continueEditing;

  /// No description provided for @failedToFindRecord.
  ///
  /// In en, this message translates to:
  /// **'Failed to find record!'**
  String get failedToFindRecord;

  /// No description provided for @refreshData.
  ///
  /// In en, this message translates to:
  /// **'Refresh data'**
  String get refreshData;

  /// No description provided for @editRecord.
  ///
  /// In en, this message translates to:
  /// **'Edit record'**
  String get editRecord;

  /// No description provided for @debugModeIsEnabled.
  ///
  /// In en, this message translates to:
  /// **'debugModeIsEnabled'**
  String get debugModeIsEnabled;

  /// No description provided for @debugModeIsEnabledHelp.
  ///
  /// In en, this message translates to:
  /// **'debugModeIsEnabledHelp'**
  String get debugModeIsEnabledHelp;

  /// No description provided for @verifyPhoneNumberHelp.
  ///
  /// In en, this message translates to:
  /// **'Verify phone number help'**
  String get verifyPhoneNumberHelp;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'warning'**
  String get warning;

  /// No description provided for @companyDisabledWarning.
  ///
  /// In en, this message translates to:
  /// **'companyDisabledWarning'**
  String get companyDisabledWarning;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgrade;

  /// No description provided for @cronsNotEnabled.
  ///
  /// In en, this message translates to:
  /// **'cronsNotEnabled'**
  String get cronsNotEnabled;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'learnMore'**
  String get learnMore;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'updateAvailable'**
  String get updateAvailable;

  /// No description provided for @recommendMobile.
  ///
  /// In en, this message translates to:
  /// **'recommendMobile'**
  String get recommendMobile;

  /// No description provided for @recommendDesktop.
  ///
  /// In en, this message translates to:
  /// **'recommendDesktop'**
  String get recommendDesktop;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'download'**
  String get download;

  /// No description provided for @remindMe.
  ///
  /// In en, this message translates to:
  /// **'remindMe'**
  String get remindMe;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'contactUs'**
  String get contactUs;

  /// No description provided for @supportForum.
  ///
  /// In en, this message translates to:
  /// **'supportForum'**
  String get supportForum;

  /// No description provided for @userGuide.
  ///
  /// In en, this message translates to:
  /// **'userGuide'**
  String get userGuide;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'about'**
  String get about;

  /// No description provided for @hideMenu.
  ///
  /// In en, this message translates to:
  /// **'hideMenu'**
  String get hideMenu;

  /// No description provided for @showMenu.
  ///
  /// In en, this message translates to:
  /// **'showMenu'**
  String get showMenu;

  /// No description provided for @viewSettings.
  ///
  /// In en, this message translates to:
  /// **'viewSettings'**
  String get viewSettings;

  /// No description provided for @viewLicenses.
  ///
  /// In en, this message translates to:
  /// **'viewLicenses'**
  String get viewLicenses;

  /// No description provided for @documentation.
  ///
  /// In en, this message translates to:
  /// **'documentation'**
  String get documentation;

  /// No description provided for @appPlatforms.
  ///
  /// In en, this message translates to:
  /// **'appPlatforms'**
  String get appPlatforms;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'sourceCode'**
  String get sourceCode;

  /// No description provided for @desktop.
  ///
  /// In en, this message translates to:
  /// **'Desktop'**
  String get desktop;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @healthCheck.
  ///
  /// In en, this message translates to:
  /// **'healthCheck'**
  String get healthCheck;

  /// No description provided for @updateApp.
  ///
  /// In en, this message translates to:
  /// **'updateApp'**
  String get updateApp;

  /// No description provided for @forceUpdate.
  ///
  /// In en, this message translates to:
  /// **'forceUpdate'**
  String get forceUpdate;

  /// No description provided for @reviewApp.
  ///
  /// In en, this message translates to:
  /// **'reviewApp'**
  String get reviewApp;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'send'**
  String get send;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'from'**
  String get from;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'message'**
  String get message;

  /// No description provided for @includeRecentErrors.
  ///
  /// In en, this message translates to:
  /// **'includeRecentErrors'**
  String get includeRecentErrors;

  /// No description provided for @yourMessageHasBeenReceived.
  ///
  /// In en, this message translates to:
  /// **'yourMessageHasBeenReceived'**
  String get yourMessageHasBeenReceived;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'enabled'**
  String get enabled;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'disabled'**
  String get disabled;

  /// No description provided for @pleaseSelectAVillage.
  ///
  /// In en, this message translates to:
  /// **'Please, select a village!'**
  String get pleaseSelectAVillage;

  /// No description provided for @createdChvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'Created Malaria case'**
  String get createdChvMalariaCase;

  /// No description provided for @updatedChvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'Updated Malaria case'**
  String get updatedChvMalariaCase;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'pending'**
  String get pending;

  /// No description provided for @editChvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'editChvMalariaCase'**
  String get editChvMalariaCase;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'details'**
  String get details;

  /// No description provided for @basicInfo.
  ///
  /// In en, this message translates to:
  /// **'basic info'**
  String get basicInfo;

  /// No description provided for @diagnoseInfo.
  ///
  /// In en, this message translates to:
  /// **'Diagnose info'**
  String get diagnoseInfo;

  /// No description provided for @treatment.
  ///
  /// In en, this message translates to:
  /// **'Treatment'**
  String get treatment;

  /// No description provided for @addItem.
  ///
  /// In en, this message translates to:
  /// **'addItem'**
  String get addItem;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'comments'**
  String get comments;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'remove'**
  String get remove;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'createNew'**
  String get createNew;

  /// No description provided for @drugsTypes.
  ///
  /// In en, this message translates to:
  /// **'drugsTypes'**
  String get drugsTypes;

  /// No description provided for @drugType.
  ///
  /// In en, this message translates to:
  /// **'Drug type'**
  String get drugType;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'done'**
  String get done;

  /// No description provided for @pleaseSelectAnOrgUnit.
  ///
  /// In en, this message translates to:
  /// **'Please, select an orgUnit'**
  String get pleaseSelectAnOrgUnit;

  /// No description provided for @organisationUnit.
  ///
  /// In en, this message translates to:
  /// **'Organisation unit'**
  String get organisationUnit;

  /// No description provided for @village.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get village;

  /// No description provided for @caseNo.
  ///
  /// In en, this message translates to:
  /// **'Case No.'**
  String get caseNo;

  /// No description provided for @pleaseEnterACaseNumber.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a case number!'**
  String get pleaseEnterACaseNumber;

  /// No description provided for @pleaseEnterAPatientNumber.
  ///
  /// In en, this message translates to:
  /// **'Please, enter a patient name!'**
  String get pleaseEnterAPatientNumber;

  /// No description provided for @pleaseEnterAge.
  ///
  /// In en, this message translates to:
  /// **'Please, enter patient\'s age!'**
  String get pleaseEnterAge;

  /// No description provided for @isFemalePregnant.
  ///
  /// In en, this message translates to:
  /// **'Is this female pregnant?'**
  String get isFemalePregnant;

  /// No description provided for @selectOne.
  ///
  /// In en, this message translates to:
  /// **'Select one'**
  String get selectOne;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @authenticate.
  ///
  /// In en, this message translates to:
  /// **'Authenticate'**
  String get authenticate;

  /// No description provided for @changeToDekstopLayout.
  ///
  /// In en, this message translates to:
  /// **'changeToDekstopLayout'**
  String get changeToDekstopLayout;

  /// No description provided for @changeToMobileLayout.
  ///
  /// In en, this message translates to:
  /// **'changeToMobileLayout'**
  String get changeToMobileLayout;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'change'**
  String get change;

  /// No description provided for @menuSidebar.
  ///
  /// In en, this message translates to:
  /// **'menuSidebar'**
  String get menuSidebar;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @newUser.
  ///
  /// In en, this message translates to:
  /// **'New user'**
  String get newUser;

  /// No description provided for @selectUserAction.
  ///
  /// In en, this message translates to:
  /// **'Select a user action'**
  String get selectUserAction;

  /// No description provided for @waitForLoading.
  ///
  /// In en, this message translates to:
  /// **'waitForLoading'**
  String get waitForLoading;

  /// No description provided for @waitForSaving.
  ///
  /// In en, this message translates to:
  /// **'waitForSaving'**
  String get waitForSaving;

  /// No description provided for @waitForData.
  ///
  /// In en, this message translates to:
  /// **'waitForData'**
  String get waitForData;

  /// No description provided for @recoverPasswordEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Recover password email sent'**
  String get recoverPasswordEmailSent;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pleaseEnterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please, enter your email!'**
  String get pleaseEnterYourEmail;

  /// No description provided for @pleaseEnterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Please, enter your password!'**
  String get pleaseEnterYourPassword;

  /// No description provided for @pleaseEnterYourUsername.
  ///
  /// In en, this message translates to:
  /// **'Please, enter your username!'**
  String get pleaseEnterYourUsername;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get hidePassword;

  /// No description provided for @passwordIsTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password is too short'**
  String get passwordIsTooShort;

  /// No description provided for @passwordIsTooEasy.
  ///
  /// In en, this message translates to:
  /// **'Password is too easy'**
  String get passwordIsTooEasy;

  /// No description provided for @copyError.
  ///
  /// In en, this message translates to:
  /// **'Copy error'**
  String get copyError;

  /// No description provided for @recoverPassword.
  ///
  /// In en, this message translates to:
  /// **'Recover password'**
  String get recoverPassword;

  /// No description provided for @emailSignUp.
  ///
  /// In en, this message translates to:
  /// **'Email signUp'**
  String get emailSignUp;

  /// No description provided for @microsoftSignUp.
  ///
  /// In en, this message translates to:
  /// **'microsoftSignUp'**
  String get microsoftSignUp;

  /// No description provided for @googleSignUp.
  ///
  /// In en, this message translates to:
  /// **'googleSignUp'**
  String get googleSignUp;

  /// No description provided for @emailSignIn.
  ///
  /// In en, this message translates to:
  /// **'emailSignIn'**
  String get emailSignIn;

  /// No description provided for @microsoftSignIn.
  ///
  /// In en, this message translates to:
  /// **'microsoftSignIn'**
  String get microsoftSignIn;

  /// No description provided for @googleSignIn.
  ///
  /// In en, this message translates to:
  /// **'googleSignIn'**
  String get googleSignIn;

  /// No description provided for @simple.
  ///
  /// In en, this message translates to:
  /// **'Simple'**
  String get simple;

  /// No description provided for @severe.
  ///
  /// In en, this message translates to:
  /// **'Severe'**
  String get severe;

  /// No description provided for @pf.
  ///
  /// In en, this message translates to:
  /// **'P.F'**
  String get pf;

  /// No description provided for @pv.
  ///
  /// In en, this message translates to:
  /// **'P.V'**
  String get pv;

  /// No description provided for @mix.
  ///
  /// In en, this message translates to:
  /// **'MIX'**
  String get mix;

  /// No description provided for @invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid'**
  String get invalid;

  /// No description provided for @negative.
  ///
  /// In en, this message translates to:
  /// **'negative'**
  String get negative;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @act20.
  ///
  /// In en, this message translates to:
  /// **'ACT 20'**
  String get act20;

  /// No description provided for @act40.
  ///
  /// In en, this message translates to:
  /// **'ACT 40'**
  String get act40;

  /// No description provided for @act60.
  ///
  /// In en, this message translates to:
  /// **'ACT 60'**
  String get act60;

  /// No description provided for @act80.
  ///
  /// In en, this message translates to:
  /// **'ACT 80'**
  String get act80;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @updated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get updated;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'CreatedBy'**
  String get createdBy;

  /// No description provided for @entityState.
  ///
  /// In en, this message translates to:
  /// **'Entity state'**
  String get entityState;

  /// No description provided for @isSynced.
  ///
  /// In en, this message translates to:
  /// **'Is synced?'**
  String get isSynced;

  /// No description provided for @chvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'Malaria Case'**
  String get chvMalariaCase;

  /// No description provided for @chvStockMovement.
  ///
  /// In en, this message translates to:
  /// **'Stock Movement'**
  String get chvStockMovement;

  /// No description provided for @orgUnit.
  ///
  /// In en, this message translates to:
  /// **'Organisation Unit'**
  String get orgUnit;

  /// No description provided for @chv.
  ///
  /// In en, this message translates to:
  /// **'Chv'**
  String get chv;

  /// No description provided for @stockType.
  ///
  /// In en, this message translates to:
  /// **'Stock Type'**
  String get stockType;

  /// No description provided for @person.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get person;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @disapprove.
  ///
  /// In en, this message translates to:
  /// **'Disapprove'**
  String get disapprove;

  /// No description provided for @cancelChvMalariaCase.
  ///
  /// In en, this message translates to:
  /// **'Cancel Malaria Case'**
  String get cancelChvMalariaCase;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @unapproved.
  ///
  /// In en, this message translates to:
  /// **'Unapproved'**
  String get unapproved;

  /// No description provided for @list.
  ///
  /// In en, this message translates to:
  /// **'list'**
  String get list;

  /// No description provided for @table.
  ///
  /// In en, this message translates to:
  /// **'table'**
  String get table;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @patientName.
  ///
  /// In en, this message translates to:
  /// **'Patient Name'**
  String get patientName;

  /// No description provided for @dateOfExamination.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateOfExamination;

  /// No description provided for @isPregnant.
  ///
  /// In en, this message translates to:
  /// **'Is pregnant?'**
  String get isPregnant;

  /// No description provided for @malariaMidGiven.
  ///
  /// In en, this message translates to:
  /// **'Drugs'**
  String get malariaMidGiven;

  /// No description provided for @subVillage.
  ///
  /// In en, this message translates to:
  /// **'subVillage'**
  String get subVillage;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'comment'**
  String get comment;

  /// No description provided for @lastSynced.
  ///
  /// In en, this message translates to:
  /// **'lastSynced'**
  String get lastSynced;

  /// No description provided for @searchChvMalariaCases.
  ///
  /// In en, this message translates to:
  /// **'Search Malaria Cases'**
  String get searchChvMalariaCases;

  /// No description provided for @searchStockTypes.
  ///
  /// In en, this message translates to:
  /// **'Search Stock'**
  String get searchStockTypes;

  /// No description provided for @searchOrganisationUnits.
  ///
  /// In en, this message translates to:
  /// **'Search organisation units'**
  String get searchOrganisationUnits;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @reports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// No description provided for @organisationUnits.
  ///
  /// In en, this message translates to:
  /// **'Organisation Units'**
  String get organisationUnits;

  /// No description provided for @chvs.
  ///
  /// In en, this message translates to:
  /// **'C. Health Workers'**
  String get chvs;

  /// No description provided for @stockTypes.
  ///
  /// In en, this message translates to:
  /// **'Stock types'**
  String get stockTypes;

  /// No description provided for @deletedChvStockMovements.
  ///
  /// In en, this message translates to:
  /// **':value deleted movements'**
  String get deletedChvStockMovements;

  /// No description provided for @deletedChvStockMovement.
  ///
  /// In en, this message translates to:
  /// **'deleted Movement'**
  String get deletedChvStockMovement;

  /// No description provided for @syncChvStockMovements.
  ///
  /// In en, this message translates to:
  /// **':value sync movements'**
  String get syncChvStockMovements;

  /// No description provided for @syncChvStockMovement.
  ///
  /// In en, this message translates to:
  /// **'sync Movement'**
  String get syncChvStockMovement;

  /// No description provided for @basicSettings.
  ///
  /// In en, this message translates to:
  /// **'Basic Settings'**
  String get basicSettings;

  /// No description provided for @andMore.
  ///
  /// In en, this message translates to:
  /// **'and more'**
  String get andMore;

  /// No description provided for @syncChv.
  ///
  /// In en, this message translates to:
  /// **'syncChv'**
  String get syncChv;

  /// No description provided for @syncChvs.
  ///
  /// In en, this message translates to:
  /// **'syncChvs'**
  String get syncChvs;

  /// No description provided for @deletedChvs.
  ///
  /// In en, this message translates to:
  /// **'deletedChvs'**
  String get deletedChvs;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @newChv.
  ///
  /// In en, this message translates to:
  /// **'New Chv'**
  String get newChv;

  /// No description provided for @deletedChv.
  ///
  /// In en, this message translates to:
  /// **'Deleted Chv'**
  String get deletedChv;

  /// No description provided for @couldNotLaunch.
  ///
  /// In en, this message translates to:
  /// **'couldNotLaunch'**
  String get couldNotLaunch;

  /// No description provided for @standing.
  ///
  /// In en, this message translates to:
  /// **'standing'**
  String get standing;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'address'**
  String get address;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'contacts'**
  String get contacts;

  /// No description provided for @deletedUsers.
  ///
  /// In en, this message translates to:
  /// **':value deleted user'**
  String get deletedUsers;

  /// No description provided for @deletedUser.
  ///
  /// In en, this message translates to:
  /// **'Deleted user'**
  String get deletedUser;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
