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
      <ViewAction>[
        tasks,
        data_entry,
        if (withAnalytics) analytics,
        if (withRelationships) relationships,
        notes
      ];
  static List<ViewAction> eventTabs(
          {bool withAnalytics = false, bool withRelationships = false}) =>
      <ViewAction>[
        details,
        data_entry,
        if (withAnalytics) analytics,
        if (withRelationships) relationships,
        notes
      ];

  static List<ViewAction> eventListMenu() => <ViewAction>[list_view, map_view];

  static List<ViewAction> dashboardMenu() =>
      <ViewAction>[details, analytics, relationships, notes];

  static List<ViewAction> homeMenu() => <ViewAction>[programs, analytics];

  static List<ViewAction> searchMenu() => <ViewAction>[list_view, map_view, analytics];

  /// from event Capture menu
  static List<ViewAction> formMoreActions() => <ViewAction>[show_help];
  static List<ViewAction> homeMoreActions() => <ViewAction>[show_help];
  static List<ViewAction> evenMoreActions() => <ViewAction>[delete, share, show_help];
}
