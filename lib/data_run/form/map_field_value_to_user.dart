import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class MapFieldValueToUser {
  MapFieldValueToUser(this.resources);

  final ResourceManager resources;

// final DataValueRepository repository;
  String? map(FormFieldModel field) {
    final String? value = when<dynamic, String?>(field.valueType, {
      [ValueType.Boolean, ValueType.TrueOnly, ValueType.YesNo]: () {
        if (!field.value.isNullOrEmpty) {
          if (field.value.toBoolean()) {
            return resources.getString('Yes');
          }
          return resources.getString('No');
        }
        return null;
      },
      // ValueType.Age: () {},
      // [
      //   ValueType.Image,
      //   ValueType.FileResource,
      //   ValueType.TrackerAssociate,
      //   ValueType.Reference,
      //   ValueType.Username,
      //   ValueType.OrganisationUnit
      // ]: () {}
    });

    return value;
  }
}
