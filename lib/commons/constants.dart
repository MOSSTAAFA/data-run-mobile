class Constants {
  static const String EVENT_PERIOD_TYPE = 'EVENT_PERIOD_TYPE';
  static const String ENROLLMENT_DATE_UID = 'ENROLLMENT_DATE_UID';
  static const String ENROLLMENT_DATE = 'enrollmentDate';
  static const String INCIDENT_DATE = 'incidentDate';
}

const kAppVersion = 'v1.0.0';
const kAppName = 'Flutter Examples';
// final kAppIcon =
// Image.asset('res/images/launcher_icon.png', height: 64.0, width: 64.0);
const String kAppProductionUrl = 'https://nmcpye.org';
const String kAppStagingUrl = 'https://staging.nmcpye.org';
const String kAppLargeTestUrl = 'https://testv5.nmcpye.org';
const String kAppDemoUrl = 'https://demo.nmcpye.org';

const kAppDescription = 'ICCM App.';

// Shared Prefs
const String kSharedPrefs = 'shared_prefs';
const String kSharedPrefUrl = 'url';
const String kSharedPrefToken = 'checksum';

// routes
const String kMain = 'main';
const String kSettings = 'settings';
const String kDashboard = 'dashboard';
const String kReports = 'reports';

// Paths
const kGooglePlayUrl = '';
const kGitHubUrl = 'https://github.com/Hamza-ye/flutter_examples';
const kApiBaseUrl = 'http://localhost:9080';
const kCoverageReportsPath = 'coverage-reports';
const kCoverageDataItemsPath = 'coverage-data_items';
const kTeamsPath = 'teams';
const kTargetsPath = 'targets';
const kChvMalariaCasesPath = 'chv-malaria-cases';
const kOrgUnitApiPath = 'organisation-units';
const kStockTypeApiPath = 'stock-items';
const kUserApiPath = 'account';
const kUserGroupApiPath = 'user-groups';
const kPeopleApiPath = 'user-data';
const kUserAuthGroupApiPath = 'user-authority-groups';
const kChvApiPath = 'chvs';
const kChvTeamApiPath = 'chv-teams';
const kAuthenticationApiPath = 'authenticate';
const kSignupApiPath = 'signup';

// Hive Boxes
const kChvMalariaCasesBoxName = 'chv_malaria_cases_box';
const kOrgUnitsBoxName = 'org_units_box';
const kStockTypesBoxName = 'stock_types_box';
const kChvInfoBoxName = 'chv_info_box';
const kUserInfoBoxName = 'user_info_box';
const kCPeopleInfoBoxName = 'people_info_box';

// Theme
const String kColorThemeLight = 'light';
const String kColorThemeDark = 'dark';

const double kGutterWidth = 16;
const double kLighterOpacity = .6;

// Layout
const double kBorderRadius = 2;
const double kMobileLayoutWidth = 700;
const double kMobileDialogPadding = 12;
const double kDrawerWidthMobile = 272;
const double kDrawerWidthDesktop = 210;
const double kTableColumnGap = 16;
const double kTopBottomBarHeight = 50;
const double kDialogWidth = 400;
const double kDashboardPanelHeight = 543; // TODO remove this
const double kDashboardPanelHeightWeb = 539; // TODO remove this
const double kListNumberWidth = 100;

const double kTabletLayoutWidth = 1100;
const double kTabletDialogPadding = 250;

const double kTableColumnWidthMin = 20;
const double kTableColumnWidthMax = 150;

const int kTableListWidthCutoff = 550;
const int kDefaultAnimationDuration = 500;

const String kDefaultCurrencyId = '1';
const String kDefaultDateFormat = '5';
const String kDefaultAccentColor = '#2F7DC3';
const String kDefaultDarkSelectedColorMenu = '#1E252F';
const String kDefaultDarkSelectedColor = '#253750';
const String kDefaultDarkBorderColor = '#393A3C';
const String kDefaultLightSelectedColorMenu = '#f2faff';
const String kDefaultLightSelectedColor = '#e5f5ff';
const String kDefaultLightBorderColor = '#dfdfdf';

const int kMaxPostSeconds = 60;
const int kMaxRawPostSeconds = 300;
const int kMaxEntitiesPerBulkAction = 100;
const int kHostedRecordsPerPage = 20000;
const int kSelfhostedRecordsPerPage = 5000;
const int kMillisecondsToTimerRefreshData = 1000 * 60 * 5; // 5 minutes
const int kMillisecondsToRefreshData = 1000 * 60 * 15; // 15 minutes
const int kUpdatedAtBufferSeconds = 600;
const int kMillisecondsToRefreshActivities = 1000 * 60 * 60 * 24; // 1 day
const int kMillisecondsToRefreshStaticData = 1000 * 60 * 60 * 24; // 1 day
const int kMillisecondsToDebounceUpdate = 500; // .5 second
const int kMillisecondsToDebounceSave = 1500; // 1.5 seconds
const int kMillisecondsToDebounceWrite = 3000; // 3 seconds

