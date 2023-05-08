// TODO(NMC): move to SDK OrgUnit
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit_level.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/queries/organisation_unit.query.dart';
import 'package:dartx/dartx_io.dart';

import '../../../core/organisation_unit/organisation_unit_display_path_generator.dart';
import '../../../core/organisation_unit/organisation_unit_scope.dart';
import '../../helpers/collections.dart';
import '../ou_selector_dialog.widget.dart';

class OrgUnitItem {
  OrgUnitItem({required OUSelectionType ouSelectionType}) {
    ouScope = ouSelectionType == OUSelectionType.SEARCH
        ? OrganisationUnitScope.SCOPE_TEI_SEARCH
        : OrganisationUnitScope.SCOPE_DATA_CAPTURE;
  }

  late OrganisationUnit organisationUnit;
  late int level;
  String? uid;
  String? parentUid;
  late bool hasCaptureOrgUnits;
  late final OrganisationUnitScope ouScope;
  late int maxLevel;

  String? name;
  OrganisationUnitLevel? organisationUnitLevel;

  Future<bool> canCaptureData() async {
    OrganisationUnitQuery captureRepo = D2Remote
        .organisationUnitModule.organisationUnit
        .where(attribute: 'level', value: level);
    if (!parentUid.isNullOrEmpty) {
      captureRepo = captureRepo.where(attribute: 'parent', value: parentUid);
    }
    if (ouScope == OrganisationUnitScope.SCOPE_TEI_SEARCH) {
      //All search and capture, as capture ou implies it can be searched
      hasCaptureOrgUnits = (await captureRepo.get()).isNotEmpty;
    } else {
      // TODO(NMC): Edit after implementing ouScope
      hasCaptureOrgUnits =
          (await captureRepo /*.byOrganisationUnitScope(ouScope)*/ .get())
              .isNotEmpty;
    }

    return hasCaptureOrgUnits;
  }

  /// List of Trio<uid, displayName, canCapture>
  Future<List<Trio<String, String, bool>>> getLevelOrgUnits() async {
    final List<Trio<String, String, bool>> menuOrgUnitList = [];

    OrganisationUnitQuery finalOuRepo = D2Remote
        .organisationUnitModule.organisationUnit
        .where(attribute: 'level', value: level);
    if (!parentUid.isNullOrEmpty) {
      finalOuRepo = finalOuRepo.where(attribute: 'parent', value: parentUid);
    } else if (level > 1) {
      return [];
    }

    List<OrganisationUnit> orgUnitList = await finalOuRepo.get();
    int nextLevel = level + 1;
    while (orgUnitList.isEmpty && nextLevel <= maxLevel) {
      orgUnitList = await D2Remote.organisationUnitModule.organisationUnit
          .where(attribute: 'level', value: nextLevel++)
          .get();
    }

    if (orgUnitList.isEmpty) {
      orgUnitList =
          await D2Remote.organisationUnitModule.organisationUnit.get();
    }

    final Map<String, Trio<String, String, bool>> menuOrgUnits = {};
    for (final OrganisationUnit ou in orgUnitList) {
      final List<String> uidPath = ou.path.replaceFirst('/', '').split('/');

      if (uidPath.length >= level &&
          !menuOrgUnits.containsKey(uidPath[level - 1]) &&
          (parentUid.isNullOrEmpty ||
              (level > 1 && uidPath[level - 2] == parentUid))) {
        // TODO(NMC): Edit after implementing ouScope
        final int count = await D2Remote.organisationUnitModule.organisationUnit
            .byId(uidPath[level - 1])
            /*.byOrganisationUnitScope(ouScope)*/
            .count();
        final bool canCapture = count > 0;

        menuOrgUnits.putIfAbsent(
            uidPath[level - 1],
            () => Trio<String, String, bool>(uidPath[level - 1],
                ou.displayNamePath()[level - 1], canCapture));
        if (canCapture) {
          hasCaptureOrgUnits = true;
        }
      }
    }
    menuOrgUnitList.addAll(menuOrgUnits.values);
    menuOrgUnitList.sort((ou1, ou2) => ou1.first.compareTo(ou2.first));
    return menuOrgUnitList;
  }
}
