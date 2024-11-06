import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:datarun/data_run/screens/home_screen/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository_impl.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepositoryImpl();
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<DUser?> user() async {
    return D2Remote.userModule.user.getOne();
  }

  @override
  Future<bool> logOut() async {
    return D2Remote.logOut();
  }

  @override
  Future<int> accountsCount() {
    return Future.value(0);
  }
}
