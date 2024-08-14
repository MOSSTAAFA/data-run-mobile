import 'package:d2_remote/modules/metadatarun/org_unit/entities/org_unit.entity.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'org_units_notifier.g.dart';

@riverpod
class OrgUnitsNotifier extends _$OrgUnitsNotifier {
  // Object? key;

  @override
  Future<List<OrgUnit>> build(String form) async {
    final formConfig = ref.watch(formConfigurationProvider(form: form)).requireValue;

    return [];
  }

  void loadOrgUnits() {
    // Replace with actual data fetching
    // state = [
    //   OrgUnit(id: '1', name: 'OrgUnit 1', level: 1),
    //   OrgUnit(id: '2', name: 'OrgUnit 2', level: 2),
    //   // Add more OrgUnits here
    // ];
  }

  void filterOrgUnits(String? filter) {
    // if (filter == null || filter.isEmpty) {
    //   loadOrgUnits();
    // } else {
    //   state = state
    //       .where((orgUnit) => orgUnit.name.toLowerCase().contains(filter.toLowerCase()))
    //       .toList();
    // }
  }
}
