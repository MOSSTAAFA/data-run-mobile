import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/repeat_section.widget.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/section.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/section_inherited.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';

class SectionElementWidget extends StatefulHookConsumerWidget {
  const SectionElementWidget({super.key, required this.element});

  final SectionElement<dynamic> element;

  @override
  SectionElementWidgetState createState() => SectionElementWidgetState();
}

class SectionElementWidgetState extends ConsumerState<SectionElementWidget> {
  late final SectionElement<dynamic> element;

  @override
  void initState() {
    element = widget.element;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hidden = useState(element.hidden);
    final expanded = useState(element.expanded);
    final formOptionsMap = ref
        .watch(
            formInstanceProvider(formMetaData: FormMetadataWidget.of(context)))
        .requireValue
        .formOptionsMap;

    if (hidden.value) {
      return SizedBox.shrink();
    }

    return SectionInheritedWidget(
      key: ObjectKey(element),
      section: element,
      child: switch (element) {
        final SectionInstance element => ImprovedExpansionTile(
            leading: Icon(Icons.playlist_add_check_rounded),
            title: '${element.properties.label}',
            enabled: element.elementControl.enabled == true,
            initiallyExpanded: expanded.value,
            child: SectionWidget(
              element: element,
            )),
        final RepeatInstance element => ImprovedExpansionTile(
            leading: Icon(Icons.repeat),
            title: '${element.properties.label}',
            enabled: element.elementControl.enabled == true,
            initiallyExpanded: expanded.value,
            child: RepeatSectionWidget(
              // key: ObjectKey(element.value?.lock),
              element: element,
              formOptionsMap: formOptionsMap,
              onRemove: (index) {
                element.removeAt(index);
              },
            ),
          ),
      },
    );
  }
}
