import 'package:mass_pro/data_run/errors_management/errors/d_exception.dart';
import 'package:mass_pro/data_run/screens/form_module/element_form_control/form_element_control_abstract.dart';

class FormElementControlException
    extends DException<FormElementControl<dynamic>> {
  FormElementControlException(
      [super.message = 'FormElementException: element error.', super.source]);
}

class FormElementControlNotFoundException extends FormElementControlException {
  FormElementControlNotFoundException(FormElementControl<dynamic>? source)
      : super(
            'FormElementControlNotFoundException: ${(source?.path) ?? ''} not found.',
            source);
}
