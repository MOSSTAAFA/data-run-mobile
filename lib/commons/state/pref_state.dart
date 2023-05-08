import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants.dart';
import '../utils/color_theme_model.dart';
import '../utils/module_layout.dart';

part 'pref_state.freezed.dart';

@freezed
abstract class PrefState with _$PrefState {
  const factory PrefState({
    required AppLayout appLayout,
    required ModuleLayout moduleLayout,
    required bool isPreviewVisible,
    // required Map<EntityType, bool> useSidebarEditor,
    // required Map<EntityType, bool> useSidebarViewer,
    // required AppSidebarMode menuSidebarMode,
    // required AppSidebarMode historySidebarMode,
    required int rowsPerPage,
    required bool isMenuVisible,
    required bool isHistoryVisible,
    required bool enableDarkMode,
    required bool enableFlexibleSearch,
    required bool editAfterSaving,
    required bool requireAuthentication,
    required String colorTheme,
    required bool enableTouchEvents,
    required bool enableTooltips,
    required bool enableJSPDF,
    required bool isFilterVisible,
    required double textScaleFactor,
    required bool longPressSelectionIsDefault,
    required bool tapSelectedToEdit,
    required bool hideDesktopWarning,
    required bool hideGatewayWarning,
    required bool hideReviewApp,
    required bool showKanban,
    required bool showPdfPreview,
    required bool persistData,
    required bool persistUI,
    // required Map<String, UserPrefState> userPrefs,
    // required Map<EntityType, PrefStateSortField> sortFields,
    // required Map<String, List<String>> tableColumns,
    required Map<String, String> customColors,
  }) = _PrefState;

  factory PrefState.initial({
    AppLayout? appLayout,
    ModuleLayout? moduleLayout,
    bool? isPreviewVisible,
    // Map<EntityType, bool>? useSidebarEditor,
    // Map<EntityType, bool>? useSidebarViewer,
    // AppSidebarMode? menuSidebarMode,
    // AppSidebarMode? historySidebarMode,
    int? rowsPerPage,
    bool? isMenuVisible,
    bool? isHistoryVisible,
    bool? enableDarkMode,
    bool? enableFlexibleSearch,
    bool? editAfterSaving,
    bool? requireAuthentication,
    String? colorTheme,
    bool? enableTouchEvents,
    bool? enableTooltips,
    bool? enableJSPDF,
    bool? isFilterVisible,
    double? textScaleFactor,
    bool? longPressSelectionIsDefault,
    bool? tapSelectedToEdit,
    bool? hideDesktopWarning,
    bool? hideGatewayWarning,
    bool? hideReviewApp,
    bool? showKanban,
    bool? showPdfPreview,
    bool? persistData,
    bool? persistUI,
    // Map<String, UserPrefState>? userPrefs,
    // Map<EntityType, PrefStateSortField>? sortFields,
    Map<String, List<String>>? tableColumns,
    Map<String, String>? customColors,
  }) {
    return PrefState(
      moduleLayout: moduleLayout ?? ModuleLayout.list,
      appLayout: appLayout ?? AppLayout.mobile,
      isPreviewVisible: isPreviewVisible ?? false,
      rowsPerPage: rowsPerPage ?? 20,
      isMenuVisible: isMenuVisible ?? true,
      isHistoryVisible: isHistoryVisible ?? false,
      enableDarkMode: enableDarkMode ?? false,
      enableFlexibleSearch: enableFlexibleSearch ?? false,
      editAfterSaving: editAfterSaving ?? true,
      requireAuthentication: requireAuthentication ?? false,
      colorTheme: colorTheme ?? kColorThemeLight,
      enableTouchEvents: enableTouchEvents ?? true,
      enableTooltips: enableTooltips ?? true,
      enableJSPDF: enableJSPDF ?? false,
      isFilterVisible: isFilterVisible ?? false,
      textScaleFactor: textScaleFactor ?? 1,
      longPressSelectionIsDefault: longPressSelectionIsDefault ?? true,
      tapSelectedToEdit: tapSelectedToEdit ?? false,
      hideDesktopWarning: hideDesktopWarning ?? false,
      hideGatewayWarning: hideGatewayWarning ?? false,
      hideReviewApp: hideReviewApp ?? false,
      showKanban: showKanban ?? false,
      showPdfPreview: showPdfPreview ?? true,
      persistData: persistData ?? true,
      persistUI: persistUI ?? true,
      customColors: customColors ?? CONTRAST_COLORS,
    );
  }

