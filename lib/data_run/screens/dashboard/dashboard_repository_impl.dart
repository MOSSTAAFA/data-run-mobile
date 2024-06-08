import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_repository_impl.g.dart';

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepositoryImpl();
}

class DashboardRepositoryImpl implements DashboardRepository {
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
