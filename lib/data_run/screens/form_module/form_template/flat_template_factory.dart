import 'package:d2_remote/modules/datarun/form/shared/field_template.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:d2_remote/modules/datarun/form/shared/template_extensions/form_traverse_extension.dart';
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
    List<FormElementTemplate> result = [];

    if (template.isSection) {
      String fullPrefix =
          prefix != null ? '$prefix.${template.name}' : template.name!;

      result.add(SectionElementTemplate(
          name: template.name,
          label: template.label,
          order: template.order,
          fieldValueRenderingType: template.fieldValueRenderingType,
          path: fullPrefix,
          properties: template.properties,
          rules: template.rules,
          itemTitle: template.itemTitle,
          ruleDependencies: template.dependencies,
          children:
              flatTemplateWithPath(template.fields, initialPath: fullPrefix)));
      // result.addAll(
      //     flatTemplateWithPath(template.fields, initialPath: fullPrefix));
    } else if (template.isRepeat) {
      String fullPrefix = prefix != null
          ? '$prefix.${template.name}.{key}'
          : '${template.name!}.{key}';
      result.add(RepeatElementTemplate(
          name: template.name,
          label: template.label,
          order: template.order,
          fieldValueRenderingType: template.fieldValueRenderingType,
          path: fullPrefix,
          properties: template.properties,
          rules: template.rules,
          itemTitle: template.itemTitle,
          ruleDependencies: template.dependencies,
          // pathTemplate: '${fullPrefix}.{key}',
          repeatCount: template.repeatCount,
          children:
              flatTemplateWithPath(template.fields, initialPath: fullPrefix)));
      // result.addAll(
      //     flatTemplateWithPath(template.fields, initialPath: fullPrefix));
    } else if (!template.isSection) {
      String fullPrefix =
          prefix != null ? '$prefix.${template.name}' : template.name!;
      result.add(FieldElementTemplate(
        type: template.type,
        name: template.name,
        order: template.order,
        listName: template.listName,
        label: template.label,
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
    }
    return result;
  }
}
