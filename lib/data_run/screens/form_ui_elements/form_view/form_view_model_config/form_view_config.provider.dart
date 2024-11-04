import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/form_view/form_view_model/form_content_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/form_view/form_view_model_config/configure_form_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_view_config.provider.g.dart';

@riverpod
FormViewContentModel formViewContentModel(FormViewContentModelRef ref,
    {required FormMetadata formMetadata}) {
  final formInstance =
      ref.watch(formInstanceProvider(formMetadata: formMetadata)).requireValue;

  final configurator = const ConfigureFormViewModel();

  return configurator(formInstance.formSection);
}
