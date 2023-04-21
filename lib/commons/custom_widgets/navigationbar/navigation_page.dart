import '../../helpers/iterable.dart';
import '../../utils/view_actions.dart';

enum NavigationPage {
  DETAILS(ViewAction.details),
  EVENTS(ViewAction.events),
  ANALYTICS(ViewAction.analytics),
  RELATIONSHIPS(ViewAction.relationships),
  NOTES(ViewAction.notes),
  DATA_ENTRY(ViewAction.data_entry),
  LIST_VIEW(ViewAction.list_view),
  MAP_VIEW(ViewAction.map_view),
  TABLE_VIEW(ViewAction.table_view),
  TASKS(ViewAction.tasks),
  PROGRAMS(ViewAction.programs);

  const NavigationPage(this.viewAction);

  final ViewAction viewAction;

  static NavigationPage? getMenu(ViewAction viewAction) {
    return values
        .firstOrNullWhere((NavigationPage it) => it.viewAction == viewAction);
  }
}
