import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';

import '../commons/custom_widgets/org_unit_dialog.dart';

class OrgUnitInput extends StatefulWidget {
  const OrgUnitInput({super.key});

  @override
  State<OrgUnitInput> createState() => _OrgUnitInputState();
}

class _OrgUnitInputState extends State<OrgUnitInput> {
  List<OrganisationUnit> orgUnits = []; //createOrgUnitTree();

  String? _selectedOrgUnit = '';

  Future _showOrgUnitList(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) => OrgUnitDialog(orgUnits: orgUnits),
    );

    if (result != null) {
      setState(() {
        _selectedOrgUnit = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showOrgUnitList(context),
      child: AbsorbPointer(
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Org Unit',
            hintText: 'Select an org unit',
          ),
          controller: TextEditingController(text: _selectedOrgUnit),
        ),
      ),
    );
  }
}
