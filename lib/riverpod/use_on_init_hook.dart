import 'package:flutter/material.dart';

void useOnInit(Function() action) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => action(),
  );
}

/// Program Entity
// class Program {
//   Program(
//       {required this.id,
//       this.code,
//       required this.name,
//       this.displayName,
//       this.selectedOrgUnit});

//   /// id of this program
//   String id;

//   /// unique code
//   String? code;

//   /// name of this program
//   String name;

//   String? displayName;

//   /// a DateTime String representation that can gets parsed for the UI during entry
//   String? eventDate;

//   /// store the OrgUnit that is selected for this program
//   OrgUnit? selectedOrgUnit;
// }

/// OrgUnit Entity
class OrgUnit {
  OrgUnit(
      {required this.id,
      this.code,
      required this.name,
      this.displayName,
      this.level,
      this.path = '',
      this.externalAccess,
      this.openingDate,
      this.geometry,
      this.parent,
      this.ancestors,
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
  List<String>? ancestors;

  String? closedDate;

  /// The programs List will contain only the Ids of the programs that can Select this orgUnit
  List<String>? programs;
}

/// Each Variable we may need is document in the comment above it.
/// First, generate sample data of 5 programs and 30 OrgUnit to test the screens.
/// Initially all programs have their selectedOrgUnit null.
/// take into consideration the program-orgUnit relation as documented in the code, some orgUnit's can be selected from some programs and some can't.
///  and also take the tree like OrgUnits  the tree parent-children as we described and some of the Generated OrgUnit will points to some programs and some ar
/// Program and OrgUnit Entitis data are comming from Api ready, don't care about that.
/// What I need you to do is create a Screen for Program Entity Used to enter:
/// - it has fields that can be used to change the Program info according to it's data.
/// - selectedOrgUnit variable's field is an Input field when clicked it opens a dailog named 'OuSelectorDialog' designed as the following:
/// a- It only populate the OrgUnits that
///
///
// The parent variable will store the id of the parent OrgUnit.
// The ancestors List:
// The level property will store the level of the orgUnit in the tree, root OrgUnit's level is 0.
// The programs List will contain only the Ids of the programs that can Select this orgUnit.
// The path string variable will store the path of this orgUnit using the ids starting from root orgUnit to this OrgUnit so if this OrgUnit is in the 3rd Level its path will be the string 'id1/id2/id3' where id1 is the id of the root orgUnit and id3 is the id of the this OrgUnit.

// Custom animation function
