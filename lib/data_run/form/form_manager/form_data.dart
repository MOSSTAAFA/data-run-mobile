import 'package:mass_pro/data_run/screens/form/element/form_element.dart';

class FormData {
  FormData({required this.form, required this.formElementMap});

  SectionInstance form;
  Map<String, FormElementInstance<dynamic>> formElementMap;
}
