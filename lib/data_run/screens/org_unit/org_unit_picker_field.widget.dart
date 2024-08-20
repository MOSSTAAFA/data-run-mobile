import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/org_unit/model/tree_node.dart';
import 'package:mass_pro/data_run/screens/org_unit/model/tree_node_data_source.dart';
import 'package:mass_pro/data_run/screens/org_unit/org_unit_picker_dialog.widget.dart';
import 'package:mass_pro/generated/l10n.dart';

class OrgUnitPickerField extends StatefulWidget {
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
      this.validator,
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

  final FormFieldValidator<String>? validator;

  @override
  _OrgUnitPickerFieldState createState() => _OrgUnitPickerFieldState();
}

class _OrgUnitPickerFieldState extends State<OrgUnitPickerField/*<T>*/ > {
  late final TextEditingController _controller;
  String? _selectedNode;
  GlobalKey<FormFieldState<String>> _fieldkey =
      GlobalKey<FormFieldState<String>>();

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged?.call(_selectedNode);
      widget.onSubmitted?.call(_selectedNode);
    });
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
        widget.onChanged?.call(_selectedNode);
        widget.onSubmitted?.call(_selectedNode);
      });
    }
  }

  void _clearValue() {
    setState(() {
      _controller.text = '';
      _selectedNode = null;
    });
    widget.onChanged?.call(null);
    widget.onSubmitted?.call(null);
  }

  Future<void> onShowPicker() async {
    final selectedOrgUnit = await _showOrgUnitPickerDialog(_selectedNode);

    if (selectedOrgUnit != null) {
      final node = _getNode(selectedOrgUnit);
      setState(() {
        _controller.text = node!.displayName ?? node.name ?? '';
        _selectedNode = selectedOrgUnit;
      });
      widget.onChanged?.call(selectedOrgUnit);
      widget.onSubmitted?.call(selectedOrgUnit);
    }
  }

  Future<String?> _showOrgUnitPickerDialog(String? currentValue) async {
    return showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
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

    return TextFormField(
      readOnly: true,
      validator: widget.validator,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: _selectedNode != null
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: _clearValue,
                icon: Icon(Icons.close))
            : null,
        prefixIcon: Icon(Icons.account_tree),
        hintText: widget.fieldHintText ?? S.of(context).orgUnitHelpText,
        labelText: widget.fieldLabelText ?? S.of(context).orgUnitInputLabel,
      ).applyDefaults(
        inputTheme
            .copyWith(border: effectiveInputBorder),
      ),
      controller: _controller,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.bodyMedium,
      // onChanged: (value) {
      //   debugPrint('## onChanged: $value');
      //   widget.onChanged?.call(value);
      // },
      // onSaved: (value) {
      //   debugPrint('## onSaved: $value');
      //   widget.onSaved?.call(value);
      // },
      // onFieldSubmitted: (value) {
      //   debugPrint('## onFieldSubmitted: $value');
      //   widget.onSubmitted?.call(value);
      //
      // },
      onTap: onShowPicker,
    );
  }
}
