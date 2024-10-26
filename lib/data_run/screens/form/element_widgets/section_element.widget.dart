import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/repeat_section.widget.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/section.widget.dart';
import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SectionElementWidget extends HookConsumerWidget {
  const SectionElementWidget({super.key, required this.element});

  final SectionElement<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useRegisterDependencies(element);

    final elementPropertiesSnapshot = useStream(element.propertiesChanged);

    if (!elementPropertiesSnapshot.hasData) {
      return SizedBox.shrink();
    }


    return switch (element) {
      final SectionInstance element => Builder(builder: (context) {
          if (elementPropertiesSnapshot.data!.hidden) {
            return SizedBox.shrink();
          } else {
            return ImprovedExpansionTile(
                leading: Icon(Icons.playlist_add_check_rounded),
                title: '${element.label}',
                enabled: element.elementControl.enabled == true,
                initiallyExpanded: true,
                child: SectionWidget(
                  // key: ValueKey('${element.elementPath}_SectionWidget'),
                  element: element,
                ));
          }
        }),
      final RepeatInstance element => Builder(builder: (context) {
          if (elementPropertiesSnapshot.data!.hidden) {
            return SizedBox.shrink();
          } else {
            return ImprovedExpansionTile(
              leading: Icon(Icons.repeat),
              title: '${element.label}',
              enabled: element.elementControl.enabled == true,
              initiallyExpanded: false,
              child: RepeatSectionWidget(
                // key: ValueKey('${element.elementPath}_RepeatSectionWidget'),
                element: element,
              ),
            );
          }
        }),
    };
  }
}
