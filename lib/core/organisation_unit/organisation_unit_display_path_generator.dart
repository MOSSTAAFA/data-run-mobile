import 'dart:convert';

import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

class OrganisationUnitDisplayPathGenerator {
  OrganisationUnitDisplayPathGenerator._();

  static List<String> generateDisplayPath(OrganisationUnit organisationUnit) {
    final List<dynamic> dataList =
        jsonDecode(jsonDecode(organisationUnit.ancestors!));

    final List<OrganisationUnit> ancestors =
        dataList.map((orgUnit) => OrganisationUnit.fromJson(orgUnit)).toList();

    // if (ancestors == null) {
    //   return [];
    // } else {
    final List<String> list = [];
    for (final OrganisationUnit ancestor in ancestors) {
      list.add(ancestor.displayName!);
    }
    list.add(organisationUnit.displayName!);
    return list;
    // }
  }
}

extension OrganisationUnitPath on OrganisationUnit {
  List<String> displayNamePath() {
    return OrganisationUnitDisplayPathGenerator.generateDisplayPath(this);
  }
}
