import 'package:d2_remote/shared/entities/base.entity.dart';
import 'package:d2_remote/shared/queries/base.query.dart';

extension BaseQueryExtension<T extends BaseEntity> on BaseQuery<T> {
  resetFilters() {
    id = null;
    filters?.clear();
    return this;
  }
}
