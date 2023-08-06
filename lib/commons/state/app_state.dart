import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/mass_utils/colors.dart';
import '../constants.dart';
import 'pref_state.dart';
import 'ui_state.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required PrefState prefState,
    required bool reportErrors,
    required UIState uiState,
    required bool isLoading,
    required bool isSaving,
    required bool isTesting,
    required bool dismissedNativeWarning,
    required String lastError,
    String? url,
    String? referralCode,
  }) = _AppState;

  factory AppState.initial({
    PrefState? prefState,
    bool? reportErrors,
    String? currentRoute,
  }) =>
      AppState(
        prefState: prefState ?? PrefState.initial(),
        reportErrors: reportErrors ?? false,
        isLoading: false,
        isSaving: false,
        isTesting: false,
        dismissedNativeWarning: false,
        lastError: '',
        // staticState: StaticState(),
        // userAppStates: List(
        //     List<int>.generate(kMaxNumberOfCompanies, (i) => i + 1)
        //         .map((index) => UserState(reportErrors))
        //         .toList()),

        uiState: UIState.initial(
          currentRoute: currentRoute, /* sortFields: prefState?.sortFields */
        ),
      );

  const AppState._();

  @override
  bool get isLoading;

  @override
  bool get isSaving;

  @override
  bool get isTesting;

  @override
  bool get dismissedNativeWarning;

  @override
  String get lastError;

  @override
  PrefState get prefState;

  @override
  UIState get uiState;

  //
  // CompanyEntity get company => userAppState.company;
  //
  // List<CompanyEntity> get companies {
  //   final List<CompanyEntity> list = [];
  //
  //   for (var companyState in userAppStates) {
  //     if (companyState.company != null) {
  //       list.add(companyState.company);
  //     }
  //   }
  //
  //   final companies = list
  //       .where((CompanyEntity company) => (company.id ?? '').isNotEmpty)
  //       .toList();
  //
  //   return companies;
  // }

  // DashboardUIState get dashboardUIState => uiState.dashboardUIState;
  //
  // UserEntity get user => userAppState.user;
  //
  // UserCompanyEntity get userCompany => userAppState.userCompany;

  // Credentials get credentials =>
  //     Credentials(token: userAppState.token.token, url: authState.url);

  bool get hasAccentColor {
    // if (isDemo) {
    //   return true;
    // }

    final color = ''; //userCompany?.settings?.accentColor ?? '';

    if (color == '#ffffff' && !prefState.enableDarkMode) {
      return false;
    }

    return color.isNotEmpty;
  }

  Color? get linkColor => prefState.enableDarkMode
      ? convertHexStringToColor('#FFFFFF')
      : accentColor;

  Color? get headerTextColor => prefState.enableDarkMode || hasAccentColor
      ? convertHexStringToColor('#FFFFFF')
      : convertHexStringToColor('#000000');

  Color? get accentColor {
    var color =
        kDefaultAccentColor; // userCompany?.settings?.accentColor ?? kDefaultAccentColor;

    if (color == '#ffffff' && !prefState.enableDarkMode) {
      color = kDefaultAccentColor;
    } else if (color == '#000000' && prefState.enableDarkMode) {
      color = kDefaultAccentColor;
    }

    return convertHexStringToColor(color);
  }

  // String get appVersion {
  //   String version = 'v';
  //
  //   version += account?.currentVersion ?? '';
  //
  //   if (version.isNotEmpty) {
  //     version += '-';
  //   }
  //
  //   version += getPlatformLetter();
  //   version += kClientVersion.split('.').last;
  //
  //   return version;
  // }

  // List<HistoryRecord> get historyList =>
  //     prefState.companyPrefs[company.id].historyList.where((history) {
  //       final entityMap = getEntityMap(history.entityType);
  //       if (entityMap != null) {
  //         final entity = entityMap[history.id] as Identifiable;
  //         if (entity?.isDeleted == true) {
  //           return false;
  //         }
  //       }
  //       return true;
  //     }).toList();
  //
  // List<HistoryRecord> get unfilteredHistoryList =>
  //     prefState.companyPrefs[company.id].historyList.toList();

  // bool shouldSelectEntity({EntityType entityType, List<String> entityList}) {
  //   final entityUIState = getUIState(entityType);
  //
  //   if (prefState.isMobile ||
  //       !prefState.isPreviewVisible ||
  //       uiState.isEditing ||
  //       (prefState.isModuleList && entityType.hasFullWidthViewer) ||
  //       entityType.isSetting ||
  //       (entityList.isEmpty && (entityUIState.selectedId ?? '').isEmpty)) {
  //     return false;
  //   }
  //
  //   if ((entityUIState.selectedId ?? '').isEmpty ||
  //       !entityList.contains(entityUIState.selectedId)) {
  //     return true;
  //   } else if (unfilteredHistoryList.isNotEmpty &&
  //       uiState.isViewing &&
  //       unfilteredHistoryList.first.entityType != entityType) {
  //     // check if this needs to be added to the history
  //     return null;
  //   }
  //
  //   return false;
  // }

  // Identifiable? getEntity(EntityType type, String id) {
  //   final map = getEntityMap(type);
  //
  //   return map != null ? map[id] : null;
  // }

  // Map<String, Identifiable>? getEntityMap(EntityType type) {
  //   switch (type) {
  //     case EntityType.chvMalariaCase:
  //     // return chvMalariaCaseState.map;
  //     case EntityType.dashboard:
  //     case EntityType.chvStockMovement:
  //     case EntityType.settings:
  //       return null;
  //     default:
  //       print('## ERROR: getEntityMap $type not found');
  //       return null;
  //   }
  // }

  // List<String>? getEntityList(EntityType type) {
  //   switch (type) {
  //     case EntityType.chvMalariaCase:
  //     // return chvMalariaCaseState.list;
  //     case EntityType.dashboard:
  //     case EntityType.chvStockMovement:
  //     case EntityType.settings:
  //       return null;
  //     default:
  //       print('## ERROR: getEntityMap $type not found');
  //       return null;
  //   }
  // }

  // TODO move to each Entity
  SelectionState getUISelection(/* EntityType type */) {
    // final entityUIState = getUIState(type);

    return SelectionState(
      selectedId: null,
      // entityUIState?.forceSelected == true ? entityUIState.selectedId : null,
      filterEntityId: uiState.filterEntityId ?? '',
      // filterEntityType: uiState.filterEntityType,
    );
  }

  // EntityUIState? getUIState(EntityType type) {
  //   switch (type) {
  //     case EntityType.chvMalariaCase:
  //     case EntityType.dashboard:
  //     case EntityType.chvStockMovement:
  //     case EntityType.settings:
  //       return null;
  //     default:
  //       print('## ERROR: getEntityMap $type not found');
  //       return null;
  //   }
  // }

  // ListUIState? getListState(EntityType type) {
  //   return getUIState(type)?.listUIState;
  // }

  // Static States
  // OrganisationUnitState get organisationUnitState =>
  //     userAppState.organisationUnitState;
  //
  // ChvState get chvState => userAppState.chvState;
  //
  // StockTypeState get stockTypeState => userAppState.stockTypeState;

  // ChvMalariaCaseUIState get chvMalariaCaseUIState => uiState.chvMalariaCaseUIState;
  //
  // ListUIState get chvMalariaCaseListState => uiState.chvMalariaCaseUIState.listUIState;

  // bool hasChanges() {
  //   switch (uiState.currentRoute) {
  //     case ClientEditScreen.route:
  //       return hasClientChanges(clientUIState.editing, clientState.map);
  //     case ProductEditScreen.route:
  //       return hasProductChanges(productUIState.editing, productState.map);
  //     case InvoiceEditScreen.route:
  //       return hasInvoiceChanges(invoiceUIState.editing, invoiceState.map);
  //     case PaymentEditScreen.route:
  //       return hasPaymentChanges(paymentUIState.editing, paymentState.map);
  //     case QuoteEditScreen.route:
  //       return hasQuoteChanges(quoteUIState.editing, quoteState.map);
  //     case ProjectEditScreen.route:
  //       return hasProjectChanges(projectUIState.editing, projectState.map);
  //     case TaskEditScreen.route:
  //       return hasTaskChanges(taskUIState.editing, taskState.map);
  //     case VendorEditScreen.route:
  //       return hasVendorChanges(vendorUIState.editing, vendorState.map);
  //     case ExpenseEditScreen.route:
  //       return hasExpenseChanges(expenseUIState.editing, expenseState.map);
  //     case GroupEditScreen.route:
  //       return hasGroupChanges(groupUIState.editing, groupState.map);
  //     case TaxRateEditScreen.route:
  //       return hasTaxRateChanges(taxRateUIState.editing, taxRateState.map);
  //     case CompanyGatewayEditScreen.route:
  //       return hasCompanyGatewayChanges(
  //           companyGatewayUIState.editing, companyGatewayState.map);
  //     case CreditEditScreen.route:
  //       return hasCreditChanges(creditUIState.editing, creditState.map);
  //   // STARTER: has changes - do not remove comment
  //     case PurchaseOrderEditScreen.route:
  //       return hasPurchaseOrderChanges(
  //           purchaseOrderUIState.editing, purchaseOrderState.map);
  //     case RecurringExpenseEditScreen.route:
  //       return hasRecurringExpenseChanges(
  //           recurringExpenseUIState.editing, recurringExpenseState.map);
  //     case SubscriptionEditScreen.route:
  //       return hasSubscriptionChanges(
  //           subscriptionUIState.editing, subscriptionState.map);
  //     case TaskStatusEditScreen.route:
  //       return hasTaskStatusChanges(
  //           taskStatusUIState.editing, taskStatusState.map);
  //     case ExpenseCategoryEditScreen.route:
  //       return hasExpenseCategoryChanges(
  //           expenseCategoryUIState.editing, expenseCategoryState.map);
  //     case RecurringInvoiceEditScreen.route:
  //       return hasRecurringInvoiceChanges(
  //           recurringInvoiceUIState.editing, recurringInvoiceState.map);
  //     case WebhookEditScreen.route:
  //       return hasWebhookChanges(webhookUIState.editing, webhookState.map);
  //     case TokenEditScreen.route:
  //       return hasTokenChanges(tokenUIState.editing, tokenState.map);
  //     case PaymentTermEditScreen.route:
  //       return hasPaymentTermChanges(
  //           paymentTermUIState.editing, paymentTermState.map);
  //     case DesignEditScreen.route:
  //       return hasDesignChanges(designUIState.editing, designState.map);
  //   }
  //
  //   if (uiState.isInSettings) {
  //     return settingsUIState.isChanged;
  //   }
  //
  //   if (uiState.currentRoute.endsWith('/edit')) {
  //     throw 'AppState.hasChanges is not defined for ${uiState.currentRoute}';
  //   }
  //
  //   return false;
  // }
  //
  // bool supportsVersion(String version) {
  //   final parts = version.split('.');
  //   final int major = int.parse(parts[0]);
  //   final int minor = int.parse(parts[1]);
  //   final int patch = int.parse(parts[2]);
  //
  //   try {
  //     final serverParts = account.currentVersion.split('.');
  //     final int serverMajor = int.parse(serverParts[0]);
  //     final int serverMinor = int.parse(serverParts[1]);
  //     final int serverPatch = int.parse(serverParts[2]);
  //
  //     return serverMajor >= major &&
  //         serverMinor >= minor &&
  //         serverPatch >= patch;
  //   } catch (e) {
  //     return false;
  //   }
  // }
  //
  // AppEnvironment get environment {
  //   if (isTesting) {
  //     return AppEnvironment.testing;
  //   } else if (isDemo) {
  //     return AppEnvironment.demo;
  //   } else if (isStaging) {
  //     return AppEnvironment.staging;
  //   } else if (isHosted) {
  //     return AppEnvironment.hosted;
  //   } else {
  //     return AppEnvironment.selfhosted;
  //   }
  // }
  //
  // bool get reportErrors => account?.reportErrors ?? false;
  //
  // int get recordsPerPage =>
  //     isHosted ? kHostedRecordsPerPage : kSelfhostedRecordsPerPage;
  //
  // bool get isHosted => account == null ? authState.isHosted : account.isHosted;
  //
  // bool get isSelfHosted => !isHosted;
  //
  // bool get isDemo => cleanApiUrl(authState.url) == kAppDemoUrl;
  //
  // bool get isStaging => cleanApiUrl(authState.url) == kAppStagingUrl;
  //
  // bool get isWhiteLabeled => account.plan == kPlanWhiteLabel;
  //
  // bool get isProPlan => isEnterprisePlan || account.plan == kPlanPro;
  //
  // bool get isTrial => isHosted && account.isTrial;
  //
  // bool get isEnterprisePlan => isSelfHosted || account.plan == kPlanEnterprise;
  //
  // bool get isPaidAccount =>
  //     isSelfHosted
  //         ? isWhiteLabeled
  //         : ((isProPlan || isEnterprisePlan) && !isTrial);
  //
  // bool get isUpdateAvailable =>
  //     isSelfHosted && account.isUpdateAvailable && userCompany.isAdmin;
  //
  // bool get isUserConfirmed {
  //   if (isSelfHosted) {
  //     return true;
  //   }
  //
  //   return (user.emailVerifiedAt ?? 0) > 0;
  // }
  //
  // int get createdAtLimit {
  //   final numberYearsActive = userCompany.settings?.numberYearsActive ?? 0;
  //
  //   if (!company.isLarge || numberYearsActive == 0) {
  //     return 0;
  //   }
  //
  //   final offset = numberYearsActive * (60 * 60 * 24 * 365);
  //
  //   return (DateTime
  //       .now()
  //       .millisecondsSinceEpoch / 1000).round() - offset;
  // }
  //
  // bool get filterDeletedClients {
  //   if (!company.isLarge) {
  //     return false;
  //   }
  //
  //   return !userCompany.settings.includeDeletedClients;
  // }
  //
  // bool get canAddCompany =>
  //     userCompany.isOwner && companies.length < 10 && !isDemo;
  //
  bool get isMenuCollapsed {
    if (prefState.isMobile) {
      return false;
    }

    return (prefState.isFilterVisible &&
            prefState
                .showMenu /* &&
            !uiState.isInSettings &&
            uiState.filterEntityType != null */
        ) ||
        prefState.isMenuCollapsed;
  }

  bool get isFullScreen {
    bool isFullScreen = false;
    final mainRoute = '/' + uiState.mainRoute;
    final subRoute = uiState.subRoute;
    final isEdit = subRoute == 'edit';
    final isEmail = subRoute == 'email';
    final isPdf = subRoute == 'pdf';

    if (isEmail || isPdf) {
      isFullScreen = true;
    } else if (isEdit) {
      // if (mainRoute == TaskScreen.route) {
      //   isFullScreen = prefState.isEditorFullScreen(EntityType.task);
      // } else if (mainRoute == ClientScreen.route) {
      //   isFullScreen = prefState.isEditorFullScreen(EntityType.client);
      // } else if (mainRoute == VendorScreen.route) {
      //   isFullScreen = prefState.isEditorFullScreen(EntityType.vendor);
      // } else if (mainRoute == ExpenseScreen.route ||
      //     mainRoute == RecurringExpenseScreen.route) {
      //   isFullScreen = prefState.isEditorFullScreen(EntityType.expense);
      // } else {
      // isFullScreen = prefState.isEditorFullScreen(EntityType.chvMalariaCase);
      // }
    }

    // if (DesignEditScreen.route == uiState.currentRoute) {
    //   isFullScreen = true;
    // }

    return isFullScreen;
  }

