import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
import 'package:d2_remote/shared/models/request_progress.model.dart';
import 'package:flutter/material.dart';

import 'commons/org_unit_selector/ou_selector_dialog.widget.dart';
import 'test_cases/test_case.dart';
import 'test_set_up.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final int _counter = 0;
  RequestProgress? progress;
  LoginResponseStatus? loginStatus;
  String? selectedOrgUnit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(child: OrgUnitInput()),
    );
  }

  void showOuSelectorDialog(BuildContext context) {
    showDialog<OuSelectorDialog>(
        context: context,
        builder: (BuildContext context) {
          return Card(
            elevation: 0,
            color: Colors.white,
            child: OuSelectorDialog(
                title: 'title',
                selectedOrgUnit: null,
                textChangedConsumer:
                    (String selectedOrgUnitUid, String selectedOrgUnitName) {
                  setState(() {
                    selectedOrgUnit =
                        '$selectedOrgUnitUid: $selectedOrgUnitName';
                  });
                },
                onDialogCancelled: () {},
                onClear: () {},
                ouSelectionType: OUSelectionType.CAPTURE),
          );
        });
  }

  Future<void> setUp() async {
    await setUpTes();
  }

  Future<void> downloadOrgUnits() async {
    await D2Remote.organisationUnitModule.organisationUnit.download(
        (RequestProgress progress, bool complete) {
      print(progress.message);
      setState(() {
        this.progress = progress;
      });
    }, dioTestClient: dio);
  }

  Future<void> downloadOrgUnitLevels() async {
    await D2Remote.organisationUnitModule.organisationUnitLevel.download(
        (RequestProgress progress, bool complete) {
      print(progress.message);
      setState(() {
        this.progress = progress;
      });
    }, dioTestClient: dio);
  }

  Future<void> loginUser() async {
    final onlineLogIn = await D2Remote.logIn(
        username: 'admin',
        password: 'district',
        url: 'https://play.dhis2.org/2.35.11',
        dioTestClient: dio);

    setState(() {
      loginStatus = onlineLogIn;
    });
  }
}
