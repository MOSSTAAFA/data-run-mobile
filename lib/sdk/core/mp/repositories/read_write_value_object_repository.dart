// ignore_for_file: strict_raw_type

import 'package:d2_remote/shared/entities/base.entity.dart';
import 'package:mass_pro/sdk/core/mp/repositories/read_write_object_repository.dart';

abstract class ReadWriteValueObjectRepository<M extends BaseEntity>
    extends ReadWriteObjectRepository<M> {
  // throws D2Error
  Future set(String value);
}
