import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

class OrgUnitDialog extends StatelessWidget {
  const OrgUnitDialog(
      {super.key,
      required this.orgUnits,
      this.onPossitiveListener,
      this.onNegativeListener});

  final List<OrganisationUnit> orgUnits;
  final Function(String? selectedOrgUnit)? onPossitiveListener;
  final VoidCallback? onNegativeListener;

  List<Node<OrganisationUnit>> _buildOrgUnitTree(
      List<OrganisationUnit> orgUnits) {
    IMap<String, Node<OrganisationUnit>> nodeMap =
        IMap<String, Node<OrganisationUnit>>();
    // Create a tree node for each orgUnit and store it in a map
    for (OrganisationUnit orgUnit in orgUnits) {
      nodeMap = nodeMap.add(
          orgUnit.id!,
          Node<OrganisationUnit>(
            key: orgUnit.id!,
            label: orgUnit.name!,
            data: orgUnit,
            children: [],
          ));
    }

    // Iterate over the orgUnits and add each node to its parent node's children list
    for (OrganisationUnit orgUnit in orgUnits) {
      if (orgUnit.path.isNotEmpty) {
        final String parentId = orgUnit.path.split('/').last;
        final Node<OrganisationUnit> parentNode = nodeMap[parentId]!;
        final Node<OrganisationUnit> currentNode = nodeMap[orgUnit.id!]!;
        parentNode.children.add(currentNode);
      }
    }
    // Find and return the root node(s)
    final List<Node<OrganisationUnit>> rootNodes = nodeMap.values
        .where((node) => node.data?.path.isEmpty ?? false)
        .toList();
    return rootNodes;
  }

  List<Node<OrganisationUnit>> _filterOrgUnits(
      List<OrganisationUnit> orgUnits, String filter) {
    final List<OrganisationUnit> filteredOrgUnits = orgUnits
        .where((orgUnit) =>
            orgUnit.code?.toLowerCase().contains(filter) == true ||
            orgUnit.name?.toLowerCase().contains(filter) == true ||
            orgUnit.displayName?.toLowerCase().contains(filter) == true)
        .toList();

    return _buildOrgUnitTree(filteredOrgUnits);
  }

  // List<Node<OrgUnit>> _filterNodes(List<Node<OrgUnit>> nodes, String filter) {
  //   List<Node<OrgUnit>> filteredOrgUnits = nodes
  //       .where((node) =>
  //           node.data?.code?.toLowerCase().contains(filter) == true ||
  //           node.data?.name.toLowerCase().contains(filter) == true ||
  //           node.data?.displayName?.toLowerCase().contains(filter) == true)
  //       .toList();

  //   return _buildOrgUnitTree(filteredOrgUnits);
  // }

  @override
  Widget build(BuildContext context) {
    final List<Node<OrganisationUnit>> orgUnitTree =
        _buildOrgUnitTree(orgUnits);
    TreeViewController _controller = TreeViewController(children: orgUnitTree);

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TreeView(
                controller: _controller,
                // nodeBuilder: (context, node) => TreeNode(node: node),
                onNodeTap: (node) {
                  final orgUnit = _controller.getNode(node)?.data.id;
                  // '$node - ${_controller.selectedNode?.data?.name}';
                  // OrgUnit? orgUnit = _controller.selectedNode?.data;
                  onPossitiveListener?.call(_controller.getNode(node)?.data.id);
                  Navigator.pop(context, orgUnit);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
