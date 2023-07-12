import 'entities.dart';

void main() {
  List<OrgUnit> orgUnits = createOrgUnitTree();

  print('Generated OrgUnits:');
  print('-------------------');
  for (OrgUnit unit in orgUnits) {
    print('ID: ${unit.id}');
    print('Code: ${unit.code}');
    print('Name: ${unit.name}');
    print('Display Name: ${unit.displayName}');
    print('Level: ${unit.level}');
    print('Path: ${unit.path}');
    print('External Access: ${unit.externalAccess}');
    print('Opening Date: ${unit.openingDate}');
    print('Parent: ${unit.parent}');
    print('Ancestors: ${unit.ancestors}');
    print('Programs: ${unit.programs}');
    print('-------------------');
  }
}
