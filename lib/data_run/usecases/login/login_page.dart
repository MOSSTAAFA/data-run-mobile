import 'package:datarun/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:datarun/data_run/usecases/login/domain/login_reactive_form_model.dart';
import 'package:datarun/data_run/usecases/login/login_header.dart';
import 'package:datarun/data_run/usecases/login/login_submit_button.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loginState = ref.watch(loginStateProvider);
    // final loginNotifier = ref.read(loginStateProvider.notifier);

    final loginFormModel = ref.watch(loginReactiveFormModelProvider);

    // Create the form controls using reactive_forms

    final RoundedLoadingButtonController submitButtonController =
        useMemoized(() => loginFormModel.buttonController);
    return ReactiveForm(
      formGroup: loginFormModel.form,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LoginHeader(),
                  SizedBox(height: 16),
                  Text(S.of(context).login,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox(
                    height: 16,
                  ),
                  // Server URL input
                  ReactiveTextField<String>(
                    formControl: loginFormModel.serverUrlControl,
                    decoration: InputDecoration(labelText: 'Server URL'),
                  ),
                  // Username input
                  ReactiveTextField<String>(
                    formControl: loginFormModel.usernameControl,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  // Password input
                  ReactiveTextField<String>(
                    formControl: loginFormModel.passwordControl,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(height: 20),
                  // Login Button
                  LoginSubmitButton(
                    controller: submitButtonController,
                    onPressed: () async {
                      submitButtonController.start();
                      final success = await loginFormModel.login();

                      if (success) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      } else {
                        submitButtonController.reset();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
