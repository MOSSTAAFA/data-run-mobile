import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/data_integrity_check_result.dart';
import '../data/form_repository.dart';
import '../di/injector.dart';
import '../model/field_ui_model.dart';
import '../model/info_ui_model.dart';
import '../model/row_action.dart';
import 'event/list_view_ui_events.dart';
import 'intent/form_intent.dart';

part 'form_view_providers.g.dart';

@riverpod
class Loading extends _$Loading {
  @override
  bool build() {
    return true;
  }

  void setValue(bool value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class ShowToast extends _$ShowToast {
  @override
  String? build() {
    return null;
  }

  void setValue(String value) {
    state = value;
  }
}

@riverpod
class Focused extends _$Focused {
  @override
  bool? build() {
    return null;
  }

  void setValue(bool value) {
    state = value;
  }
}

@riverpod
class ShowInfo extends _$ShowInfo {
  @override
  InfoUiModel? build() {
    return null;
  }

  void setValue(InfoUiModel value) {
    state = value;
  }
}

@riverpod
class Items extends _$Items {
  @override
  FutureOr<IList<FieldUiModel>> build() {
    final FormRepository repository = ref.read(formRepositoryProvider);
    return repository.fetchFormItems();
  }

  Future<void> loadData() async {
    ref.read(loadingProvider.notifier).setValue(true);
    final FormRepository repository = ref.read(formRepositoryProvider);
    state = await AsyncValue.guard(repository.fetchFormItems);
    ref.read(loadingProvider.notifier).setValue(false);
  }

  Future<void> processCalculatedItems() async {
    final FormRepository repository = ref.read(formRepositoryProvider);
    state = await AsyncValue.guard(repository.composeList);
  }

  Future<void> runDataIntegrityCheck({bool? allowDiscard}) async {
    final AsyncValue<DataIntegrityCheckResult> result =
        await AsyncValue.guard(() async {
      return ref
          .read(formRepositoryProvider)
          .runDataIntegrityCheck(allowDiscard: allowDiscard ?? false);
    });

    ref
        .read(dataIntegrityResultValueProvider.notifier)
        .setValue(result.requireValue);
    final FormRepository repository = ref.read(formRepositoryProvider);
    state = await AsyncValue.guard(repository.composeList);
  }
}

@riverpod
int index(IndexRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<int> itemsListLength(ItemsListLengthRef ref) {
  return ref.watch(
      itemsProvider.selectAsync((IList<FieldUiModel> list) => list.length));
}

@Riverpod(dependencies: [index])
class FieldItem extends _$FieldItem {
  @override
  FieldUiModel? build(Callback callback) {
    // final int index = ref.read(indexProvider);
    // final FieldUiModel item = await ref
    //     .watch(itemsProvider.selectAsync((IList<FieldUiModel> e) => e[index]));
    // return item.setCallback(callback);

    final IList<FieldUiModel>? items = ref.watch(itemsProvider).value;
    if (items != null && items.isNotEmpty) {
      final int index = ref.watch(indexProvider);
      return items[index].setCallback(callback);
    }
    return null;
  }
}

@riverpod
FieldUiModel? fieldRow(FieldRowRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<double> completionPercentageValue(CompletionPercentageValueRef ref) {
  final IList<FieldUiModel>? items = ref.watch(itemsProvider).value;
  return ref
      .read(formRepositoryProvider)
      .completedFieldsPercentage(items ?? IList());
}

@riverpod
class SavedValue extends _$SavedValue {
  @override
  RowAction? build() {
    return null;
  }

  void setValue(RowAction value) {
    state = value;
  }
}

@riverpod
class QueryData extends _$QueryData {
  @override
  RowAction? build() {
    return null;
  }

  void setValue(RowAction value) {
    state = value;
  }
}

@riverpod
class CalculationLoopValue extends _$CalculationLoopValue {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> displayLoopWarningIfNeeded() async {
    state = await AsyncValue.guard(
        ref.read(formRepositoryProvider).calculationLoopOverLimit);
  }
}

@riverpod
class DataIntegrityResultValue extends _$DataIntegrityResultValue {
  @override
  DataIntegrityCheckResult? build() {
    return null;
  }

  void setValue(DataIntegrityCheckResult value) {
    state = value;
  }
}

@riverpod
class PendingIntents extends _$PendingIntents {
  @override
  FormIntent? build() {
    return null;
  }

  void submitIntent(FormIntent intent) {
    state = intent;
  }
}

@riverpod
class UiEvent extends _$UiEvent {
  @override
  ListViewUiEvents? build() {
    return null;
  }

  void setValue(ListViewUiEvents value) {
    state = value;
  }
}

@riverpod
class UiIntent extends _$UiIntent {
  @override
  FormIntent? build() {
    return null;
  }

  void setValue(FormIntent value) {
    state = value;
  }
}