  const PrefState._();

  // static const Map<EntityType, PrefStateSortField> DEFAULT_SORT_FIELDS =
  //     <EntityType, PrefStateSortField>{
  //   EntityType.chvMalariaCase: PrefStateSortField(
  //       field: D2EventFields.event, ascending: true)
  //   // EntityType.chvStockMovement:
  //   //     PrefStateSortField(field: ChvStockMovementFields.date, ascending: true),
  // };

  // static const Map<String, List<String>> DEFAULT_TABLE_COLUMNS =
  //     <String, List<String>>{
  //   'event': [
  //     D2EventFields.approved,
  //     D2EventFields.date,
  //     D2EventFields.event,
  //   ],
  //   // EntityType.chvStockMovement:
  //   //
  // };

  static const TEXT_SCALING_SMALL = 0.8;
  static const TEXT_SCALING_NORMAL = 1.0;
  static const TEXT_SCALING_LARGE = 1.2;
  static const TEXT_SCALING_EXTRA_LARGE = 1.4;

  static const THEME_SIDEBAR_ACTIVE_BACKGROUND_COLOR =
      'sidebar_active_background_color';
  static const THEME_SIDEBAR_ACTIVE_FONT_COLOR = 'sidebar_active_font_color';
  static const THEME_SIDEBAR_INACTIVE_BACKGROUND_COLOR =
      'sidebar_inactive_background_color';
  static const THEME_SIDEBAR_INACTIVE_FONT_COLOR =
      'sidebar_inactive_font_color';
  static const THEME_INVOICE_HEADER_BACKGROUND_COLOR =
      'invoice_header_background_color';
  static const THEME_INVOICE_HEADER_FONT_COLOR = 'invoice_header_font_color';
  static const THEME_TABLE_ALTERNATE_ROW_BACKGROUND_COLOR =
      'table_alternate_row_background_color';

  static const THEME_COLORS = [
    PrefState.THEME_SIDEBAR_ACTIVE_BACKGROUND_COLOR,
    PrefState.THEME_SIDEBAR_ACTIVE_FONT_COLOR,
    PrefState.THEME_SIDEBAR_INACTIVE_BACKGROUND_COLOR,
    PrefState.THEME_SIDEBAR_INACTIVE_FONT_COLOR,
    PrefState.THEME_INVOICE_HEADER_BACKGROUND_COLOR,
    PrefState.THEME_INVOICE_HEADER_FONT_COLOR,
    PrefState.THEME_TABLE_ALTERNATE_ROW_BACKGROUND_COLOR,
  ];

  static const CONTRAST_COLORS = {
    PrefState.THEME_SIDEBAR_ACTIVE_BACKGROUND_COLOR: '#2F2E2E',
    PrefState.THEME_SIDEBAR_ACTIVE_FONT_COLOR: '#FFFFFF',
    PrefState.THEME_SIDEBAR_INACTIVE_BACKGROUND_COLOR: '#454544',
    PrefState.THEME_SIDEBAR_INACTIVE_FONT_COLOR: '#FFFFFF',
    PrefState.THEME_INVOICE_HEADER_BACKGROUND_COLOR: '#777777',
    PrefState.THEME_INVOICE_HEADER_FONT_COLOR: '#FFFFFF',
    PrefState.THEME_TABLE_ALTERNATE_ROW_BACKGROUND_COLOR: '#e8eced',
  };

  AppLayout get appLayout;

  ModuleLayout get moduleLayout;

  // AppSidebarMode get menuSidebarMode;

  // AppSidebarMode get historySidebarMode;

  // Map<EntityType, bool> get useSidebarEditor;

  // Map<EntityType, bool> get useSidebarViewer;

  Map<String, String> get customColors;

  bool get isPreviewVisible;

  bool get isMenuVisible;

  bool get showKanban;

  bool get showPdfPreview;

  bool get enableTouchEvents;

  bool get enableFlexibleSearch;

  bool get isHistoryVisible;

  bool get enableDarkMode;

  bool get isFilterVisible;

  bool get persistData;

  bool get persistUI;

  bool get longPressSelectionIsDefault;

  bool get requireAuthentication;

  bool get tapSelectedToEdit;

  bool get enableJSPDF;

