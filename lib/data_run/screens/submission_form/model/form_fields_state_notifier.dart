import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/helpers/collections.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/form/form_fields_repository.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/q_field.model.dart';
import 'package:mass_pro/form/model/action_type.dart';
import 'package:mass_pro/form/model/row_action.dart';
import 'package:mass_pro/form/model/store_result.dart';
import 'package:mass_pro/form/model/value_store_result.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';
import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/mp/helpers/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_fields_state_notifier.g.dart';

/// A Riverpod provider for fetching the indexed field input.
@riverpod
Future<QFieldModel> indexedFieldInput(IndexedFieldInputRef ref, String key) {
  final Future<QFieldModel> indexedFieldModel = ref
      .watch(formFieldsStateNotifierProvider.selectAsync((list) => list[key]!));
  return indexedFieldModel;
}

/// A state notifier for managing form fields and their states.
@riverpod
class FormFieldsStateNotifier extends _$FormFieldsStateNotifier {
  @override
  Future<IMap<String, QFieldModel>> build() async {
    final FormFieldsRepository repository = getFormRepository();
    ref.listen<FormIntent>(formPendingIntentsProvider, (previous, next) {
      logInfo(info: next.toString());
      _createRowActionStore(next)
          .then((Pair<RowAction?, StoreResult> event) => _displayResult(event));
    });

    final IList<QFieldModel> fieldsList = await repository.fetchFieldsList();
    final IMap<String, QFieldModel> fieldMap =
        IMap.fromIterable<String, QFieldModel, QFieldModel>(fieldsList,
            keyMapper: (field) => field.uid, valueMapper: (field) => field);
    return fieldMap;
  }

  /// Retrieves the form repository instance.
  FormFieldsRepository getFormRepository() {
    return ref.watch(formFieldsRepositoryProvider).requireValue;
  }

  /// Updates the state with the updated list of fields, usually triggered
  /// when some fields are updated after running the rule engine.
  Future<void> processCalculatedItems() async {
    final repository = getFormRepository();
    state = await AsyncValue.guard(
        () => Future.value(repository.composeFieldsMap()));
  }

  /// Creates a row action based on the provided [FormIntent] and triggers
  /// the appropriate action, such as saving to the database.
  Future<Pair<RowAction?, StoreResult>> _createRowActionStore(
      FormIntent intent) async {
    final RowAction? rowAction = _rowActionFromIntent(intent);

    if (rowAction?.type == ActionType.ON_FOCUS) {
      // TODO: Notify the form focus
    } else if (rowAction?.type == ActionType.ON_SAVE) {
      // TODO: Handle save action
    }

    final StoreResult result = await _processUserAction(rowAction);
    return Pair(rowAction, result);
  }

