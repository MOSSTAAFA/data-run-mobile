import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

extension ValueTypeRenderingExtnsion on String? {
  ValueTypeRenderingType? get toValueTypeRenderingType {
    try {
      return ValueTypeRenderingType.values.byName(this ?? '');
    } catch (e) {
      logDebug(info: 'The ValueTypeRenderingType $this does not match any Enum Value');
      return null;
    }
  }
}
