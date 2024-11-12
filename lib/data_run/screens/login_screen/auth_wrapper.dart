import 'package:datarun/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:datarun/data_run/screens/login_screen/login_page.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  final bool isAuthenticated;

  const AuthWrapper({Key? key, required this.isAuthenticated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAuthenticated ? HomeScreen() : LoginPage();
  }
}
