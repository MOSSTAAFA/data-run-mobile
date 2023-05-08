import 'dart:convert';

import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

extension OrgUnitList on List<OrganisationUnit> {
  List<OrganisationUnit> byProgramUids(String programUid) {
    return where((ou) {
      final List<dynamic> dataList = jsonDecode(ou.programs!);
      return dataList.contains(programUid);
    }).toList();
  }
}
