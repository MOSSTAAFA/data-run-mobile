// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/auth/user/queries/d_user.query.dart';
// import 'package:flutter/material.dart';
// import 'package:mass_pro/main.reflectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences.setMockInitialValues({});
//   initializeReflectable();
//   sqfliteFfiInit();
//
//   var databaseFactory = databaseFactoryFfi;
//
//   await D2Remote.initialize(
//       databaseFactory: databaseFactoryFfi, databaseName: 'flutter_test');
//
//   var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
//
//   DUserQuery userQuery = DUserQuery(database: db);
//   userData['password'] = 'district';
//   userData['isLoggedIn'] = true;
//   userData['login'] = 'admin';
//   userData['baseUrl'] = 'http://localhost:8080';
//   final user = DUser.fromApi(userData);
//   await userQuery.setData(user).save();
//
//   final dio = Dio(BaseOptions());
//   final dioAdapter = DioAdapter(dio: dio);
//
//   dioAdapter.onGet(
//     'http://localhost:8080/api/custom/orgUnits?paging=false&eagerload=true',
//         (server) => server.reply(200, sampleOrgUnits),
//   );
//
//   OrgUnitQuery orgUnitQuery = OrgUnitQuery(database: db);
//   await orgUnitQuery.download((progress, complete) {
//     print(progress.message);
//   }, dioTestClient: dio);
//
//   List<OrgUnit> projects =
//   await D2Remote.organisationUnitModuleD.orgUnit.get();
//
//   test('should store all incoming orgUnits metadata', () {
//     expect(projects.length, 7);
//   });
// }
