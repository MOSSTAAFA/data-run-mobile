import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/commons/date/field_with_issue.dart';
import 'package:mass_pro/commons/helpers/iterable.dart';
import 'package:mass_pro/data_run/engine/rule_engine_new.dart';
import 'package:mass_pro/data_run/form/form.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/form/model/row_action.dart';
import 'package:mass_pro/form/ui/validation/field_error_message_provider.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_fields_repository.g.dart';

@riverpod
Future<FormFieldsRepository> formFieldsRepository(
    FormFieldsRepositoryRef ref) async {
  final Bundle eventBundle = Get.arguments as Bundle;
  final syncableUid = eventBundle.getString(SYNCABLE_UID)!;
  final formCode = eventBundle.getString(FORM_CODE)!;
  final DynamicForm? form = await D2Remote.formModule.form
      .where(attribute: 'code', value: formCode)
      .getOne();

  final d2SyncableQuery =
      ref.watch(databaseSyncableQueryProvider(formCode)).provideQuery();
  final SyncableEntity? syncableEntity =
      await d2SyncableQuery.byId(syncableUid).getOne();

  return FormFieldsRepository(
      syncableEntityMappingRepository: ref.watch(
          syncableEntityMappingRepositoryProvider(
              form: form!,
              syncableEntity: syncableEntity!,
              d2SyncableQuery: d2SyncableQuery)),
      displayNameProvider: ref.watch(displayNameProviderProvider),
      fieldErrorMessageProvider: ref.watch(fieldErrorMessageProviderProvider));
}

/// Maps Database entity fields key, value map to List<FormFieldModels>,
/// that [FormStateNotifier] will use and update
class FormFieldsRepository {
  FormFieldsRepository({
    required this.syncableEntityMappingRepository,
    required this.fieldErrorMessageProvider,
    required this.displayNameProvider,
  });

  /// Mutable list that keeps the changes of fields Model during entry of form
  IList<QFieldModel> _pendingUpdates = IList([]);

  /// backup list of the fields states at loading the form
  /// the states that is in the database before changing any of the fields values
  IList<QFieldModel> _backupList = IList([]);

  IList<RowAction> _itemsWithError = IList([]);
  final RuleEngine ruleEngine = RuleEngine(const ExpressionEvaluator());

  /// used to convert the action field on the database entities into the List of
  /// List<FieldUiModel> of fields model representing each field
  final SyncableEntityMappingRepository syncableEntityMappingRepository;

  final DisplayNameProvider displayNameProvider;

  // /// used to save each value to the database and gets the response
  // final FormValueStore? formValueStore;

  /// encapsulate error messages returnint a localized user friendly
  /// message representing the an error message if there are any
  final FieldErrorMessageProvider fieldErrorMessageProvider;

  // /// map of mandatory Fields Without Value
  // IMap<String, String> _mandatoryItemsWithoutValue = IMap({});

  /// updates the field model in _itemList with the value based on the uid
  Future<void> updateValueOnList(
      String uid, String? value, ValueType? valueType) async {
    final displayName =
        await displayNameProvider.provideDisplayName(valueType, value);

    final toUpdatedItem = _pendingUpdates.unlock
        .firstWhere((t) => t.uid == uid)
        .builder()
        .setValue(value)
        .setDisplayName(displayName)
        .build();

    _pendingUpdates =
        _pendingUpdates.updateById([toUpdatedItem], (id) => id.uid);
  }

  Future<int> batchUpdateValues(Map<String, dynamic>? formData) async {
    return syncableEntityMappingRepository.saveFormData(_pendingUpdates);
  }

  FutureOr<IList<QFieldModel>> fetchFieldsList() async {
    _backupList = await syncableEntityMappingRepository.list();
    return composeFieldsList(_backupList);
  }

  FutureOr<IList<QFieldModel>> composeFieldsList(IList<QFieldModel> fields) async {
    _pendingUpdates = await applyRuleEffects(fields).then(
        (IList<QFieldModel> listOfItems) =>
            _setLastItemKeyboardAction(listOfItems));
    return _pendingUpdates;
  }

  FutureOr<IMap<String, QFieldModel>> composeFieldsMap() async {
    final fieldList = await applyRuleEffects(_pendingUpdates).then(
        (IList<QFieldModel> listOfItems) =>
            _setLastItemKeyboardAction(listOfItems));

    return IMap.fromIterable<String, QFieldModel, QFieldModel>(fieldList,
        keyMapper: (field) => field.uid, valueMapper: (field) => field);
  }

