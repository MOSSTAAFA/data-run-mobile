import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/metadatarun/org_unit/entities/org_unit.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/org_unit/org_units_notifier.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';

class QOrgUnitField extends ConsumerStatefulWidget {
  const QOrgUnitField({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  ConsumerState<QOrgUnitField> createState() => _QOrgUnitFieldState();
}

class _QOrgUnitFieldState extends ConsumerState<QOrgUnitField> {
  @override
  Widget build(BuildContext context) {
    // ref.watch(orgUnitsNotifierProvider.notifier);
    return FormBuilderField<OrgUnit>(
      key: ValueKey(widget.fieldModel.uid),
      valueTransformer: (OrgUnit? orgUnit) => orgUnit?.uid,
      builder: (FormFieldState<OrgUnit> field) {
        return Autocomplete<OrgUnit>(
          // optionsViewBuilder: (
          //   BuildContext context,
          //   AutocompleteOnSelected<OrgUnit> onSelected,
          //   Iterable<OrgUnit> options,
          // ) {},
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<OrgUnit>.empty();
            }
            return _kOptions.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (OrgUnit selection) {
            field.didChange(selection);
          },
        );
      },
      onReset: () => widget.fieldModel.onClear(),
      name: widget.fieldModel.uid,
      enabled: widget.fieldModel.isEditable,
      validator: widget.fieldModel.isMandatory
          ? FormBuilderValidators.required()
          : null,
      initialValue: widget.fieldModel.getOption(),
      options: _getChipOptions(
          widget.fieldModel.optionConfiguration!.optionsToDisplay,
          wide: false),
      onChanged: (FormOption? value) {
        widget.fieldModel.onSaveOption(value);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(gapPadding: 20),
        contentPadding: const EdgeInsets.all(16),
        labelText: widget.fieldModel.label,
        labelStyle: Theme.of(context).textTheme.titleLarge,
        // fillColor: Colors.red.shade200,
      ),
    );
  }

  List<FormBuilderChipOption<FormOption>> _getChipOptions(
      IList<FormOption> options,
      {bool? wide}) {
    return options
        .map((FormOption option) => FormBuilderChipOption<FormOption>(
              value: option,
              // avatar: !(wide ?? false)
              //     ? CircleAvatar(
              //         child: Icon(getRandomIcon(option.name), size: 30))
              //     : null,
              child: wide ?? false
                  ? Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        children: <Widget>[
                          Text(getItemLocalString(option.label)),
                          /*Icon(
                            getRandomIcon(option.name),
                            size: 30,
                          ),*/
                        ],
                      ))
                  : Text(getItemLocalString(option.label)),
            ))
        .toList();
  }
}
