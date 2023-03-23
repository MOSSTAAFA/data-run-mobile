import 'package:mass_pro/form/data/form_repository.dart';
import 'package:mass_pro/form/ui/form_view_model.dart';
import 'package:mass_pro/form/ui/view_model/view_model.dart';
import 'package:mass_pro/form/ui/view_model/view_model_provider.dart';

class FormViewModelFactory implements ViewModelFactory<FormViewModel> {
  final FormRepository _repository;

  const FormViewModelFactory(this._repository);

  @override
  FormViewModel create() {
    return FormViewModel(_repository /*,dispatcher*/);
  }

  @override
  Type get type => FormViewModel;
}