const String kEntityStateSynced = 'synced';
const String kEntityStateDraft = 'draft';
const String kEntityStateCompleted = 'completed';
const String kEntityStateNotCompleted = 'notCompleted';
const String kEntityStateUnSyncable = 'UnSyncable';

const String kFieldTypeSingleLineText = 'single_line_text';
const String kFieldTypeMultiLineText = 'multi_line_text';
const String kFieldTypeDropdown = 'dropdown';
const String kFieldTypeDate = 'date';
const String kFieldTypeSwitch = 'switch';

const String kSwitchValueYes = 'yes';
const String kSwitchValueNo = 'no';

const String kNotificationChannelEmail = 'email';
const String kNotificationChannelSlack = 'slack';

const String kPlatformWindows = 'Windows';
const String kPlatformLinux = 'Linux';
const String kPlatformMacOS = 'macOS';
const String kPlatformAndroid = 'Android';
const String kPlatformiPhone = 'iPhone';

const String kAppleStoreUrl =
    'https://apps.apple.com/us/app/nmcp-ye-v5/kAppStoreAppId';
const String kGoogleStoreUrl =
    'https://play.google.com/store/apps/details?id=kPlayStoreAppId';
const String kGoogleFDroidUrl = 'https://f-droid.org/packages/com.nmcpye.app';
const String kMacOSUrl = 'https://apps.apple.com/app/id1503970375';
const String kLinuxUrl = 'https://snapcraft.io/iccmyemen';
const String kWindowsUrl =
    'https://www.microsoft.com/en-us/p/iccm-yemen/kMicrosoftAppStoreId';

const String kDebugModeUrl =
    'https://www.mailgun.com/blog/a-word-of-caution-for-laravel-developers';
const String kCapterralUrl = 'https://www.capterra.com/p/145215/mass_pro';
const String kCronsHelpUrl =
    'https://iccmyemen.github.io/docs/self-host-troubleshooting/#cron-not-running-queue-not-running';
const String kGitHubDiffUrl =
    'https://github.com/iccmyemen/iccmyemen/compare/vVERSION...v5-stable';
const String kGitHubLangUrl =
    'https://github.com/iccmyemen/iccmyemen/blob/master/resources/lang/en/texts.php';
const String kStatusCheckUrl = 'https://status.nmcpye.com/';
const String kGoogleAnalyticsUrl =
    'https://support.google.com/analytics/answer/1037249?hl=en';

const String kEntityStatusDraft = '1';
const String kEntityStatusSynced = '2';
const String kEntityStatusCompleted = '3';
const String kEntityStatusUncompleted = '4';
const String kEntityStatusUnSynchronizable = '5';

const kChvMalariaCaseStatuses = {
  kEntityStatusDraft: 'draft',
  kEntityStatusSynced: 'sent',
  kEntityStatusCompleted: 'completed',
  kEntityStatusUncompleted: 'uncompleted',
};

const kGenders = {
  'MALE': 'MALE',
  'FEMALE': 'FEMALE',
};

const kMalariaTestResult = {
  'NEGATIVE': 'NEGATIVE',
  'PF': 'PF',
  'PV': 'PV',
  'MIX': 'MIX',
  'INVALID': 'INVALID',
};

const kMalariaSeverity = {
  'SIMPLE': 'SIMPLE',
  'SEVERE': 'SEVERE',
};

const String kDrawerKey = 'drawer_key';
const String kSelectCompanyDropdownKey = 'select_company_dropdown_key';

const String kAppStateStorageKey = 'appStateKey';
const String kUIStateStorageKey = 'uiStateKey';
const String kUserAppStateStorageKey = 'userAppStateKey';
const String kAccountStorageKey = 'accountKey';
const String kAuthStateStorageKey = 'authStateKey';
const String kPrefStateStorageKey = 'prefStateKey';

const List<String> kLanguages = [
  'en',
  'ar',
  'ar_dz',
  'ar_bh',
  'ar_eg',
  'ar_iq',
  'ar_jo',
  'ar_kw',
  'ar_lb',
  'ar_ly',
  'ar_ma',
  'ar_om',
  'ar_qa',
  'ar_sa',
  'ar_sy',
  'ar_tn',
  'ar_ae',
  'ar_ye',
  'en_GB',
  'en_AU',
  'en_US',
];

const String kSettingsUserDetails = 'user_details';
const String kSettingsDeviceSettings = 'device_settings';
const String kSettingsUserManagement = 'user_management';
const String kSettingsUserManagementView = 'user_management/view';
const String kSettingsUserManagementEdit = 'user_management/edit';
const String kSettingsAccountManagement = 'account_management';
const String kSettingsImportExport = 'import_export';