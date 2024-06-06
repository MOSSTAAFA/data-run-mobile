enum ViewAction {
  /// event List
  list_view,
  map_view,

  /// event menu
  /// form
  tasks,
  details,
  data_entry,
  analytics,
  relationships,
  notes,
  programs,

  events,
  table_view,

  /// from event Capture menu
  delete,
  share,
  show_help,

  /// from old prog
  sync;

  static List<ViewAction> formTabs(
          {bool withAnalytics = false, bool withRelationships = false}) =>
      [
        tasks,
        data_entry,
        if (withAnalytics) analytics,
        if (withRelationships) relationships,
        notes
      ];
  static List<ViewAction> eventTabs(
          {bool withAnalytics = false, bool withRelationships = false}) =>
      [
        details,
        data_entry,
        if (withAnalytics) analytics,
        if (withRelationships) relationships,
        notes
      ];

  static List<ViewAction> eventListMenu() => [list_view, map_view];

  static List<ViewAction> dashboardMenu() =>
      [details, analytics, relationships, notes];

  static List<ViewAction> homeMenu() => [programs, analytics];

  static List<ViewAction> searchMenu() => [list_view, map_view, analytics];

  /// from event Capture menu
  static List<ViewAction> formMoreActions() => [show_help];
  static List<ViewAction> homeMoreActions() => [show_help];
  static List<ViewAction> evenMoreActions() => [delete, share, show_help];
}
