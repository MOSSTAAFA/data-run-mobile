/// a tree node path
abstract class AbstractTreeNode {
  /// path to the node in the tree,
  /// dot delimited nodes names to this node [name]
  String? get path;

  /// unique within the same TreeNodeGroup this node is in
  String? get name;

  List<AbstractTreeNode> get children;
}

abstract class DependencyAwareNode implements AbstractTreeNode {
  List<String> get dependencies; // Names of dependent nodes.
  bool evaluateDependencies(
      Map<String, dynamic> context); // Resolve dependency state.
}
