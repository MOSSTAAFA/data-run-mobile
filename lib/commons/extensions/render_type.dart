import 'package:d2_remote/core/program/section_rendering_type.dart';

import '../../commons/extensions/dynamic_extensions.dart';

extension RenderTypeExtension on String? {
  SectionRenderingType? get toFeatureType {
    try {
      return SectionRenderingType.values.byName(this ?? '');
      // return SectionRenderingType.values.firstWhere(
      //     (status) => status.name == this,
      //     orElse: throw ArgumentError(
      //         'The RenderingType $this does not match any SectionRenderingType type'));
    } catch (e) {
      logInfo(info: 'The SectionRenderingType $this does not match any Enum Value');
      return null;
    }
  }
}
