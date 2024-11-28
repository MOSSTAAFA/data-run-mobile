import 'package:d2_remote/modules/datarun/form/shared/field_template.entity.dart';

extension DepthFirstTraversal on FieldTemplate {
  Iterable<FieldTemplate> depthFirstTraversal() sync* {
    yield this; // Start with the root node
    for (final field in fields) {
      yield* field.depthFirstTraversal();
    }
  }
}
