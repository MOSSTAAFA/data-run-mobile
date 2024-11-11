import 'package:flutter/material.dart';
import 'package:datarun/data_run/usecases/login/login_page.dart';
import 'package:datarun/data_run/screens/home_screen/home_screen.widget.dart';

class AuthWrapper extends StatelessWidget {
  final bool isAuthenticated;

  const AuthWrapper({Key? key, required this.isAuthenticated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAuthenticated ? HomeScreen() : LoginPage();
  }
}
