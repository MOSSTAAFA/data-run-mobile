import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';

import 'business_logic/ou_tree_node.model.dart';

class OuTreeNode extends StatelessWidget {
  const OuTreeNode(
      {super.key,
      required this.node,
      required this.checkCallback,
      required this.preselected,
      required this.onOrgUnitClick});

  final bool preselected;
  final OuTreeNodeModel node;
  final Function(OrganisationUnit, bool) checkCallback;
  final Function(OrganisationUnit) onOrgUnitClick;

  @override
  Widget build(BuildContext context) {
    bool customTileExpandable = false;
    Icon? secondaryIcon;
    if (!node.hasChild) {
      secondaryIcon = const Icon(Icons.add_circle_outline);
    } else if (node.isOpen) {
      secondaryIcon = const Icon(Icons.arrow_drop_down);
      customTileExpandable = true;
    }

    final ListTile singleTile = ListTile(
      leading: const Icon(Icons.arrow_drop_down),
      title: Text(node.content.code ?? ''),
      subtitle: Text(node.content.displayName ?? ''),
      onTap: () => onOrgUnitClick(node.content),
      trailing: Checkbox(
        value: preselected,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onChanged: (value) => checkCallback(node.content, value ?? false),
        activeColor: Theme.of(context).colorScheme.secondary,
      ),
    );
    // return
    // final ExpansionTile expansionTile = ExpansionTile(
    //   title: Text(node.content.code ?? ''),
    //   subtitle: Text(node.content.displayName ?? ''),
    //   trailing: customTileExpandable
    //       ? const Icon(Icons.add_circle_outline)
    //       : const Icon(Icons.arrow_drop_down),
    //   children: const <Widget>[
    //     ListTile(title: Text('This is tile number 2')),
    //   ],
    //   onExpansionChanged: (bool expanded) {},
    // );
    return singleTile;
  }
}
