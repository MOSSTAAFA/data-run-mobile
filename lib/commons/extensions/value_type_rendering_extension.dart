import 'package:d2_remote/core/common/value_type_rendering_type.dart';

extension ValueTypeRenderingExtnsion on String? {
  ValueTypeRenderingType? get toValueTypeRenderingType {
    try {
      return ValueTypeRenderingType.values.firstWhere(
          (valueTypeRenderingType) => valueTypeRenderingType.name == this,
          orElse: throw ArgumentError(
              'The ValueTypeRenderingType $this does not match any Value type'));
    } catch (e) {
      return null;
    }
  }
}
