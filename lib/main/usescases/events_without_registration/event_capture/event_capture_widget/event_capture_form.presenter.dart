import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../event_capture_contract.dart';

class EventCaptureFormPresenter {
  EventCaptureFormPresenter(this.ref);
  final AutoDisposeRef ref;
  late final EventCapturePresenter _activityPresenter;
  late final String eventUid;
}
