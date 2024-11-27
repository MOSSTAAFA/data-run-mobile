import 'package:d2_remote/core/datarun/logging/logging.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:datarun/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datarun/data_run/form/form_element_factories/form_element_builder.dart';
import 'package:datarun/data_run/form/form_element_factories/form_element_control_builder.dart';
import 'package:datarun/data_run/form/form_submission/submission_list.provider.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element/form_metadata.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

const orgUnitControlName = 'orgUnit';
const formAttributesGroupName = 'attributes';
const formDataGroupName = 'formData';

const formControlName = 'formData';
const activityControlName = 'formData';
const teamControlName = 'formData';
const versionControlName = 'formData';

class FormInstance {
  FormInstance(FormInstanceRef ref,
      {required this.form,
      required this.formFlatTemplate,
      required String? orgUnit,
      required this.formMetadata,
      // required this.formConfiguration,
      required SectionInstance rootSection,
      Map<String, FormElementInstance<dynamic>> elements = const {},
      required this.enabled})
      : _ref = ref,
        _formSection = rootSection {
    form.addAll({
      '_${orgUnitControlName}':
          FormControl<String>(value: orgUnit, validators: [Validators.required])
    });
    var formElementMap = {
      for (var x
          in getFormElementIterator<FormElementInstance<dynamic>>(rootSection)
              .where((e) => e.elementPath != null))
        x.elementPath!: x
    };
    _forElementMap.addAll(formElementMap);

    if (!enabled) {
      form.markAsDisabled();
    }
  }

  final FormGroup form;
  final FormFlatTemplate formFlatTemplate;
  final bool enabled;

  final FormInstanceRef _ref;
  final Map<String, FormElementInstance<dynamic>> _forElementMap = {};
  final SectionInstance _formSection;

  // final FormConfiguration formConfiguration;

  Map<String, FormElementInstance<dynamic>> get forElementMap =>
      Map.unmodifiable(_forElementMap);

  SectionInstance get formSection => _formSection;

  FormSubmissions get formSubmissionList =>
      _ref.read(formSubmissionsProvider(formMetadata.form).notifier);

  final FormMetadata formMetadata;

  String? get submissionUid => formMetadata.submission;

  Future<DataFormSubmission> saveFormData() async {
    final Map<String, Object?> formValue = form.value;
    DataFormSubmission? formSubmission;
    formSubmission = await formSubmissionList.getSubmission(submissionUid!);
    formSubmission!.orgUnit = form.control('_${orgUnitControlName}').value;
    formSubmission.formData.clear();
    formSubmission.formData.addAll(formValue);
    return formSubmissionList.updateSubmission(formSubmission);
  }

  RepeatItemInstance onAddRepeatedItem(RepeatInstance parent) {
    final instanceBuilder = _ref
        .read(formElementBuilderProvider(formMetadata: formMetadata))
        .requireValue;
    final instanceControllerBuilder = _ref
        .read(formElementControlBuilderProvider(formMetadata: formMetadata))
        .requireValue;

    final itemFormGroup =
        instanceControllerBuilder.createSectionFormGroup(parent.template);
    final itemInstance = instanceBuilder.buildRepeatItem(form, parent.template);
    parent
      ..add(itemInstance)
      ..resolveDependencies()
      ..evaluate();
    parent.elementControl.add(itemFormGroup);
    _forElementMap[itemInstance.elementPath!] = itemInstance;
    parent.elementControl.markAsDirty();
    return itemInstance;
  }

  void onRemoveRepeatedItem(int index, RepeatInstance parent) {
    parent.removeAt(index);
    parent.elementControl.removeAt(index);
    parent.elementControl.markAsDirty();
  }

  Future<void> markSubmissionAsFinal() {
    return formSubmissionList.markSubmissionAsFinal(submissionUid!);
  }

  ///////////////

