import 'package:d2_remote/core/program/section_rendering_type.dart';

extension RenderTypeExtension on String? {
  SectionRenderingType? get toFeatureType {
    try {
      return SectionRenderingType.values.firstWhere(
          (status) => status.name == this,
          orElse: throw ArgumentError(
              'The RenderingType $this does not match any SectionRenderingType type'));
    } catch (e) {
      return null;
    }
  }
}
