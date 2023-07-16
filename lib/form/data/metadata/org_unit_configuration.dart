import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

class OrgUnitConfiguration {
  const OrgUnitConfiguration();

  Future<OrganisationUnit?> orgUnitByUid(String uid) async {
    return D2Remote.organisationUnitModule.organisationUnit.byId(uid).getOne();
  }
}
