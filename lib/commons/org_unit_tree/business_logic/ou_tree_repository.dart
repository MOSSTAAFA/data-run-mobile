import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/queries/organisation_unit.query.dart';
import 'package:d2_remote/shared/utilities/sort_order.util.dart';

class OuTreeRepository {
  Future<List<OrganisationUnit>> orgUnits({String? parentUid, String? name}) {
    OrganisationUnitQuery orgUnitRepository = D2Remote
        .organisationUnitModule.organisationUnit
        .orderBy(attribute: 'code', order: SortOrder.ASC);

    if (parentUid != null) {
      orgUnitRepository =
          orgUnitRepository.where(attribute: 'parent', value: parentUid);
    } else if (name != null) {
      orgUnitRepository =
          orgUnitRepository.where(attribute: 'name', value: name);
    }

    return orgUnitRepository.get();
    // return when {
    // orgUnitRepository
    //     .byOrganisationUnitScope(OrganisationUnit.Scope.SCOPE_TEI_SEARCH)
    //     .blockingCount() > 0 ->
    // orgUnitRepository
    //     .byOrganisationUnitScope(OrganisationUnit.Scope.SCOPE_TEI_SEARCH)
    //     .get()
    // else ->
    // orgUnitRepository
    //     .byOrganisationUnitScope(OrganisationUnit.Scope.SCOPE_DATA_CAPTURE)
    //     .get()
    // }
  }

  Future<OrganisationUnit?> orgUnit(String uid) =>
      D2Remote.organisationUnitModule.organisationUnit.byId(uid).getOne();

  Future<bool> orgUnitHasChildren(String uid) async {
    final int count = await D2Remote.organisationUnitModule.organisationUnit
            .where(attribute: 'parent', value: uid)
            .count() ??
        0;
    return count > 0;
  }

  Future<int> countSelectedChildren(
      OrganisationUnit parentOrgUnit, List<String> selectedOrgUnits) {
    return D2Remote.organisationUnitModule.organisationUnit
        .whereIn(attribute: 'id', values: selectedOrgUnits, merge: true)
        .like(attribute: 'path', value: '%${parentOrgUnit.id}%')
        // .like(attribute: 'path', value: '${parentOrgUnit.id}')
        .count();
  }
}
