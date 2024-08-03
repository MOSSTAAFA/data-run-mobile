// Flutter imports:
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/shared/entities/identifiable.entity.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:mass_pro/utils/mass_utils/utils.dart';

import 'package:mass_pro/commons/utils/entity_base_fields.dart';

class EntityPresenter {
  EntityPresenter initialize(IdentifiableEntity? entity, BuildContext context) {
    this.entity = entity;
    this.context = context;

    return this;
  }

  IdentifiableEntity? entity;
  late BuildContext context;

  String? title({bool isNarrow = false}) {
    String? name = entity?.displayName;

    // TODOreplace with this: https://github.com/flutter/flutter/issues/45336
    if ((name ?? '').isEmpty) {
      name = L('pending');
    } //else if (name.length > 10) {
    return name;
    //}

    // if ([
    //   EntityType.client,
    //   EntityType.vendor,
    //   EntityType.project,
    //   EntityType.user,
    //   EntityType.product,
    // ].contains(entity.entityType) ||
    //     isNarrow) {
    //   return name;
    // } else {
    //   return '$type $name';
    // }
  }

  static List<String> getBaseFields() {
    return <String>[
      EntityBaseFields.created.name,
      EntityBaseFields.last_updated.name,
      EntityBaseFields.uid.name,
    ];
  }

  Widget getField({required String field, required BuildContext context}) {
    return when(field, <String, Text Function()>{
      EntityBaseFields.status.name: () =>
          Text(entity?.dirty ?? false ? L('not_synced') : L('synced')),
      EntityBaseFields.created.name: () => Text(L('created')),
      EntityBaseFields.last_updated.name: () => Text(L('last_updated')),
      EntityBaseFields.uid.name: () => Text(L('uid')),
    }).orElse(() => Text('Error: $field not found'));
  }

  String presentCustomField(BuildContext context, String value) {
    if (<String>['yes', 'no'].contains(value)) {
      return L(value);
    } else if (RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
      return formatDate(value, context);
    }
    return value;
  }
}

class TableTooltip extends StatelessWidget {
  const TableTooltip({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
