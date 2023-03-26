import '../data/form_repository.dart';
import 'form_view_model.dart';
import 'view_model/view_model_provider.dart';

class FormViewModelFactory implements ViewModelFactory<FormViewModel> {
  const FormViewModelFactory(this._repository);

  final FormRepository _repository;

  @override
  FormViewModel create() {
    return FormViewModel(_repository /*,dispatcher*/);
  }

  @override
  Type get type => FormViewModel;
}
