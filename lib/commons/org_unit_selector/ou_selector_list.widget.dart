import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/organisation_unit/organisation_unit_display_path_generator.dart';
import '../custom_widgets/scrollable_listview.dart';
import '../extensions/string_extension.dart';
import 'business_logic/org_unit_item.dart';
import 'ou_selector_dialog.presenter.dart';
import 'ou_selector_dialog.widget.dart';
import 'ou_selector_item.widget.dart';

class OuSelectorList extends StatefulWidget {
  OuSelectorList(
      {super.key,
      required this.selectionType,
      required this.items,
      this.onNewLevelSelected,
      required this.selectedOrgUnit});

  final OUSelectionType selectionType;
  final List<OrgUnitItem> items;

  //OrgUnit uid, orgUnit name, paretUid, canBe selected
  // ObservableInt level = new ObservableInt(1);
  // replaced with presenter.selectedParent
  final Map<int, String?> selectedParent = {};

  //orgUnitCascadeAdapterInterface;
  final void Function(bool canBeSelected)? onNewLevelSelected;

  // replaced with presenter.selectedOrgUnit
  final String? selectedOrgUnit;

  // replaced with presenter.level
  final RxInt level = RxInt(1);

  @override
  State<OuSelectorList> createState() => _OuSelectorListState();
}

class _OuSelectorListState extends State<OuSelectorList> {
  final OuSelectorDialogPresenter presenter =
      Get.find<OuSelectorDialogPresenter>();

  // OuSelectorDialogPresenter.instance;

  @override
  Widget build(BuildContext context) {
    return ScrollableListViewBuilder(
      itemCount: presenter.orgUnitItems.length,
      itemBuilder: (BuildContext context, int index) {
        presenter.orgUnitItems[index].parentUid =
            presenter.selectedParent[index];
        return OuSelectorItem(
          selectionType: widget.selectionType,
          // ouItem: widget.items[index],
          ouItem: presenter.orgUnitItems[index],
          setSelectedLevel: (String? selectedUid, bool canBeSelected) {
            // TODO(NMC): this is moved from OuSelectorItem when clear button is pressed
            // it still in OuSelectorItem
            // if no change remove from OuSelectorItem and enable this
            // Or make as a call back from item
            // if(selectedUid == null) {
            //   widget.items[index].name = null;
            //   widget.items[index].uid = null;
            // }
            if (selectedUid == null) {
              presenter.orgUnitItems[index].name = null;
              presenter.orgUnitItems[index].uid = null;
            }

            presenter.selectedParent.putIfAbsent(
                index, () => selectedUid); //Set selected orgUnit for level
            reorderSelectedParent(index);
            presenter.level.value = index;
            widget.onNewLevelSelected?.call(canBeSelected);

            // notifyDataSetChanged();
            // presenter.selectedParent.assignAll(widget.selectedParent);
            // presenter.orgUnitItems.assignAll(widget.items);
            presenter.orgUnitItems.refresh();
          },
          setSelectedParent: (String selectedUid) {
            //Set selected orgUnit for level
            presenter.selectedParent.putIfAbsent(index, () => selectedUid);
            // this.level.set(level);
            presenter.level.value = index;
          },
          index: index,
        );
      },
    );

    // return ListView.builder(
    //   // padding: widget.padding,
    //   // itemCount: widget.items.length,
    //   itemCount: presenter.orgUnitItems.length,
    //   // controller: widget.scrollController ?? _scrollController,
    //   itemBuilder: (context, index) {
    //     // widget.items[index].parentUid = presenter.selectedParent[index];
    //     presenter.orgUnitItems[index].parentUid =
    //         presenter.selectedParent[index];
    //     return OuSelectorItem(
    //       selectionType: widget.selectionType,
    //       // ouItem: widget.items[index],
    //       ouItem: presenter.orgUnitItems[index],
    //       setSelectedLevel: (String? selectedUid, bool canBeSelected) {
    //         // TODO(NMC): this is moved from OuSelectorItem when clear button is pressed
    //         // it still in OuSelectorItem
    //         // if no change remove from OuSelectorItem and enable this
    //         // Or make as a call back from item
    //         // if(selectedUid == null) {
    //         //   widget.items[index].name = null;
    //         //   widget.items[index].uid = null;
    //         // }
    //         if (selectedUid == null) {
    //           presenter.orgUnitItems[index].name = null;
    //           presenter.orgUnitItems[index].uid = null;
    //         }

    //         presenter.selectedParent.putIfAbsent(
    //             index, () => selectedUid); //Set selected orgUnit for level
    //         reorderSelectedParent(index);
    //         presenter.level.value = index;
    //         widget.onNewLevelSelected?.call(canBeSelected);

    //         // notifyDataSetChanged();
    //         // presenter.selectedParent.assignAll(widget.selectedParent);
    //         // presenter.orgUnitItems.assignAll(widget.items);
    //         presenter.orgUnitItems.refresh();
    //       },
    //       setSelectedParent: (String selectedUid) {
    //         //Set selected orgUnit for level
    //         presenter.selectedParent.putIfAbsent(index, () => selectedUid);
    //         // this.level.set(level);
    //         presenter.level.value = index;
    //       },
    //       index: index,
    //     );
    //   },
    //   shrinkWrap: true,
    // );
  }

