import 'package:mass_pro/data_run/errors_management/errors/d_exception.dart';

class FormDoesNotExistException extends DException {
  FormDoesNotExistException(
      [super.message = 'FormDoesNotExistException', super.source]);
}