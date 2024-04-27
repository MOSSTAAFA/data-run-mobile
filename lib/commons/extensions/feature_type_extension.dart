import 'package:d2_remote/core/common/feature_type.dart';

import '../../commons/extensions/dynamic_extensions.dart';

extension FeatureTypeExtension on String? {
  FeatureType? get toFeatureType {
    try {
      return FeatureType.values.byName(this ?? '');
      // return FeatureType.values.firstWhere((status) => status.name == this,
      //     orElse: throw ArgumentError(
      //         'The FeatureType $this does not match any FeatureType type'));
    } catch (e) {
      logInfo(info: 'The FeatureType $this does not match any Enum Value');
      return null;
    }
  }
}
