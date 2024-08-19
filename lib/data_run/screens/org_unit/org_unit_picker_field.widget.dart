import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node_data_source.dart';
import 'package:mass_pro/data_run/screens/org_unit/org_unit_picker.widget.dart';
import 'package:mass_pro/data_run/screens/org_unit/org_unit_picker_dialog.widget.dart';
import 'package:mass_pro/generated/l10n.dart';

class OrgUnitPickerField extends ConsumerStatefulWidget {
  const OrgUnitPickerField(
      {Key? key,
      required this.dataSource,
      this.initialValueUid,
      this.onSubmitted,
      this.autofocus = false,
      this.fieldHintText,
      this.fieldLabelText,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.onSaved})
      : super(key: key);

  final String? initialValueUid;

  final ValueChanged<String?>? onSubmitted;

  final ValueChanged<String?>? onSaved;
  final ValueChanged<String?>? onChanged;

  final TreeNodeDataSource dataSource;

  final String? fieldHintText;

  final String? fieldLabelText;

  final TextInputType? keyboardType;

  final bool autofocus;

  final FocusNode? focusNode;

  @override
  _OrgUnitPickerFieldState createState() => _OrgUnitPickerFieldState();
}

class _OrgUnitPickerFieldState
    extends ConsumerState<OrgUnitPickerField/*<T>*/ > {
  late final TextEditingController _controller;
  String? _selectedNode;

  TreeNode? _getNode(String? uid) {
    return widget.dataSource.getNode(uid);
  }

  @override
  void initState() {
    super.initState();

    if (widget.initialValueUid == null &&
        widget.dataSource.getSelectableNodesUids().length == 1) {
      _selectedNode = widget.dataSource.getSelectableNodesUids().first;
    } else {
      _selectedNode = widget.initialValueUid;
    }

    _controller = TextEditingController();
    final node = _getNode(_selectedNode);
    _controller.text =
        _selectedNode == null ? '' : (node?.displayName ?? node?.name)!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(OrgUnitPickerField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValueUid != oldWidget.initialValueUid) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _selectedNode = widget.initialValueUid;
          final node = _getNode(_selectedNode);
          _controller.text =
              _selectedNode == null ? '' : (node?.displayName ?? node?.name)!;
        });
      });
    }
  }

  void _updateNode(String? nodeUid) {
    setState(() {
      _selectedNode = nodeUid;
      final node = _getNode(_selectedNode);
      _controller.text =
          _selectedNode == null ? '' : (node?.displayName ?? node?.name)!;

      widget.onSubmitted?.call(_selectedNode);
      widget.onSaved?.call(_selectedNode);
    });
  }

  void _clearValue() {
    setState(() {
      _selectedNode = null;
      _controller.text = '';
    });
  }

  Future<String?> onShowPicker() async {
    String? currentValue = _selectedNode;
    String? newValue;

    newValue = await _showOrgUnitPickerDialog(currentValue);
    if (!mounted) return null;
    final finalValue = newValue ?? currentValue;
    _updateNode(finalValue);
    return finalValue;
  }

  // In the _showOrgUnitPickerDialog:
  Future<String?> _showOrgUnitPickerDialog(String? currentValue) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // title: Text(S.of(context).orgUnitDialogTitle),
          child: OrgUnitPickerDialog(
            cancelText: S.of(context).cancel,
            confirmText: S.of(context).confirm,
            dataSource: widget.dataSource,
            initialNode: currentValue,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final DatePickerThemeData datePickerTheme = theme.datePickerTheme;
    final InputDecorationTheme inputTheme = theme.inputDecorationTheme;
    final InputBorder effectiveInputBorder =
        datePickerTheme.inputDecorationTheme?.border ??
            theme.inputDecorationTheme.border ??
            (useMaterial3
                ? const OutlineInputBorder()
                : const UnderlineInputBorder());

    return Semantics(
      container: true,
      child: FormBuilderField<String?>(
          name: 'orgUnit',
          // valueTransformer: (value) => _selectedNode,
          builder: (field) => TextFormField(
                readOnly: true,
                validator: FormBuilderValidators.required(),
                decoration: InputDecoration(
                  suffixIcon: _selectedNode != null
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: _clearValue,
                          icon: Icon(Icons.close))
                      : null,
                  prefixIcon: Icon(Icons.account_tree),
                  hintText:
                      widget.fieldHintText ?? S.of(context).orgUnitHelpText,
                  labelText:
                      widget.fieldLabelText ?? S.of(context).orgUnitInputLabel,
                ).applyDefaults(
                  inputTheme
                      // .merge(datePickerTheme.inputDecorationTheme)
                      .copyWith(border: effectiveInputBorder),
                ),
                keyboardType: widget.keyboardType,
                autofocus: widget.autofocus,
                controller: _controller,
                focusNode: widget.focusNode,
                style: Theme.of(context).textTheme.bodySmall,
                onChanged: (value) {
                  widget.onChanged?.call(value);
                },
                onSaved: (value) {
                  field.didChange(value);
                  widget.onChanged?.call(value);
                },
                onFieldSubmitted: (value) {
                  field.didChange(value);
                  widget.onChanged?.call(value);
                },
                onTap: onShowPicker,
              )),
    );
  }
}