  Future<IList<QFieldModel>> applyRuleEffects(IList<QFieldModel> list) async {
    return ruleEngine.applyRules(list);
  }

  IList<QFieldModel> _setLastItemKeyboardAction(IList<QFieldModel> list) {
    if (list.isEmpty) {
      return list;
    }

    final QFieldModel lastItem = _getLastSectionItem(list);
    if (_usesKeyboard(lastItem.valueType) &&
        lastItem.valueType != ValueType.LongText) {
      return list.replace(
          list.indexOf(lastItem), lastItem.setKeyBoardActionDone());
    }
    return list;
  }

  void removeAllValues() {
    _pendingUpdates = _pendingUpdates
        .map((QFieldModel fieldUiModel) =>
            fieldUiModel.setValue(null).setDisplayName(null))
        .toIList();
  }

  /// if action has error and its item is not yet in _itemsWithError, it adds
  /// it to it. Else which means it was _itemsWithError, it then removes it.
  void updateErrorList(RowAction? action) {
    final itemIndex =
        _itemsWithError.indexWhere((RowAction item) => item.id == action!.id);

    // if action has error
    if (action?.error != null) {
      // if item is not in _itemsWithError
      if (itemIndex == -1) {
        _itemsWithError = _itemsWithError.add(action!);
      }
    } else {
      // if item is not in _itemsWithError
      if (itemIndex != -1) {
        _itemsWithError = _itemsWithError.removeAt(itemIndex);
      }
    }
  }

  QFieldModel _getLastSectionItem(IList<QFieldModel> list) {
    return list.reversed
        .firstWhere((QFieldModel item) => item.valueType != null);
  }

  bool _usesKeyboard(ValueType? valueType) {
    if (valueType != null) {
      return valueType.isText || valueType.isNumeric || valueType.isInteger;
    } else {
      return false;
    }
  }

  // /// pure function doesn't effect this class variables
  // /// runs at finishing data entry, either by clicking back key
  // /// or save key, if there are errors it will notify in the UI
  // QDataIntegrityCheckResult runDataIntegrityCheck(
  //     {required bool allowDiscard}) {
  //   _runDataIntegrity = true;
  //   final IList<FieldWithIssue> itemsWithErrors = _getFieldsWithError();

  //   final IList<FieldWithIssue> itemsWithWarning = IList([]);
  //   if (itemsWithErrors.isNotEmpty) {
  //     return FieldsWithErrorResult(
  //         mandatoryFields: _mandatoryItemsWithoutValue,
  //         fieldUidErrorList: itemsWithErrors,
  //         warningFields: itemsWithWarning,
  //         allowDiscard: allowDiscard);
  //   }

  //   if (_mandatoryItemsWithoutValue.isNotEmpty) {
  //     return MissingMandatoryResult(
  //         mandatoryFields: _mandatoryItemsWithoutValue,
  //         errorFields: itemsWithErrors,
  //         warningFields: itemsWithWarning,
  //         allowDiscard: allowDiscard);
  //   }

  //   if (itemsWithWarning.isNotEmpty) {
  //     return FieldsWithWarningResult(fieldUidWarningList: itemsWithWarning);
  //   }

  //   if (backupOfChangedItems().isNotEmpty && allowDiscard) {
  //     return const NotSavedResult();
  //   }

  //   return const SuccessfulResult();
  // }

  IList<QFieldModel> backupOfChangedItems() {
    return _backupList;
  }

  IList<FieldWithIssue> _getFieldsWithError() {
    return _itemsWithError.mapNotNull((RowAction? errorItem) {
      final QFieldModel? item = _pendingUpdates
          .firstOrNullWhere((QFieldModel item) => item.uid == errorItem?.id);
      if (item != null) {
        return FieldWithIssue(
            fieldUid: item.uid,
            fieldName: item.label,
            issueType: IssueType.ERROR,
            message: errorItem?.error != null
                ? fieldErrorMessageProvider
                    .getFriendlyErrorMessage(errorItem!.error!)
                : '');
      }
      return null;
    }).toIList();
  }

  bool formIsDirty() {
    return _pendingUpdates != _backupList;
  }
}
