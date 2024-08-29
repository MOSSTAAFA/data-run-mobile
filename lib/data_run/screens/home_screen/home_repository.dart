import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';

abstract class HomeRepository {
  Future<DUser?> user();

  Future<bool> logOut();

  Future<int> accountsCount();
}
