import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/extensions/dynamic_extensions.dart';
import '../intent/form_intent.dart';

part 'form_pending_intents.g.dart';

@riverpod
class FormPendingIntents extends _$FormPendingIntents {
  @override
  FormIntent build() {
    return const FormIntent.init();
  }

  @override
  bool updateShouldNotify(FormIntent previous, FormIntent next) {
    logInfo(
        info:
            'FormPendingIntents: updateShouldNotify(oldI,newI): oldI: $previous, newI: $next');
    if (next is Init || (previous is OnFinish && next is OnFinish)) {
      return false;
    } else {
      return previous != next;
    }
  }

  void submitIntent(FormIntent Function(FormIntent current) updateCallback) {
    logInfo(info: 'FormPendingIntents: submitIntent(), current: $state');
    state = updateCallback.call(state);
  }
}
