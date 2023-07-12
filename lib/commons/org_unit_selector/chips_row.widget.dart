import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit_level.entity.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/scrollable_listview.dart';

class ChipsRow extends StatelessWidget {
  const ChipsRow(
      {super.key, required this.orgUnits, required this.clickedItem});

  final List<OrganisationUnit> orgUnits;
  final void Function(OrganisationUnit) clickedItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScrollableListViewBuilder(
            scrollDirection: Axis.horizontal,
            itemCount: orgUnits.length,
            itemBuilder: (BuildContext context, int index) {
              return ChipItem(
                  orgUnit: orgUnits[index],
                  onPressed: () => clickedItem.call(orgUnits[index]));
            },
          ),
        ),
      ],
    );
    // return SizedBox(
    //   // width: MediaQuery.of(context).size.width - 2,
    //   child: Row(
    //       // spacing: 5.0,
    //       children: orgUnits
    //           .map((OrganisationUnit ou) =>
    //               ChipItem(orgUnit: ou, onPressed: () => clickedItem.call(ou)))
    //           .toList()),
    // );
  }
}

class ChipItem extends StatelessWidget {
  const ChipItem({super.key, required this.orgUnit, required this.onPressed});

  final OrganisationUnit orgUnit;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OrganisationUnitLevel?>(
      future: D2Remote.organisationUnitModule.organisationUnitLevel
          .where(attribute: 'level', value: orgUnit.level)
          .getOne(),
      builder: (BuildContext context,
          AsyncSnapshot<OrganisationUnitLevel?> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        late final String level;
        if (snapshot.hasData) {
          level = '${snapshot.data!.displayName} : ';
        } else {
          level = 'Lvl. ${orgUnit.level} : ';
        }
        return ActionChip(
          label: Text('$level${orgUnit.displayName}'),
          onPressed: onPressed,
        );
      },
    );
  }
}
