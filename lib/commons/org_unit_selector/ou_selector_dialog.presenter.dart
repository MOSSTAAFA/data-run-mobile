import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit_level.entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../extensions/string_extension.dart';
import 'business_logic/org_unit_item.dart';
import 'ou_selector_dialog.widget.dart';

class OuSelectorDialogPresenter extends GetxController implements Listenable {
  // OuSelectorDialogPresenter(String? selectedOu, OUSelectionType selectionType):super() {
  //   selectedOrgUnit.value = selectedOu;
  //   ouSelectionType = Rx<OUSelectionType>(selectionType);
  // }
  /// Adapter vars, OuSelectorList vars
  final RxInt level = RxInt(1);
  final RxMap<int, String?> selectedParent = <int, String?>{}.obs;

  // final Rx<String?> selectedOrgUnit = Rx<String?>(null);

  /// Dialog vars
  final RxList<OrganisationUnit> orgUnits = <OrganisationUnit>[].obs;
  final RxList<OrgUnitItem> orgUnitItems = <OrgUnitItem>[].obs;

  Stream<List<OrgUnitItem>> get orgUnitItemsStream => orgUnitItems.stream;

  final RxBool acceptButtonEnabled = false.obs;
  final Rx<String?> orgUnitSearchText = Rx<String?>(null);

  // late final Rx<OUSelectionType?> ouSelectionType;
  /// You do not need that. I recommend using it just for ease of syntax.
  /// with static method: Controller.to.increment();
  /// with no static method: Get.find<Controller>().increment();
  /// There is no difference in performance, nor any side effect of using either syntax. Only one does not need the type, and the other the IDE will autocomplete it.
  static OuSelectorDialogPresenter get instance => Get.find();

  Future<void> lookUpOrgUnits(String value) async {
    orgUnits.value = await D2Remote.organisationUnitModule.organisationUnit
        .like(attribute: 'displayName', value: '%$value%')
        .get();
  }

  Future<void> loadOrgUnitItems(OUSelectionType ouSelectionType) async {
    // orgUnitItems.value
    final List<OrganisationUnit> ouList =
        await D2Remote.organisationUnitModule.organisationUnit.get();
    int maxLevel = -1;
    for (final OrganisationUnit ou in ouList) {
      if (maxLevel < ou.level!) {
        maxLevel = ou.level!;
      }
    }
    final List<OrgUnitItem> ouItems = [];
    for (int i = 1; i <= maxLevel; i++) {
      final List<OrganisationUnit> ous =
          await D2Remote.organisationUnitModule.organisationUnit.get();
      final OrgUnitItem orgUnitItem =
          OrgUnitItem(ouSelectionType: ouSelectionType);
      orgUnitItem.maxLevel = maxLevel; //.setMaxLevel(maxLevel);
      orgUnitItem.level = i; //.setLevel(i);
      // TODO(DH): CHECK IF OU ALREADY SELECTED
      orgUnitItem.organisationUnitLevel = await D2Remote
          .organisationUnitModule.organisationUnitLevel
          .where(attribute: 'level', value: i)
          .getOne();
      ouItems.add(orgUnitItem);
    }

    orgUnitItems.value = ouItems;
  }

  String? getSelectedOrgUnit() {
    String? selectedUid;
    for (int i = 1; i <= selectedParent.length; i++) {
      if (!selectedParent[i].isNullOrEmpty) {
        selectedUid = selectedParent[i];
      }
    }
    return selectedUid;
  }
}
