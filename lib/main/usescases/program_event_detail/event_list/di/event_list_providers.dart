import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../event_list_presenter.dart';

part 'event_list_providers.g.dart';

@riverpod
EventListPresenter eventListPresenter(EventListPresenterRef ref) {
  return EventListPresenter(ref);
}
