import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ou_tree_node.model.freezed.dart';

/// TreeNode Model
/// data class
@freezed
abstract class OuTreeNodeModel with _$OuTreeNodeModel {
  const factory OuTreeNodeModel(
      {required OrganisationUnit content,
      @Default(false) bool isOpen,
      @Default(false) bool hasChild,
      @Default(false) bool isChecked,
      @Default(0) int level,
      @Default(0) int selectedChildrenCount}) = _OuTreeNodeModel;

  const OuTreeNodeModel._();

  String? displayName() {
    return content.displayName;
  }

// @override
// bool operator ==(dynamic other) {
//   return identical(this, other) ||
//       (other.runtimeType == runtimeType &&
//           other is OuSelectorNode &&
//           (identical(other.content, content) || other.content.id == content.id) &&
//           (identical(other.isChecked, isChecked) ||
//               other.isChecked == isChecked));
// }
//
// @override
// int get hashCode => Object.hash(runtimeType, content.id, isChecked);

}
