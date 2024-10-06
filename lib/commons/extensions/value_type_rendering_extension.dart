import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';
import 'package:mass_pro/commons/logging/logging.dart';

extension ValueTypeRenderingExtnsion on String? {
  ValueTypeRenderingType? get toValueTypeRenderingType {
    try {
      return ValueTypeRenderingType.values.byName(this ?? '');
      // return ValueTypeRenderingType.values.firstWhere(
      //     (valueTypeRenderingType) => valueTypeRenderingType.name == this,
      //     orElse: throw ArgumentError(
      //         'The ValueTypeRenderingType $this does not match any Value type'));
    } catch (e) {
      logDebug(info: 'The ValueTypeRenderingType $this does not match any Enum Value');
      return null;
    }
  }
}