// bool get hasRecentlyEnteredPassword {
//   if (Config.DEMO_MODE) {
//     return true;
//   }
//
//   if (authState.lastEnteredPasswordAt == 0) {
//     return false;
//   }
//
//   final millisecondsSinceEnteredPassword =
//       DateTime
//           .now()
//           .millisecondsSinceEpoch - authState.lastEnteredPasswordAt;
//
//   return millisecondsSinceEnteredPassword < company.passwordTimeout;
// }

  @override
  String toString() {
    // final staticUpdated =
    // staticState.updatedAt == null || staticState.updatedAt == 0
    //     ? 'Blank'
    //     : timeago.format(
    //     convertTimestampToDate((staticState.updatedAt / 1000).round()));
    //
    // final passwordUpdated = authState.lastEnteredPasswordAt == null ||
    //     authState.lastEnteredPasswordAt == 0
    //     ? 'Blank'
    //     : timeago.format(convertTimestampToDate(
    //     (authState.lastEnteredPasswordAt / 1000).round()));

    return //'\n\nForce: ${clientUIState.forceSelected}'
        //'\n\nURL: ${authState.url}'
        '\nRoute: ${uiState.currentRoute}'
            '\nPrevious: ${uiState.previousRoute}'
            '\nLastError: $lastError'
            '\nPreview: ${uiState.previewStack}'
            '\nFilter: {uiState.filterEntityType} ${uiState.filterEntityId}'
            '\nIs Loading: ${isLoading ? 'Yes' : 'No'}'
            '\nIs Saving: ${isSaving ? 'Yes' : 'No'}'
            // '\nIs Loaded: ${isLoaded ? 'Yes' : 'No'}'
            // '\nUserAppState: ${userAppState.toString()}'
            '\n uiState mainRout: ${uiState.mainRoute}, '
            '\n uiState isEditing: ${uiState.isEditing}, ';
    // '\nis Large: ${(company?.isLarge ?? false) ? 'Yes' : 'No'}'
    // '\nStatic: $staticUpdated${staticState.isStale ? ' [S]' : ''}'
    // '\nPassword: $passwordUpdated${hasRecentlyEnteredPassword
    // ? ''
    // : ' [S]'}'
    // '\nAccent: $hasAccentColor ${userCompany?.settings?.accentColor ?? ''}'
    // '\n';
  }
}

// class Credentials {
//   const Credentials({this.url, this.token});
//
//   final String? url;
//   final String? token;
// }

class SelectionState {
  const SelectionState({
    this.selectedId,
    this.filterEntityId,
    // this.filterEntityType,
  });

  final String? selectedId;
  final String? filterEntityId;
  // final EntityType? filterEntityType;
}
