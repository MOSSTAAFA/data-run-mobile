import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/form/ui/view_model/form_model.dart';

part 'form_model_notifier.g.dart';

@riverpod
class FormModelNotifier extends _$FormModelNotifier {
  @override
  FormModel build() {
    logInfo(info: '$runtimeType: got built, inside build method');
    return FormModel();
  }

  @override
  bool updateShouldNotify(FormModel previous, FormModel next) {
    return previous != next;
  }

  void updateValue(FormModel Function(FormModel current) updateCallback) {
    state = updateCallback.call(state);
  }
}
