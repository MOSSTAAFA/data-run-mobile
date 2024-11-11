import 'package:datarun/commons/constants.dart';
import 'package:datarun/commons/exceptions/d_exception_reporter.dart';
import 'package:datarun/data_run/usecases/auth/auth_service.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

part 'login_reactive_form_model.g.dart';

@riverpod
LoginReactiveFormModel loginReactiveFormModel(LoginReactiveFormModelRef ref) {
  return LoginReactiveFormModel(ref.watch(authServiceProvider));
}

class LoginReactiveFormModel {
  static String URL_PATTERN =
      r'^(http|https):\/\/[a-z0-9]+([-.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$';

  LoginReactiveFormModel(this._authService)
      : this.form = FormGroup({
          'username': FormControl<String>(validators: [Validators.required]),
          'password': FormControl<String>(validators: [Validators.required]),
          'serverUrl': FormControl<String>(
              validators: [Validators.pattern(URL_PATTERN)], disabled: true),
        }),
        this.buttonController = RoundedLoadingButtonController();

  final AuthService _authService;
  final RoundedLoadingButtonController buttonController;

  final FormGroup form;

  FormControl<String> get usernameControl =>
      form.control('username') as FormControl<String>;

  FormControl<String> get passwordControl =>
      form.control('password') as FormControl<String>;

  FormControl<String> get serverUrlControl =>
      form.control('serverUrl') as FormControl<String>;

  Future<bool> login() async {
    buttonController.start();

    try {
      final result = await _authService.login(usernameControl.value!,
          passwordControl.value!, serverUrlControl.value ?? kApiBaseUrl);
      buttonController.reset();
      // if (!result) {
      //   _errorMessage = 'Login failed. Please check your credentials.';
      // }
      return result;
    } catch (e) {
      buttonController.reset();
      DExceptionReporter().report(e, showToUser: true);
      return false;
    }
  }

// Future<bool> checkExistingSession() async {
//   _isLoading = true;
//   notifyListeners();
//
//   final result = await _authService.checkExistingSession();
//
//   _isLoading = false;
//   notifyListeners();
//
//   return result;
// }
}