  /// Processes the user action based on the provided [RowAction] and
  /// performs necessary operations such as saving data, updating values,
  /// and handling validation errors.
  Future<StoreResult> _processUserAction(RowAction? action) async {
    final repository = getFormRepository();
    switch (action?.type) {
      case ActionType.ON_SAVE:
        repository.updateErrorList(action);

        if (action!.hasError) {
          return StoreResult(
              uid: action.id,
              valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
        } else {
          await repository.updateValueOnList(
              uid: action.id,
              value: action.value,
              values: action.values,
              valueType: action.valueType);
          return StoreResult(
              uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
        }

      case ActionType.ON_TEXT_CHANGE:
        if (action!.hasError) {
          return StoreResult(
              uid: action.id,
              valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
        }
        await repository.updateValueOnList(
            uid: action.id, value: action.value, valueType: action.valueType);
        return StoreResult(
            uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);

      case ActionType.ON_SECTION_CHANGE:
        // TODO: Update section opened
        return StoreResult(
            uid: action!.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);

      case ActionType.ON_CLEAR:
        repository.removeAllValues();
        return StoreResult(
            uid: action!.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);

      case ActionType.ON_FINISH:
        repository.batchUpdateValues(action!.formData);
        return const StoreResult(
            uid: '', valueStoreResult: ValueStoreResult.FINISH);

      default:
        return StoreResult(
            uid: action!.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  /// Creates a [RowAction] based on the provided [FormIntent].
  RowAction? _rowActionFromIntent(FormIntent intent) {
    return intent.mapOrNull(
        onClear: (OnClear intent) => _createRowAction(
            uid: '', value: null, actionType: ActionType.ON_CLEAR),
        clearValue: (ClearValue intent) =>
            _createRowAction(uid: intent.uid, value: null, values: <String>[]),
        onNext: (OnNext intent) => _createRowAction(
            uid: intent.uid,
            value: intent.value,
            actionType: ActionType.ON_NEXT),
        onSave: (OnSave intent) {
          final Exception? error = _checkFieldError(
              intent.valueType, intent.value, intent.fieldMask);
          return _createRowAction(
              uid: intent.uid,
              value: intent.value,
              values: intent.values,
              error: error,
              valueType: intent.valueType);
        },
        onFocus: (OnFocus intent) => _createRowAction(
            uid: intent.uid,
            value: intent.value,
            actionType: ActionType.ON_FOCUS),
        onTextChange: (OnTextChange intent) {
          final Exception? error = _checkFieldError(
              intent.valueType, intent.value, intent.fieldMask);
          return _createRowAction(
              uid: intent.uid,
              value: intent.value,
              error: error,
              actionType: ActionType.ON_TEXT_CHANGE,
              valueType: ValueType.Text);
        },
        onSection: (OnSection intent) => _createRowAction(
            uid: intent.sectionUid,
            value: null,
            actionType: ActionType.ON_SECTION_CHANGE),
        onFinish: (OnFinish intent) => _createRowAction(
            uid: '',
            value: null,
            values: <String>[],
            formData: intent.formData,
            actionType: ActionType.ON_FINISH));
  }

  /// Creates a [RowAction] instance with the specified parameters.
  RowAction _createRowAction(
          {required String uid,
          String? value,
          List<String>? values,
          Map<String, dynamic>? formData,
          String? extraData,
          Exception? error,
          ActionType actionType = ActionType.ON_SAVE,
          ValueType? valueType}) =>
      RowAction(
          id: uid,
          formData: formData,
          value: value,
          values: values,
          extraData: extraData,
          error: error,
          type: actionType,
          valueType: valueType);

  /// Checks for field errors based on the provided [ValueType], [fieldValue],
  /// and [fieldMask], and returns a [ValidationException] if there are errors.
  ValidationException? _checkFieldError(
      ValueType? valueType, String? fieldValue, String? fieldMask) {
    if ((fieldValue ?? '').isNotEmpty) {
      final Result<String, ValidationException>? result =
          valueType?.validator.validate(fieldValue!);
      final ValidationException? errorOrNull =
          result?.fold((ValidationException failure) => failure, (String success) => null);
      return errorOrNull;
    }
    return null;
  }

  /// Submits a [FormIntent] to the form pending intents provider.
  void submitIntent(FormIntent intent) {
    ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((FormIntent current) => intent);
  }

  /// Discards changes by restoring values from a backup and submitting intents
  /// for each restored field.
  void discardChanges() {
    getFormRepository().backupOfChangedItems().forEach((QFieldModel item) => ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((FormIntent current) => FormIntent.onSave(
            uid: item.uid,
            value: item.value,
            valueType: item.valueType,
            fieldMask: item.fieldMask)));
  }

  /// Displays the result of processing a row action, updating the state
  /// if necessary.
  void _displayResult(Pair<RowAction?, StoreResult> result) {
    switch (result.second.valueStoreResult) {
      case ValueStoreResult.VALUE_CHANGED:
        processCalculatedItems();
        break;
      case ValueStoreResult.ERROR_UPDATING_VALUE:
        break;
      case ValueStoreResult.UID_IS_NOT_DE_OR_ATTR:
        processCalculatedItems();
        break;
      case ValueStoreResult.VALUE_NOT_UNIQUE:
        processCalculatedItems();
        break;
      case ValueStoreResult.VALUE_HAS_NOT_CHANGED:
        processCalculatedItems();
        break;
      case ValueStoreResult.TEXT_CHANGING:
        processCalculatedItems();
        break;
      case ValueStoreResult.FINISH:
        processCalculatedItems();
        break;
      default:
        break;
    }
  }
}
