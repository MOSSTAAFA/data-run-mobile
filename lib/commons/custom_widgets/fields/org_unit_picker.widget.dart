// Flutter imports:
// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../org_unit_selector/ou_selector_dialog.widget.dart';
import 'decorated_form_field.dart';

// D:\Hamza\Learn\my-projects\Flutter\mass_pro\lib\commons\date\field_with_issue.dart
final navigatorKey = GlobalKey<NavigatorState>();

class OrgUnitPicker extends StatefulWidget {
  const OrgUnitPicker({
    super.key,
    required this.onSelected,
    // this.selectedDate,
    this.selectedOrgUnit,

    /// Temporary for displaying orgUnit Name
    this.labelText,
    this.validator,
    this.autoValidate = false,
    this.allowClearing = false,
    this.message,
  });

  final String? labelText;
  // final String? selectedDate;
  final String? selectedOrgUnit;
  final Function(String?, bool) onSelected;
  final String? Function(String?)? validator;
  final bool autoValidate;
  final bool allowClearing;
  final String? message;

  @override
  OrgUnitPickerState createState() => OrgUnitPickerState();
}

class OrgUnitPickerState extends State<OrgUnitPicker> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  // String? _pendingValue;
  String? _displayName;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFoucsChanged);
  }

  @override
  void didChangeDependencies() {
    if (widget.selectedOrgUnit != null) {
      D2Remote.organisationUnitModule.organisationUnit
          .byId(widget.selectedOrgUnit!)
          .getOne()
          .then((OrganisationUnit? value) {
        _displayName = value!.displayName;
        _textController.text = value.displayName!;
      });
      // _textController.text = widget.selectedOrgUnit!;
    }

    super.didChangeDependencies();
  }

  void _onFoucsChanged() {
    if (!_focusNode.hasFocus) {
      // _textController.text = formatDate(widget.selectedDate, context);
      if (widget.selectedOrgUnit != null) {
        // _textController.text = formatDate(widget.selectedDate, context);
        _textController.text = _displayName ?? '';
      }
      // setState(() {
      //   _pendingValue = null;
      // });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.removeListener(_onFoucsChanged);
    _focusNode.dispose();

    super.dispose();
  }

  Future<void> _showOrgUnitPicker() async {
    await showDialog<OuSelectorDialog>(
        context: context,
        builder: (BuildContext context) {
          return Card(
            elevation: 0,
            color: Colors.white,
            child: OuSelectorDialog(
                title: 'title',
                selectedOrgUnit: null,
                textChangedConsumer:
                    (String selectedOrgUnitUid, String selectedOrgUnitName) {
                  _textController.text = selectedOrgUnitName;
                  widget.onSelected(selectedOrgUnitUid, false);
                },
                onDialogCancelled: () {},
                onClear: () {},
                ouSelectionType: OUSelectionType.CAPTURE),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var label = widget.labelText;
    if (widget.message != null && widget.selectedOrgUnit == null) {
      label = '$label • ${widget.message}';
    }

    return DecoratedFormField(
      focusNode: _focusNode,
      validator: widget.validator,
      readOnly: true,
      controller: _textController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: /* _pendingValue ?? */ label ?? '',
        suffixIcon: widget.allowClearing && widget.selectedOrgUnit != null
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _textController.text = '';
                  widget.onSelected('', false);
                },
              )
            : IconButton(
                icon: const Icon(MdiIcons.familyTree),
                onPressed: () async => _showOrgUnitPicker(),
              ),
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          widget.onSelected('', false);
        } else {
          widget.onSelected(value, true);

          // setState(() {
          //   _pendingValue = value;
          // });
        }
      },
    );
  }
}
