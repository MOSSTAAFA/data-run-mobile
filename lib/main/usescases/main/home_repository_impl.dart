import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/user.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_repository.dart';

part 'home_repository_impl.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepositoryImpl();
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<User?> user() async {
    return D2Remote.userModule.user.getOne();
  }

  // Future<CategoryCombo> defaultCatCombo(){}
  // Future<CategoryOptionCombo> defaultCatOptCombo(){}
  @override
  Future<bool> logOut() async {
    return D2Remote.logOut();
  }

  @override
  Future<bool> hasProgramWithAssignment() {
    return Future.value(false);
  }

  @override
  Future<bool> hasHomeAnalytics() {
    return Future.value(false);
  }

  // Future<SystemInfo> getServerVersion(){}
  @override
  Future<int> accountsCount() {
    return Future.value(0);
  }
}
