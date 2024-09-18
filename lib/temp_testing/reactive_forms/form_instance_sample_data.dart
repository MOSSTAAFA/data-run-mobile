// import 'package:d2_remote/modules/datarun/form_data/entities/entities.dart';
// import 'package:d2_remote/modules/datarun/form_data/queries/form_instance.query.dart';
// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form_reactive/form_model/set_up_test.dart';
// import 'package:mass_pro/main.reflectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
// import 'package:d2_remote/modules/auth/user/queries/d_user.query.dart';
// import 'package:d2_remote/modules/datarun/form/queries/dynamic_form.query.dart';
// import 'package:d2_remote/modules/datarun/form/queries/form_definition.query.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//
// final Map<String, dynamic> formInstanceSample = {
//   'status': 'ACTIVE',
//   'form': 'form',
//   'version': 1,
//   'activity': 'this.activity',
//   'team': 'this.team',
//   'orgUnit': 'this.orgUnit!',
//   'fields': [
//     {
//       'name': 'PersonalDetails',
//       'section': null,
//       'type': 'Section',
//       'value': [
//         {
//           'name': 'FirstName',
//           'section': 'PersonalDetails',
//           'type': 'Text',
//           'value': 'John'
//         },
//         {
//           'name': 'LastName',
//           'section': 'PersonalDetails',
//           'type': 'Text',
//           'value': 'Doe'
//         },
//         {
//           'name': 'Age',
//           'section': 'PersonalDetails',
//           'type': 'Integer',
//           'value': 30
//         }
//       ]
//     },
//     {
//       'name': 'EmploymentHistory',
//       'section': null,
//       'type': 'RepeatableSection',
//       'value': [
//         {
//           'name': 'Job1',
//           'section': 'EmploymentHistory',
//           'type': 'Section',
//           'value': [
//             {
//               'name': 'CompanyName',
//               'section': 'Job1',
//               'type': 'Text',
//               'value': 'Company A'
//             },
//             {
//               'name': 'JobTitle',
//               'section': 'Job1',
//               'type': 'Text',
//               'value': 'Software Engineer'
//             },
//             {
//               'name': 'YearsWorked',
//               'section': 'Job1',
//               'type': 'Integer',
//               'value': 2
//             }
//           ]
//         },
//         {
//           'name': 'Job2',
//           'section': 'EmploymentHistory',
//           'type': 'Section',
//           'value': [
//             {
//               'name': 'CompanyName',
//               'section': 'Job2',
//               'type': 'Text',
//               'value': 'Company B'
//             },
//             {
//               'name': 'JobTitle',
//               'section': 'Job2',
//               'type': 'Text',
//               'value': 'Senior Developer'
//             },
//             {
//               'name': 'YearsWorked',
//               'section': 'Job2',
//               'type': 'Integer',
//               'value': 3
//             }
//           ]
//         }
//       ]
//     }
//   ]
// };
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences.setMockInitialValues({});
//   // initializeReflectable();
//   sqfliteFfiInit();
//   var databaseFactory = databaseFactoryFfi;
//   await D2Remote.initialize(
//       databaseFactory: databaseFactoryFfi, databaseName: 'flutter_test');
//   var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
//   await SetUpTest(db);
//
//   final formInstanceQuery = FormInstanceQuery(database: db);
//
//   final formInstance = FormInstance.fromJson(formInstanceSample);
//
//   formInstanceQuery..setData(formInstance);
//   await formInstanceQuery.save();
//
//   final savedForm =
//       await D2Remote.formInstanceModule.formInstance.getOne();
//
//   print('Ready');
//   print('Ready');
// }
//
// Future<void> SetUpTest(Database db) async {
//   DUserQuery userQuery = DUserQuery(database: db);
//   userData['password'] = 'district';
//   userData['isLoggedIn'] = true;
//   userData['login'] = 'admin';
//   userData['baseUrl'] = 'http://localhost:8080';
//   final user = DUser.fromApi(userData);
//   await userQuery.setData(user).save();
//
//   final formQuery = DynamicFormQuery(database: db);
//   final formDefinition = FormDefinitionQuery(database: db);
// }