  int get rowsPerPage;

  bool get enableTooltips;

  String get colorTheme;

  bool get hideDesktopWarning;

  bool get hideGatewayWarning;

  bool get hideReviewApp;

  bool get editAfterSaving;

  double get textScaleFactor;

  // Map<EntityType, PrefStateSortField> get sortFields;

  ColorTheme get colorThemeModel => colorThemesMap.containsKey(colorTheme)
      ? colorThemesMap[colorTheme]!
      : colorThemesMap[kColorThemeLight]!;

  bool get isDesktop => appLayout == AppLayout.desktop;

  // bool isEditorFullScreen(EntityType entityType) {
  //   if (!isDesktop) {
  //     return false;
  //   }

  //   if ([EntityType.chvMalariaCase].contains(entityType)) {
  //     return false;
  //   }

  //   // return !(useSidebarEditor[entityType.baseType] ?? false);
  //   return true;
  // }

  // List<String>? getTableColumns(EntityType entityType) {
  //   if (tableColumns != null && tableColumns.containsKey('$entityType')) {
  //     return tableColumns['$entityType']?.toList();
  //   } else {
  //     return null;
  //   }
  // }

  // bool isViewerFullScreen(EntityType? entityType) {
  //   if (!isDesktop || entityType == null) {
  //     return false;
  //   }
  //
  //   if (!entityType.hasFullWidthViewer) {
  //     return false;
  //   }
  //
  //   return !(useSidebarViewer[entityType.baseType] ?? false);
  // }

  bool get isNotDesktop => !isDesktop;

  bool get isMobile => appLayout == AppLayout.mobile;

  bool get isNotMobile => !isMobile;

  bool get isModuleList => moduleLayout == ModuleLayout.list;

  bool get isModuleTable => !isModuleList;

  // bool get isMenuFloated =>
  //     appLayout == AppLayout.mobile || menuSidebarMode == AppSidebarMode.float;

  bool get isHistoryFloated =>
      appLayout ==
      AppLayout
          .mobile /* ||
      historySidebarMode == AppSidebarMode.float */
      ;

  bool get showMenu =>
      (isMenuVisible /* && menuSidebarMode == AppSidebarMode.visible */) /*  ||
      menuSidebarMode == AppSidebarMode.collapse */
      ;

  bool get showHistory =>
      isHistoryVisible /* && historySidebarMode == AppSidebarMode.visible */;

  bool get isMenuCollapsed =>
      isNotMobile &&
      // menuSidebarMode == AppSidebarMode.collapse &&
      !isMenuVisible;
}

@freezed
abstract class PrefStateSortField with _$PrefStateSortField {
  const factory PrefStateSortField(
      {required String field, required bool ascending}) = _PrefStateSortField;

  factory PrefStateSortField.initial({String? field, bool? ascending}) =>
      PrefStateSortField(field: field ?? '', ascending: ascending ?? false);

  const PrefStateSortField._();

  String get field;

  bool get ascending;
}


