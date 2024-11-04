import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/form_view/form_view_model/form_content_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/form_view/form_view_model_config/form_item_with_value.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/utils/navigator_key.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ConfigureFormViewModel {
  const ConfigureFormViewModel();

  FormViewContentModel call(SectionInstance rootSection) {
    final FormViewContentModel formViewContentModel = FormViewContentModel(
        title: S.of(navigatorKey.currentContext!).formSummaryView,
        subtitle: S.of(navigatorKey.currentContext!).fieldsWithErrorInfo,
        icon: rootSection.form.hasErrors ? Icons.error : Icons.info,
        body: _getBody(rootSection));

    return formViewContentModel;
  }

  FormViewBodyModel _getBody(SectionInstance rootSection) {
    return FormViewBodyModel(
        message: S.of(navigatorKey.currentContext!).formSummaryView,
        fieldsWithValues: _getFieldsWithValues(rootSection));
  }

  Map<String, List<FormItemWithValue<dynamic>>> _getFieldsWithValues(
      SectionInstance rootSection) {
    var formElementMap = {
      for (var x
          in getFormElementIterator<FormElementInstance<dynamic>>(rootSection)
              .where((item) => item.name.isNotEmpty))
        x.pathRecursive: x
    };

    // formElementMap.map((item){
    //   if(item is FieldInstance) {
    //
    //   }
    // });

    final List<FormItemWithValue<dynamic>> fieldsValues = []; /*fieldsWithValues.map((element) => FieldWithValueModel(
        parent: element.parentSection?.label,
        fieldPath: element.pathRecursive,
        fieldName: element.label,
        value: element.value,
        message: element.elementControl?.hasErrors == true
            ? _getErrorMessage(element)
            : ''));*/

    return fieldsValues
        .groupListsBy((element) => element.parent ?? 'UnGroupedIssue');
  }

  String _getErrorMessage(FieldInstance<dynamic> field) {
    final errorKey = field.elementControl!.errors.keys.first;
    final validationMessage = _findValidationMessage(errorKey);

    return validationMessage != null
        ? validationMessage(field.elementControl!.getError(errorKey)!)
        : errorKey;
  }

  ValidationMessageFunction? _findValidationMessage(String errorKey) {
    return validationMessages(navigatorKey.currentContext!)[errorKey];
  }
}
