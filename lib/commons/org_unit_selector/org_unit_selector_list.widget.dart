import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/queries/organisation_unit.query.dart';
import 'package:flutter/material.dart';

import '../../core/organisation_unit/organisation_unit_display_path_generator.dart';
import 'business_logic/org_unit_item.dart';
import 'org_unit_selector_dialog.widget.dart';
import 'org_unit_selector_item.widget.dart';

class OrgUnitSelectorList extends StatefulWidget {
  OrgUnitSelectorList(
      {super.key,
      required this.orgUnitRepository,
      required this.selectionType,
      required this.items,
      this.onNewLevelSelected,
      required this.selectedOrgUnit});

  final OrganisationUnitQuery orgUnitRepository;
  final OUSelectionType selectionType;
  final List<OrgUnitItem> items;

  //OrgUnit uid, orgUnit name, paretUid, canBe selected
  // ObservableInt level = new ObservableInt(1);
  final Map<int, String> selectedParent = {};

  //orgUnitCascadeAdapterInterface;
  final void Function(bool canBeSelected)? onNewLevelSelected;

  final String selectedOrgUnit;

  @override
  State<OrgUnitSelectorList> createState() => _OrgUnitSelectorListState();
}

class _OrgUnitSelectorListState extends State<OrgUnitSelectorList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: widget.padding,
      itemCount: widget.items.length,
      // controller: widget.scrollController ?? _scrollController,
      itemBuilder: (context, index) {
        widget.items[index].parentUid = widget.selectedParent[index];
        return OrgUnitSelectorItem(
            selectionType: widget.selectionType,
            ouItem: widget.items[index],
            setSelectedLevel: (String selectedUid, bool canBeSelected) {
              setState(() {
                widget.selectedParent.putIfAbsent(
                    index, () => selectedUid); //Set selected orgUnit for level
                reorderSelectedParent(index);
                // TODO(NMC): create the observable
                // this.level.set(level);
                widget.onNewLevelSelected?.call(canBeSelected);
              });
              widget.selectedParent.putIfAbsent(
                  index, () => selectedUid); //Set selected orgUnit for level
              reorderSelectedParent(index);
              // TODO(NMC): create the observable
              // this.level.set(level);
              widget.onNewLevelSelected?.call(canBeSelected);

              // notifyDataSetChanged();
            },
            setSelectedParent: (String selectedUid) {
              //Set selected orgUnit for level
              widget.selectedParent.putIfAbsent(index, () => selectedUid);
              // TODO(NMC): create the observable
              // this.level.set(level);
            });
      },
      shrinkWrap: true,
    );
  }

  @override
  void initState() {
    super.initState();

    /// Within initState() we can initialize variables, data, properties, etc.
    /// and subscribe to Streams, ChangeNotifiers, or any other object that
    /// could change the data on a given widget.
  }

  @override
  Future<void> didChangeDependencies() async {
    /// This method is most used by subclasses in cases when network fetches
    /// need to take place following a dependancy change which would otherwise
    /// prove too expensive to do for every build.
    ///
    if (widget.selectedOrgUnit.isEmpty) {
      for (int ouLevel = 1; ouLevel < widget.items.length; ouLevel++) {
        widget.selectedParent.putIfAbsent(ouLevel, () => '');
      }
    } else {
      final OrganisationUnit ou = (await D2Remote
          .organisationUnitModule.organisationUnit
          .byId(widget.selectedOrgUnit)
          .getOne())!;
      final List<String> uidPath = ou.path.replaceFirst('/', '').split('/');
      for (int ouLevel = 1; ouLevel < uidPath.length + 1; ouLevel++) {
        widget.selectedParent.putIfAbsent(ouLevel, () => uidPath[ouLevel - 1]);
        if (ouLevel > 1) {
          widget.items[ouLevel - 1].parentUid = uidPath[ouLevel - 1];
        }
        widget.items[ouLevel - 1].name = ou.displayNamePath()[ouLevel - 1];
        widget.items[ouLevel - 1].uid = uidPath[ouLevel - 1];
      }
    }
    super.didChangeDependencies();
  }

  void reorderSelectedParent(int fromLevel) {
    for (int i = fromLevel + 1; i <= widget.items.length; i++) {
      //Remove selected parents for levels higher than the selected one
      widget.selectedParent.remove(i);

      widget.items[i - 1].uid = null; //.get(i - 1).setUid(null);
      widget.items[i - 1].name = null; //.get(i - 1).setName(null);
      widget.items[i - 1].parentUid = null; //.get(i - 1).setParentUid(null);
    }
  }
}