  @override
  Future<void> didChangeDependencies() async {
    /// This method is most used by subclasses in cases when network fetches
    /// need to take place following a dependancy change which would otherwise
    /// prove too expensive to do for every build.
    ///
    if (widget.selectedOrgUnit.isNullOrEmpty) {
      // for (int ouLevel = 1; ouLevel < widget.items.length; ouLevel++) {
      for (int ouLevel = 1;
          ouLevel < presenter.orgUnitItems.length;
          ouLevel++) {
        presenter.selectedParent.putIfAbsent(ouLevel, () => '');
      }
    } else {
      final OrganisationUnit ou = (await D2Remote
          .organisationUnitModule.organisationUnit
          .byId(widget.selectedOrgUnit!)
          .getOne())!;
      final List<String> uidPath = ou.path.replaceFirst('/', '').split('/');
      for (int ouLevel = 1; ouLevel < uidPath.length + 1; ouLevel++) {
        presenter.selectedParent
            .putIfAbsent(ouLevel, () => uidPath[ouLevel - 1]);
        if (ouLevel > 1) {
          // widget.items[ouLevel - 1].parentUid = uidPath[ouLevel - 1];
          presenter.orgUnitItems[ouLevel - 1].parentUid = uidPath[ouLevel - 1];
        }
        // widget.items[ouLevel - 1].name = ou.displayNamePath()[ouLevel - 1];
        // widget.items[ouLevel - 1].uid = uidPath[ouLevel - 1];

        presenter.orgUnitItems[ouLevel - 1].name =
            ou.displayNamePath()[ouLevel - 1];
        presenter.orgUnitItems[ouLevel - 1].uid = uidPath[ouLevel - 1];
        presenter.orgUnitItems.refresh();
      }
    }
    super.didChangeDependencies();
  }

  void reorderSelectedParent(int fromLevel) {
    // for (int i = fromLevel + 1; i <= widget.items.length; i++) {
    for (int i = fromLevel + 1; i <= presenter.orgUnitItems.length; i++) {
      //Remove selected parents for levels higher than the selected one
      presenter.selectedParent.remove(i);

      // widget.items[i - 1].uid = null; //.get(i - 1).setUid(null);
      // widget.items[i - 1].name = null; //.get(i - 1).setName(null);
      // widget.items[i - 1].parentUid = null; //.get(i - 1).setParentUid(null);

      presenter.orgUnitItems[i - 1].uid = null; //.get(i - 1).setUid(null);
      presenter.orgUnitItems[i - 1].name = null; //.get(i - 1).setName(null);
      presenter.orgUnitItems[i - 1].parentUid =
          null; //.get(i - 1).setParentUid(null);
    }
  }
}
