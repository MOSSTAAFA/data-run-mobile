import 'package:d2_remote/core/common/value_type_rendering_type.dart';

import '../../commons/extensions/dynamic_extensions.dart';

extension ValueTypeRenderingExtnsion on String? {
  ValueTypeRenderingType? get toValueTypeRenderingType {
    try {
      return ValueTypeRenderingType.values.byName(this ?? '');
      // return ValueTypeRenderingType.values.firstWhere(
      //     (valueTypeRenderingType) => valueTypeRenderingType.name == this,
      //     orElse: throw ArgumentError(
      //         'The ValueTypeRenderingType $this does not match any Value type'));
    } catch (e) {
      logInfo(info: 'The ValueTypeRenderingType $this does not match any Enum Value');
      return null;
    }
  }
}
