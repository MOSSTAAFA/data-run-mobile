enum Filters {
  PERIOD('R.layout.item_filter_period'),
  ORG_UNIT('R.layout.item_filter_org_unit'),
  ACTIVITY('R.layout.item_filter_activity'),
  SYNC_STATE('R.layout.item_filter_state'),
  EVENT_STATUS('R.layout.item_filter_status'),
  ASSIGNED_TO_ME('R.layout.item_filter_assigned'),
  ENROLLMENT_DATE('R.layout.item_filter_period'),
  ENROLLMENT_STATUS('R.layout.item_filter_enrollment_status'),
  WORKING_LIST('R.layout.item_filter_working_list'),
  FOLLOW_UP('R.layout.item_filter_followup'),
  NON('-1');

  const Filters(this.layoutId);

  final String layoutId;
}