// @freezed
// abstract class PrefState with _$PrefState, JsonModel {
//   @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
//   const factory PrefState({
//     // required AppLayout appLayout,
//     // required ModuleLayout moduleLayout,
//     required String appLayoutValue,
//     required String moduleLayoutValue,
//     required bool isPreviewVisible,
//     // required Map<EntityType, bool> useSidebarEditor,
//     // required Map<EntityType, bool> useSidebarViewer,
//     required Map<String, bool> useSidebarEditorMap,
//     required Map<String, bool> useSidebarViewerMap,
//
//     // required AppSidebarMode menuSidebarMode,
//     // required AppSidebarMode historySidebarMode,
//
//     required String menuSidebarModeValue,
//     required String historySidebarModeValue,
//     required int rowsPerPage,
//     required bool isMenuVisible,
//     required bool isHistoryVisible,
//     required bool enableDarkMode,
//     required bool enableFlexibleSearch,
//     required bool editAfterSaving,
//     required bool requireAuthentication,
//     required String colorTheme,
//     required bool enableTouchEvents,
//     required bool enableTooltips,
//     required bool enableJSPDF,
//     required bool isFilterVisible,
//     required double textScaleFactor,
//     required bool longPressSelectionIsDefault,
//     required bool tapSelectedToEdit,
//     required bool hideDesktopWarning,
//     required bool hideGatewayWarning,
//     required bool hideReviewApp,
//     required bool showKanban,
//     required bool showPdfPreview,
//     required bool persistData,
//     required bool persistUI,
//     required Map<String, UserPrefState> companyPrefs,
//     // required Map<EntityType, PrefStateSortField> sortFields,
//     required Map<String, PrefStateSortField> sortFieldsMap,
//     required Map<String, List<String>> tableColumns,
//     required Map<String, String> customColors,
//   }) = _PrefState;
//
//   factory PrefState.initial(
//       {String? moduleLayout,
//         Map<String, PrefStateSortField>? sortFields,
//         Map<String, List<String>>? tableColumns}) {
//     return PrefState(
//       moduleLayoutValue: moduleLayout ?? ModuleLayout.list.name,
//       appLayoutValue: AppLayout.mobile.name,
//       isPreviewVisible: false,
//       useSidebarEditorMap: <String, bool>{},
//       useSidebarViewerMap: <String, bool>{},
//       menuSidebarModeValue: AppSidebarMode.float.name,
//       historySidebarModeValue: AppSidebarMode.float.name,
//       rowsPerPage: 10,
//       isMenuVisible: true,
//       isHistoryVisible: false,
//       enableDarkMode: false,
//       enableFlexibleSearch: false,
//       editAfterSaving: true,
//       requireAuthentication: false,
//       colorTheme: kColorThemeLight,
//       enableTouchEvents: true,
//       enableTooltips: true,
//       enableJSPDF: false,
//       isFilterVisible: false,
//       textScaleFactor: 1,
//       longPressSelectionIsDefault: true,
//       tapSelectedToEdit: false,
//       hideDesktopWarning: false,
//       hideGatewayWarning: false,
//       hideReviewApp: false,
//       showKanban: false,
//       showPdfPreview: true,
//       persistData: false,
//       persistUI: true,
//       companyPrefs: <String, UserPrefState>{},
//       sortFieldsMap: sortFields ?? DEFAULT_SORT_FIELDS,
//       tableColumns: tableColumns ?? DEFAULT_TABLE_COLUMNS,
//       customColors: CONTRAST_COLORS,
//     );
//   }
//
//   const PrefState._();
//
//   static const Map<String, PrefStateSortField> DEFAULT_SORT_FIELDS =
//   <String, PrefStateSortField>{
//     'chvMalariaCase': PrefStateSortField(
//         field: ChvMalariaCaseFields.dateOfExamination, ascending: true)
//     // EntityType.chvStockMovement:
//     //     PrefStateSortField(field: ChvStockMovementFields.date, ascending: true),
//   };
//
//   static const Map<String, List<String>> DEFAULT_TABLE_COLUMNS =
//   <String, List<String>>{
//     'chvMalariaCase': [
//       ChvMalariaCaseFields.code,
//       ChvMalariaCaseFields.dateOfExamination,
//       ChvMalariaCaseFields.name,
//       ChvMalariaCaseFields.subVillage,
//       ChvMalariaCaseFields.age,
//       ChvMalariaCaseFields.gender,
//       ChvMalariaCaseFields.isPregnant,
//       ChvMalariaCaseFields.malariaTestResult,
//       ChvMalariaCaseFields.severity,
//       ChvMalariaCaseFields.malariaMidGiven,
//       ChvMalariaCaseFields.referral,
//       ChvMalariaCaseFields.comment,
//     ],
//     // EntityType.chvStockMovement:
//     //
//   };
//
//   static const TEXT_SCALING_SMALL = 0.8;
//   static const TEXT_SCALING_NORMAL = 1.0;
//   static const TEXT_SCALING_LARGE = 1.2;
//   static const TEXT_SCALING_EXTRA_LARGE = 1.4;
//
//   static const THEME_SIDEBAR_ACTIVE_BACKGROUND_COLOR =
//       'sidebar_active_background_color';
//   static const THEME_SIDEBAR_ACTIVE_FONT_COLOR = 'sidebar_active_font_color';
//   static const THEME_SIDEBAR_INACTIVE_BACKGROUND_COLOR =
//       'sidebar_inactive_background_color';
//   static const THEME_SIDEBAR_INACTIVE_FONT_COLOR =
//       'sidebar_inactive_font_color';
//   static const THEME_INVOICE_HEADER_BACKGROUND_COLOR =
//       'invoice_header_background_color';
//   static const THEME_INVOICE_HEADER_FONT_COLOR = 'invoice_header_font_color';
//   static const THEME_TABLE_ALTERNATE_ROW_BACKGROUND_COLOR =
//       'table_alternate_row_background_color';
//
//   static const THEME_COLORS = [
//     PrefState.THEME_SIDEBAR_ACTIVE_BACKGROUND_COLOR,
//     PrefState.THEME_SIDEBAR_ACTIVE_FONT_COLOR,
//     PrefState.THEME_SIDEBAR_INACTIVE_BACKGROUND_COLOR,
//     PrefState.THEME_SIDEBAR_INACTIVE_FONT_COLOR,
//     PrefState.THEME_INVOICE_HEADER_BACKGROUND_COLOR,
//     PrefState.THEME_INVOICE_HEADER_FONT_COLOR,
//     PrefState.THEME_TABLE_ALTERNATE_ROW_BACKGROUND_COLOR,
//   ];
//
//   static const CONTRAST_COLORS = {
//     PrefState.THEME_SIDEBAR_ACTIVE_BACKGROUND_COLOR: '#2F2E2E',
//     PrefState.THEME_SIDEBAR_ACTIVE_FONT_COLOR: '#FFFFFF',
//     PrefState.THEME_SIDEBAR_INACTIVE_BACKGROUND_COLOR: '#454544',
//     PrefState.THEME_SIDEBAR_INACTIVE_FONT_COLOR: '#FFFFFF',
//     PrefState.THEME_INVOICE_HEADER_BACKGROUND_COLOR: '#777777',
//     PrefState.THEME_INVOICE_HEADER_FONT_COLOR: '#FFFFFF',
//     PrefState.THEME_TABLE_ALTERNATE_ROW_BACKGROUND_COLOR: '#F9F9F9',
//   };
//
//   @override
//   // @memoized
//   int get hashCode;
//
//   AppLayout get appLayout => AppLayout.valueOf(appLayoutValue);
//
//   ModuleLayout get moduleLayout => ModuleLayout.valueOf(moduleLayoutValue);
//
//   AppSidebarMode get menuSidebarMode =>
//       AppSidebarMode.valueOf(menuSidebarModeValue);
//
//   AppSidebarMode get historySidebarMode =>
//       AppSidebarMode.valueOf(historySidebarModeValue);
//
//   Map<EntityType, bool> get useSidebarEditor {
//     final map = {
//       for (var entry in useSidebarEditorMap.entries)
//         EntityType.valueOf(entry.key): entry.value == true
//     };
//     return map;
//   }
//
//   Map<EntityType, bool> get useSidebarViewer {
//     final map = {
//       for (var entry in useSidebarViewerMap.entries)
//         EntityType.valueOf(entry.key): entry.value == true
//     };
//     return map;
//   }
//
//   Map<String, String> get customColors;
//
//   bool get isPreviewVisible;
//
//   bool get isMenuVisible;
//
//   bool get showKanban;
//
//   bool get showPdfPreview;
//
//   bool get enableTouchEvents;
//
//   bool get enableFlexibleSearch;
//
//   bool get isHistoryVisible;
//
//   bool get enableDarkMode;
//
//   bool get isFilterVisible;
//
//   bool get persistData;
//
//   bool get persistUI;
//
//   bool get longPressSelectionIsDefault;
//
//   bool get requireAuthentication;
//
//   bool get tapSelectedToEdit;
//
//   bool get enableJSPDF;
//
//   int get rowsPerPage;
//
//   bool get enableTooltips;
//
//   String get colorTheme;
//
//   bool get hideDesktopWarning;
//
//   bool get hideGatewayWarning;
//
//   bool get hideReviewApp;
//
//   bool get editAfterSaving;
//
//   double get textScaleFactor;
//
//   Map<EntityType, PrefStateSortField> get sortFields{
//     final map = {
//       for (var entry in sortFieldsMap.entries)
//         EntityType.valueOf(entry.key): entry.value
//     };
//     return map;
//   }
//
//   ColorTheme get colorThemeModel => colorThemesMap.containsKey(colorTheme)
//       ? colorThemesMap[colorTheme]!
//       : colorThemesMap[kColorThemeLight]!;
//
//   bool get isDesktop => appLayout == AppLayout.desktop;
//
//   bool isEditorFullScreen(EntityType entityType) {
//     if (!isDesktop) {
//       return false;
//     }
//
//     if ([EntityType.chvMalariaCase].contains(entityType)) {
//       return false;
//     }
//
//     // return !(useSidebarEditor[entityType.baseType] ?? false);
//     return true;
//   }
//
//   List<String>? getTableColumns(EntityType entityType) {
//     if (tableColumns != null && tableColumns.containsKey('$entityType')) {
//       return tableColumns['$entityType']?.toList();
//     } else {
//       return null;
//     }
//   }
//
//   // bool isViewerFullScreen(EntityType entityType) {
//   //   if (!isDesktop || entityType == null) {
//   //     return false;
//   //   }
//   //
//   //   // if (!entityType.hasFullWidthViewer) {
//   //   //   return false;
//   //   // }
//   //
//   //   return !(useSidebarViewer[entityType.baseType] ?? false);
//   // }
//
//   bool get isNotDesktop => !isDesktop;
//
//   bool get isMobile => appLayout == AppLayout.mobile;
//
//   bool get isNotMobile => !isMobile;
//
//   bool get isModuleList => moduleLayout == ModuleLayout.list;
//
//   bool get isModuleTable => !isModuleList;
//
//   bool get isMenuFloated =>
//       appLayout == AppLayout.mobile || menuSidebarMode == AppSidebarMode.float;
//
//   bool get isHistoryFloated =>
//       appLayout == AppLayout.mobile ||
//           historySidebarMode == AppSidebarMode.float;
//
//   bool get showMenu =>
//       (isMenuVisible && menuSidebarMode == AppSidebarMode.visible) ||
//           menuSidebarMode == AppSidebarMode.collapse;
//
//   bool get showHistory =>
//       isHistoryVisible && historySidebarMode == AppSidebarMode.visible;
//
//   bool get isMenuCollapsed =>
//       isNotMobile &&
//           menuSidebarMode == AppSidebarMode.collapse &&
//           !isMenuVisible;
//
//   factory PrefState.fromJson(Map<String, dynamic> json) =>
//       _$PrefStateFromJson(json);
// }
//
// @freezed
// abstract class PrefStateSortField with _$PrefStateSortField {
//   @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
//   const factory PrefStateSortField(
//       {required String field, required bool ascending}) = _PrefStateSortField;
//
//   factory PrefStateSortField.initial(String field, bool ascending) =>
//       PrefStateSortField(field: field, ascending: ascending);
//
//   const PrefStateSortField._();
//
//   @override
//   // @memoized
//   int get hashCode;
//
//   String get field;
//
//   bool get ascending;
//
//   factory PrefState.fromJson(Map<String, dynamic> json) =>
//       _$PrefStateFromJson(json);
// }
//
// @freezed
// abstract class UserPrefState with _$UserPrefState {
//   @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
//   const factory UserPrefState(
//       {required String accentColor,
//         required List<HistoryRecord> historyList}) = _UserPrefState;
//
//   factory UserPrefState.initial(String accentColor) =>
//       UserPrefState(accentColor: accentColor, historyList: <HistoryRecord>[]);
//
//   const UserPrefState._();
//
//   @override
//   // @memoized
//   int get hashCode;
//
//   List<HistoryRecord> get historyList;
//
//   factory PrefStateSortField.fromJson(Map<String, dynamic> json) =>
//       _$PrefStateSortFieldFromJson(json);
// }
//
// @freezed
// abstract class HistoryRecord with _$HistoryRecord {
//   @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
//   const factory HistoryRecord(
//       {required EntityType entityType,
//         String? id,
//         required int timestamp}) = _HistoryRecord;
//
//   factory HistoryRecord.initial(EntityType entityType, String id) =>
//       HistoryRecord(
//           entityType: entityType,
//           id: id,
//           timestamp: DateTime.now().millisecondsSinceEpoch);
//
//   const HistoryRecord._();
//
//   // @override
//   // @memoized
//   // int get hashCode;
//
//   DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(timestamp);
//
//   bool matchesRecord(HistoryRecord record) =>
//       isEqualTo(entityId: record.id, entityType: record.entityType);
//
//   bool isEqualTo({EntityType? entityType, String? entityId}) =>
//       entityType == this.entityType && entityId == id;
//
//   factory HistoryRecord.fromJson(Map<String, dynamic> json) =>
//       _$HistoryRecordFromJson(json);
// }
