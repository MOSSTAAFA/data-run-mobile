import 'package:d2_remote/shared/entities/identifiable_tree_node.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node_data_source.dart';
import 'package:mass_pro/data_run/screens/org_unit/org_unit_tree_view_picker.widget.dart';
import 'package:mass_pro/generated/l10n.dart';

class OrgUnitPickerField<T extends IdentifiableTreeNode>
    extends ConsumerStatefulWidget {
  const OrgUnitPickerField(
      {Key? key,
      required this.dataSource,
      this.initialValueUid,
      this.onSubmitted,
      this.autofocus = false,
      this.fieldHintText,
      this.fieldLabelText,
      this.keyboardType,
      this.onSaved})
      : super(key: key);

  final String? initialValueUid;

  final ValueChanged<String?>? onSubmitted;

  final ValueChanged<String?>? onSaved;

  final TreeNodeDataSource dataSource;

  final String? fieldHintText;

  final String? fieldLabelText;

  final TextInputType? keyboardType;

  final bool autofocus;

  @override
  _OrgUnitPickerFieldState<T> createState() => _OrgUnitPickerFieldState();
}

class _OrgUnitPickerFieldState<T extends IdentifiableTreeNode>
    extends ConsumerState<OrgUnitPickerField<T>> {
  final TextEditingController _controller = TextEditingController();
  String? _selectedNode;
  String? _inputText;
  bool _autoSelected = false;

  TreeNode<T>? _getNode(String? uid) {
    return widget.dataSource.getNode(uid) as TreeNode<T>?;
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateValueForSelectedNode();
  }

  @override
  void didUpdateWidget(OrgUnitPickerField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValueUid != oldWidget.initialValueUid) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _selectedNode = widget.initialValueUid;
          _updateValueForSelectedNode();
        });
      });
    }
  }

  void _updateValueForSelectedNode() {
    if (_selectedNode != null) {
      _inputText = _getNode(_selectedNode)!.data.displayName;
      TextEditingValue textEditingValue = TextEditingValue(text: _inputText!);
      if (widget.autofocus && !_autoSelected) {
        textEditingValue = textEditingValue.copyWith(
          selection:
              TextSelection(baseOffset: 0, extentOffset: _inputText!.length),
        );
        _autoSelected = true;
      }
      _controller.value = textEditingValue;
    } else {
      _inputText = '';
      _controller.value = TextEditingValue(text: _inputText!);
    }
  }

  void _updateNode(String? nodeUid) {
    // _selectedNode = nodeUid;
    // _inputText = _getNode(nodeUid)?.data.displayName;

    widget.onSubmitted?.call(_selectedNode);
    widget.onSaved?.call(_selectedNode);
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
    String? selectedNode;

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).selectOrgUnit),
          content: SizedBox(
            width: double.maxFinite,
            child: OrgUnitTreeViewPicker(
                dataSource: widget.dataSource,
                selectedUid: currentValue,
                onSelect: (node) {
                  selectedNode = node; // Capture selected node
                }),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without selection
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedNode ??
                    currentValue); // Confirm selection and close dialog
              },
              child: Text(S.of(context).confirm),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final InputDecorationTheme inputTheme = theme.inputDecorationTheme;

    return Semantics(
      container: true,
      child: TextFormField(
        decoration: InputDecoration(
          suffix: _selectedNode != null
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedNode = null;
                    });
                  },
                  icon: Icon(Icons.close))
              : null,
          suffixIcon: Icon(Icons.account_tree),
          hintText: _getNode(_selectedNode)?.data.displayName ??
              widget.fieldHintText ??
              S.of(context).selectOrgUnit,
          labelText: widget.fieldLabelText ?? S.of(context).selectOrgUnit,
        ).applyDefaults(
          inputTheme.copyWith(
            border: inputTheme.border ??
                (useMaterial3
                    ? const OutlineInputBorder()
                    : const UnderlineInputBorder()),
          ),
        ),
        keyboardType: widget.keyboardType,
        autofocus: widget.autofocus,
        controller: _controller,
        onTap: () async {
          String? result = await onShowPicker();
          if (result != null) {
            setState(() {
              _selectedNode = result;
            });
          }
        },
      ),
    );
  }
}
