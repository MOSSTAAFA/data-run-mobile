import 'package:mass_pro/sdk/core/mp/repositories/read_only_object_repository.dart';
import 'package:d2_remote/shared/entities/base.entity.dart';

abstract class ReadWriteObjectRepository<M extends BaseEntity>
    extends ReadOnlyObjectRepository<M> {
  // throws D2Error
  Future delete();

  Future deleteIfExist();
}