  // void onAddRepeatedItem(RepeatInstance parentTableInstance) {
  //   final elementFormGroupControl =
  //   ElementControlBuilder.forSection(parentTableInstance.template);
  //   final RepeatItemInstance elementInstance =
  //   ElementInstanceBuilder.forRepeatItem(
  //       forFlatTemplate, parentTableInstance.template);
  //   final parentArray =
  //   form.control(parentTableInstance.elementPath!) as FormArray;
  //
  //   parentArray.add(elementFormGroupControl, emitEvent: false);
  //   parentTableInstance.add(elementInstance,
  //       updateParent: true, emitEvent: false);
  //   elementInstance
  //     ..resolveDependencies()
  //     ..evaluate(emitEvent: false);
  // }

  // bool onSaveRepeatedItem(
  //     RepeatInstance parentTableInstance, RepeatItemInstance elementInstance) {
  //   final parentArray =
  //   form.control(parentTableInstance.elementPath!) as FormArray;
  //   final elementFormGroupControl =
  //   parentArray.control(elementInstance.name) as FormGroup;
  //   if (elementFormGroupControl.valid) {
  //     parentArray.markAsTouched();
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  bool onRepeatItemAddCancel(
      RepeatInstance parentTableInstance, RepeatItemInstance elementInstance,
      {required bool isNew}) {
    final elementFormGroupControl = parentTableInstance.elementControl
        .control(elementInstance.name) as FormGroup;
    if (isNew) {
      if (elementFormGroupControl.valid) {
        parentTableInstance.elementControl.markAsTouched();
        return true;
      }
      parentTableInstance.elementControl.markAsTouched();
      return false;
    } else if (elementFormGroupControl.dirty) {
      if (elementFormGroupControl.valid) {
        parentTableInstance.elementControl.markAsTouched();
        return true;
      }
      parentTableInstance.elementControl.markAsTouched();
      return false;
    } else {
      if (elementFormGroupControl.valid) {
        return true;
      }
      return false;
    }
  }

  bool onRemoveLastItem(RepeatInstance parent) {
    try {
      final parentArray = form.control(parent.elementPath!) as FormArray;
      final lastParentItem = parent.elements.last;
      final itemFormGroup = form.control(lastParentItem.elementPath!);
      parent.remove(lastParentItem);
      parentArray.remove(itemFormGroup);
      logDebug(info: 'last Item deleted');
      return true;
    } catch (e) {
      logError(info: 'last Item not exist');
      return false;
    }
  }
//
// ElementExtendedControl createNewItemExtendedControl(
//     RepeatInstance repeatInstance) {
//   final parentArrayControl =
//   form.control(repeatInstance.elementPath!) as FormArray;
//   final itemControl =
//   ElementControlBuilder.forSection(repeatInstance.template);
//   final itemInstance = ElementInstanceBuilder.forRepeatItem(
//       forFlatTemplate, repeatInstance.template);
//   parentArrayControl.add(itemControl);
//   repeatInstance
//     ..add(itemInstance)
//     ..resolveDependencies()
//     ..evaluate();
//   return ElementExtendedControl(itemControl, itemInstance);
// }

// ElementExtendedControl getNextItemExtendedControl(
//     RepeatInstance repeatInstance,
//     {required int currentIndex}) {
//   final parentArrayControl =
//   form.control(repeatInstance.elementPath!) as FormArray;
//
//   final nextIndex = currentIndex + 1;
//   if (parentArrayControl.contains('$nextIndex') &&
//       repeatInstance.contains('$nextIndex')) {
//     final nextItemControl =
//     parentArrayControl.control('$nextIndex') as FormGroup;
//
//     final nextItemInstance =
//     repeatInstance.element('$nextIndex') as RepeatItemInstance;
//     return ElementExtendedControl(nextItemControl, nextItemInstance);
//   } else {
//     return createNewItemExtendedControl(
//         repeatInstance); // No more items to edit
//   }
}
