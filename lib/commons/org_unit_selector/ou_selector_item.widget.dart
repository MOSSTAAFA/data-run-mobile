import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit_level.entity.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/app_dropdown_button.dart';
import '../extensions/string_extension.dart';
import '../helpers/trio.dart';
import 'business_logic/org_unit_item.dart';
import 'ou_selector_dialog.widget.dart';

class OuSelectorItem extends StatefulWidget {
  const OuSelectorItem(
      {super.key,
      required this.selectionType,
      required this.ouItem,
      required this.setSelectedLevel,
      required this.setSelectedParent});

  // final OrgUnitCascadeLevelItemBinding binding;
  // final OrgUnitCascadeAdapter adapter;
  final OUSelectionType selectionType;

  final OrgUnitItem ouItem;

  // void Function(int level, String selectedUid, bool canBeSelected) setSelectedLevel;
  final void Function(String? selectedUid, bool canBeSelected) setSelectedLevel;

  final void Function(String selectedUid) setSelectedParent;

  @override
  State<OuSelectorItem> createState() => _OuSelectorItemState();
}

class _OuSelectorItemState extends State<OuSelectorItem> {
  bool _enabled = false;
  late final String _levelName;
  String? _selectedOrgUnit;
  late Trio<String, String, bool> _selectedItem;

  late List<Trio<String, String, bool>> _menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppDropdownButton<Trio<String, String, bool>>(
            // labelText: _levelName,
            blankLabel: _levelName,
            blankValue: null,
            // showBlank: true,
            value: _selectedItem,
            onChanged: (Trio<String, String, bool>? item) async {
              _selectedOrgUnit = item!
                  .first; //item.getOrder() < 0 ? null : ouItem.getLevelOrgUnits().get(item.getOrder()).val0();
              // binding.levelText.setText(item.getOrder() < 0
              //     ? data.get(0).val1()
              //     : data.get(item.getOrder()).val1());
              widget.ouItem.name = item
                  .second; //.setName(item.getOrder() < 0 ? data.get(0).val1() : data.get(item.getOrder()).val1());
              widget.ouItem.uid = item
                  .first; //.setUid(item.getOrder() < 0 ? data.get(0).val0() : data.get(item.getOrder()).val0());
              final bool canBeSelected = await _getCanBeSelected(_selectedOrgUnit!);

              widget.setSelectedLevel.call(_selectedOrgUnit, canBeSelected);
            },
            items: _menuItems
                .map((Trio<String, String, bool> item) => DropdownMenuItem(
                      value: item,
                      child: Text(item.second),
                    ))
                .toList()),
        const SizedBox(width: 16.0),
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _selectedOrgUnit = null;
              _levelName = _getLevelLabel();

              widget.ouItem.name = null; //.setName(null);
              widget.ouItem.uid = null; //.setUid(null);
              widget.setSelectedLevel.call(
                  _selectedOrgUnit,
                  false);
            });
          },
        ),
      ],
    );
  }

  @override
  Future<void> didChangeDependencies() async {
    /// This method is most used by subclasses in cases when network fetches
    /// need to take place following a dependancy change which would otherwise
    /// prove too expensive to do for every build.
    ///
    _levelName = _getLevelLabel();

    _menuItems = await _getMenuItems();

    super.didChangeDependencies();
  }

  Future<bool> _getCanBeSelected(String orgUnit) async {
    bool canBeSelected = false;
    if (widget.selectionType == OUSelectionType.SEARCH) {
      canBeSelected = (await D2Remote.organisationUnitModule.organisationUnit
              .byId(orgUnit)
              .count()) >
          0;
    } else {
      canBeSelected = (await D2Remote.organisationUnitModule.organisationUnit
              // TODO(NMC): Edit after implementing ouScope
              // .byOrganisationUnitScope(OrganisationUnitScope.SCOPE_DATA_CAPTURE)
              .byId(orgUnit)
              .count()) >
          0;
    }
    return canBeSelected;
  }

  Future<List<Trio<String, String, bool>>> _getMenuItems() async {
    // binding.levelText.setOnClickListener(view -> {
    // if (ouItem.getLevel() == 1 || !isEmpty(ouItem.getParentUid()))
    // menu.show();
    // });
    final bool canCaptureData = await widget.ouItem.canCaptureData();
    final List<Trio<String, String, bool>> levelOrgUnits =
        await widget.ouItem.getLevelOrgUnits();
    if ((widget.ouItem.level == 1 && !canCaptureData) ||
        widget.ouItem.level > 1 &&
            levelOrgUnits.length == 1 &&
            !widget.ouItem.parentUid.isNullOrEmpty &&
            !canCaptureData) {
      final Trio<String, String, bool> selectedOu =
          (await widget.ouItem.getLevelOrgUnits())[0]; //.get(0);
      _selectedOrgUnit = selectedOu.first; //.val0();

      _selectedItem = selectedOu;
      // binding.levelText.setText(selectedOu.val1());

      widget.ouItem.name = selectedOu.second; //.setName(selectedOu.val1());
      widget.ouItem.uid = selectedOu.first; //.setUid(selectedOu.val0());
      widget.setSelectedParent.call(_selectedOrgUnit!);
      _enabled = false; //binding.levelText.setEnabled(false);
      // binding.levelText.setClickable(false);
    } else {
      _enabled = true;
      // binding.levelText.setEnabled(true);
      // binding.levelText.setClickable(true);
      // setMenu(widget.ouItem.getLevelOrgUnits());
    }
    return widget.ouItem.getLevelOrgUnits();
  }

  String _getLevelLabel() {
    OrganisationUnitLevel? orgUnitLevel = widget.ouItem.organisationUnitLevel;
    if (widget.ouItem.name != null) {
      return widget.ouItem.name!;
      // binding.levelText.setText(ouItem.getName());
    } else if (orgUnitLevel != null) {
      return orgUnitLevel.displayName!;
      // binding.levelText.setText(orgUnitLevel.displayName());
    } else {
      return 'Level ${widget.ouItem.level}';
      // binding.levelText.setText(String.format("Level %d", ouItem.getLevel()));
    }
  }
}
