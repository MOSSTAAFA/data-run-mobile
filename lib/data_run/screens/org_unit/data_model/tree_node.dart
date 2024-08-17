import 'package:d2_remote/shared/entities/identifiable_tree_node.entity.dart';
import 'package:equatable/equatable.dart';

class TreeNode<T extends IdentifiableTreeNode> with EquatableMixin {
  TreeNode({
    required this.data,
    List<TreeNode<T>>? children,
    this.path,
    this.parent,
    this.selectable = false})
      : this.children = children ?? [];

  final T data;
  final String? path;
  final String? parent;
  final bool selectable;
  final List<TreeNode<T>> children;

  @override
  List<Object?> get props => [data.uid, path, parent, selectable];
}
