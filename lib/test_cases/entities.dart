List<OrgUnit> createOrgUnitTree() {
  List<OrgUnit> orgUnits = [
    OrgUnit(
        id: 'root', name: 'Root OrgUnit', path: '', ancestors: [], level: 0),
    OrgUnit(
        id: 'node1',
        name: 'Node 1',
        path: 'root',
        ancestors: ['root'],
        level: 1),
    OrgUnit(
        id: 'node2',
        name: 'Node 2',
        path: 'root',
        ancestors: ['root'],
        level: 1),
    OrgUnit(
        id: 'node3',
        name: 'Node 3',
        path: 'root',
        ancestors: ['root'],
        level: 1),
    OrgUnit(
        id: 'leaf1a',
        name: 'Leaf 1a',
        path: 'root/node1',
        ancestors: ['root', 'node1'],
        level: 2),
    OrgUnit(
        id: 'leaf1b',
        name: 'Leaf 1b',
        path: 'root/node1',
        ancestors: ['root', 'node1'],
        level: 2),
    OrgUnit(
        id: 'leaf2a',
        name: 'Leaf 2a',
        path: 'root/node2',
        ancestors: ['root', 'node2'],
        level: 2),
    OrgUnit(
        id: 'leaf2b',
        name: 'Leaf 2b',
        path: 'root/node2',
        ancestors: ['root', 'node2'],
        level: 2),
    OrgUnit(
        id: 'leaf3a',
        name: 'Leaf 3a',
        path: 'root/node3',
        ancestors: ['root', 'node3'],
        level: 2),
    OrgUnit(
        id: 'leaf3b',
        name: 'Leaf 3b',
        path: 'root/node3',
        ancestors: ['root', 'node3'],
        level: 2),
  ];
  return orgUnits;
}

/// OrgUnit Entity
class OrgUnit {
  OrgUnit(
      {required this.id,
      this.code,
      required this.name,
      this.displayName,
      this.level,
      required this.path,
      this.externalAccess,
      this.openingDate,
      this.geometry,
      this.parent,
      required this.ancestors,
      this.closedDate,
      this.programs});

  /// id of this orgUnit
  String id;

  /// unique code
  String? code;

  /// name of this orgUnit
  String name;

  String? displayName;

  /// The level property will store the level of the orgUnit in the tree, root OrgUnit's level is 0.
  int? level;

  /// The path string variable will store the path of this orgUnit using the ids starting from root orgUnit to this OrgUnit so if this OrgUnit is in the 3rd Level its path will be the string 'id1/id2/id3' where id1 is the id of the root orgUnit and id3 is the id of the this OrgUnit.it's empty when this entity is the root entity
  String path;

  bool? externalAccess;

  String? openingDate;

  Object? geometry;

  /// the id of the parent of this OrgUnit.
  String? parent;

  /// an ordered list of ancestors ids down to but not icluding this OrgUnit e.g root id will be at index 0, this list is null if this OrgUnit is the root OrgUnit.
  List<String> ancestors;

  String? closedDate;

  /// The programs List will contain only the Ids of the programs that can Select this orgUnit
  List<String>? programs;
}

/// Program Entity
class Program {
  Program(
      {required this.id,
      this.code,
      required this.name,
      this.displayName,
      this.selectedOrgUnit});

  /// id of this program
  String id;

  /// unique code
  String? code;

  /// name of this program
  String name;

  String? displayName;

  /// a DateTime String representation that can gets parsed for the UI during entry
  String? eventDate;

  /// store the OrgUnit that is selected for this program
  OrgUnit? selectedOrgUnit;
}
