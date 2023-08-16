import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/extensions/dynamic_extensions.dart';
import 'form_model.dart';

part 'form_model_notifier.g.dart';

@riverpod
class FormModelNotifier extends _$FormModelNotifier {
  @override
  FormModel build() {
    logInfo(info: 'FormModelNotifier: got built -> build()');
    return FormModel();
  }

  void updateValue(FormModel Function(FormModel current) updateCallback) {
    state = updateCallback.call(state);
  }
}
