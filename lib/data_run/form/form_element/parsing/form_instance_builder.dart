import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/choice_filter.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_state.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_instance_builder.g.dart';

@riverpod
Future<FormInstanceBuilder> formInstanceBuilder(FormInstanceBuilderRef ref,
    {required FormMetadata formMetadata}) async {
  final formFlatTemplate = await ref
      .watch(formFlatTemplateProvider(formMetadata: formMetadata).future);

  return FormInstanceBuilder(formFlatTemplate: formFlatTemplate);
}

class FormInstanceBuilder {
  FormInstanceBuilder({required this.formFlatTemplate});

  final FormFlatTemplate formFlatTemplate;

  Map<String, FormElementInstance<dynamic>> buildFormElements(FormGroup form,
      {dynamic initialFormValue}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};

    for (var template in formFlatTemplate.formTemplate.fields) {
      template.fields.sort((a, b) => (a.order).compareTo(b.order));

      elements[template.name] = buildFormElement(form, template,
          initialFormValue: initialFormValue?[template.name]);
    }

    return elements;
  }

  FormElementInstance<dynamic> buildFormElement(
      FormGroup form, FieldTemplate template,
      {dynamic initialFormValue}) {
    if (template.type.isSection) {
      return buildSectionInstance(form, template,
          initialFormValue: initialFormValue);
    } else if (template.type.isRepeatSection) {
      return buildRepeatInstance(form, template,
          initialFormValue: initialFormValue);
    } else {
      return buildFieldInstance(form, template,
          initialFormValue: initialFormValue);
    }
  }

  SectionInstance buildSectionInstance(
      FormGroup rootFormControl, FieldTemplate template,
      {dynamic initialFormValue}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};
    template.fields.sort((a, b) => (a.order).compareTo(b.order));

    final section = SectionInstance(form: rootFormControl, template: template);

    for (var childTemplate in template.fields) {
      elements[childTemplate.name] = buildFormElement(
          rootFormControl, childTemplate,
          initialFormValue: initialFormValue?[childTemplate.name]);
    }
    section.addAll(elements);

    return section;

    // final Map<String, FormElementInstance<dynamic>> elements = {};
    //
    // template.fields.sort((a, b) => (a.order).compareTo(b.order));
    //
    // for (var childTemplate in template.fields) {
    //   elements[childTemplate.name] = buildFormElement(
    //       rootFormControl, childTemplate,
    //       initialFormValue: initialFormValue?[childTemplate.name]);
    // }
    //
    // final section = SectionInstance(
    //     form: rootFormControl, template: template, elements: elements);
    //
    // return section;
  }

  RepeatItemInstance buildRepeatItem(
      FormGroup rootFormControl, FieldTemplate template,
      {Map<String, Object?>? initialFormValue}) {
    final Map<String, FormElementInstance<dynamic>> elements = {};

    template.fields.sort((a, b) => (a.order).compareTo(b.order));
    final repeatedSection =
        RepeatItemInstance(template: template, form: rootFormControl);
    for (var childTemplate in template.fields) {
      elements[childTemplate.name] = buildFormElement(
          rootFormControl, childTemplate,
          initialFormValue: initialFormValue?[childTemplate.name]);
    }
    repeatedSection.addAll(elements);
    return repeatedSection;

    // final Map<String, FormElementInstance<dynamic>> elements = {};
    //
    // template.fields.sort((a, b) => (a.order).compareTo(b.order));
    // for (var childTemplate in template.fields) {
    //   elements[childTemplate.name] = buildFormElement(
    //       rootFormControl, childTemplate,
    //       initialFormValue: initialFormValue?[childTemplate.name]);
    // }
    //
    // final repeatedSection = RepeatItemInstance(
    //     template: template, form: rootFormControl, elements: elements);
    // return repeatedSection;
  }

  RepeatInstance buildRepeatInstance(
      FormGroup rootFormControl, FieldTemplate template,
      {List<dynamic>? initialFormValue}) {
    final List<RepeatItemInstance> elements = initialFormValue
            ?.map((value) => buildRepeatItem(rootFormControl, template,
                initialFormValue: value))
            .toList() ??
        [];

    final repeatedSection =
        RepeatInstance(template: template, form: rootFormControl);

    repeatedSection.addAll(elements);
    return repeatedSection;
    //
    // final repeatInstance = RepeatInstance(
    //     template: template,
    //     form: rootFormControl,
    //     elements: initialFormValue
    //             ?.map((value) => buildRepeatItem(rootFormControl, template,
    //                 initialFormValue: value))
    //             .toList() ??
    //         []);
    //
    // return repeatInstance;
  }

  FieldInstance<dynamic> buildFieldInstance(
      FormGroup rootFormControl, FieldTemplate templateElement,
      {dynamic initialFormValue}) {
    switch (templateElement.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
      case ValueType.OrganisationUnit:
        return FieldInstance<String>(
            form: rootFormControl,
            elementProperties: FieldElementState<String>(
                value: initialFormValue, mandatory: templateElement.mandatory),
            template: templateElement);
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FieldInstance<int>(
            form: rootFormControl,
            elementProperties: FieldElementState<int>(
                value: initialFormValue, mandatory: templateElement.mandatory),
            template: templateElement);

      case ValueType.Number:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Age:
        return FieldInstance<double>(
          form: rootFormControl,
          elementProperties: FieldElementState<double>(
              value: initialFormValue, mandatory: templateElement.mandatory),
          template: templateElement,
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FieldInstance<bool>(
          form: rootFormControl,
          elementProperties: FieldElementState<bool>(
              value: initialFormValue, mandatory: templateElement.mandatory),
          template: templateElement,
        );
      case ValueType.SelectOne:
        return FieldInstance<String>(
          form: rootFormControl,
          choiceFilter: templateElement.choiceFilter != null
              ? ChoiceFilter(
                  expression: templateElement.evalChoiceFilterExpression!,
                  options:
                      formFlatTemplate.optionLists[templateElement.listName!] ??
                          [])
              : null,
          elementProperties: FieldElementState<String>(
              value: initialFormValue,
              mandatory: templateElement.mandatory,
              visibleOptions:
                  formFlatTemplate.optionLists[templateElement.listName!] ??
                      []),
          template: templateElement,
        );
      case ValueType.SelectMulti:
        return FieldInstance<List<String>>(
            form: rootFormControl,
            choiceFilter: templateElement.choiceFilter != null
                ? ChoiceFilter(
                    expression: templateElement.evalChoiceFilterExpression!,
                    options: formFlatTemplate
                            .optionLists[templateElement.listName!] ??
                        [])
                : null,
            elementProperties: FieldElementState<List<String>>(
                value: initialFormValue != null
                    ? (initialFormValue is List)
                        ? initialFormValue.cast<String>()
                        : <String>[initialFormValue]
                    : <String>[],
                mandatory: templateElement.mandatory,
                visibleOptions: templateElement.options),
            template: templateElement);
      default:
        throw Exception('Unsupported element type: ${templateElement.type}');
    }
  }
}
