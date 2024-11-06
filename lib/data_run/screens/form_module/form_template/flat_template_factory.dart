import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';

class FlatTemplateFactory {
  static List<FormElementTemplate> flatTemplateWithPath(
      List<FieldTemplate> templates,
      {String? initialPath}) {
    List<FormElementTemplate> result = [];
    for (var template in templates) {
      result.addAll(_flattenElementTemplate(template, prefix: initialPath));
    }
    return result;
  }

  static List<FormElementTemplate> _flattenElementTemplate(
      FieldTemplate template,
      {String? prefix}) {
    String fullPrefix =
        prefix != null ? '$prefix.${template.name}' : template.name;
    List<FormElementTemplate> result = [];

    if (!template.type.isSectionType) {
      result.add(FieldElementTemplate(
        type: template.type,
        name: template.name,
        order: template.order,
        listName: template.listName,
        label: template.label.lock,
        path: fullPrefix,
        mandatory: template.mandatory,
        mainField: template.mainField,
        rules: template.rules,
        referenceInfo: template.referenceInfo,
        choiceFilter: template.choiceFilter,
        defaultValue: template.defaultValue,
        options: template.options,
        calculation: template.calculation,
        fieldValueRenderingType: template.fieldValueRenderingType,
        filterDependencies: template.filterDependencies,
        ruleDependencies: template.dependencies,
      ));
    } else if (template.type.isSectionType) {
      result.add(SectionElementTemplate(
        type: template.type,
        name: template.name,
        label: template.label.lock,
        order: template.order,
        fieldValueRenderingType: template.fieldValueRenderingType,
        path: fullPrefix,
        rules: template.rules,
        itemTitle: template.itemTitle,
        ruleDependencies: template.dependencies,
      ));
      result.addAll(
          flatTemplateWithPath(template.fields, initialPath: fullPrefix));
    }
    return result;
  }
}
