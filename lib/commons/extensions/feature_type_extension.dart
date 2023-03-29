import 'package:d2_remote/core/common/feature_type.dart';

extension FeatureTypeExtension on String? {
  FeatureType? get toFeatureType {
    try {
      return FeatureType.values.firstWhere((status) => status.name == this,
          orElse: throw ArgumentError(
              'The FeatureType $this does not match any FeatureType type'));
    } catch (e) {
      return null;
    }
  }
}
