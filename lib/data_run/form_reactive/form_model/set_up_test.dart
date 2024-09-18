import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:d2_remote/modules/auth/user/queries/d_user.query.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/form/queries/dynamic_form.query.dart';
import 'package:d2_remote/modules/datarun/form/queries/form_definition.query.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/form_reactive/form_model/sample_data.dart';
import 'package:mass_pro/main.reflectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Map<String, dynamic> userData = {
  'id': 1,
  'uid': 'laKeLjqAFIC',
  'login': 'admin',
  'firstName': 'Administrator',
  'lastName': 'Administrator',
  'email': 'admin@localhost',
  'imageUrl': '',
  'activated': true,
  'langKey': 'en',
  'createdBy': 'system',
  'createdDate': null,
  'lastModifiedBy': 'system',
  'lastModifiedDate': null,
  'authorities': ['ROLE_USER', 'ROLE_ADMIN']
};

Future<void> SetUpTest() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  initializeReflectable();
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;

  await D2Remote.initialize(
      databaseFactory: databaseFactoryFfi, databaseName: 'flutter_test');

  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);

  DUserQuery userQuery = DUserQuery(database: db);
  userData['password'] = 'district';
  userData['isLoggedIn'] = true;
  userData['login'] = 'admin';
  userData['baseUrl'] = 'http://localhost:8080';
  final user = DUser.fromApi(userData);
  await userQuery.setData(user).save();

  final formQuery = DynamicFormQuery(database: db);
  final formDefinition = FormDefinitionQuery(database: db);
  final formMap = {};
  formMap.addAll(formSampleData);
  formSampleData['formInstances'] = [formMap];
  DynamicForm form = DynamicForm.fromJson(formSampleData);

  await formQuery.setData(form);

  final savedForm =
      await D2Remote.formModule.form.withFormDefinitions().getOne();
}
