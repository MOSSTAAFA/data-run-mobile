import 'package:d2_remote/d2_remote.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/data_model.provider.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/tree_node_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ou_picker_data_source.provider.g.dart';

@riverpod
Future<TreeNodeDataSource> ouPickerDataSource(OuPickerDataSourceRef ref) async {
  final formMetadata = ref.watch(formMetadataProvider);
  final template = await D2Remote.formModule.formTemplateV
      .byVersion(formMetadata.version)
      .byFormTemplate(formMetadata.form)
      .getOne();
  final dataSourceValue = await ref.watch(treeNodeDataSourceProvider(
          selectableUids: (template?.orgUnits ?? []).lock)
      .future);

  return dataSourceValue;
}
