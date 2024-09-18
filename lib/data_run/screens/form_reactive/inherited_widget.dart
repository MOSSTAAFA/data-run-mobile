import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_instance.dart';
import 'package:mass_pro/data_run/screens/form_reactive/repeat_section.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/section.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class SectionElementWidget extends StatefulHookConsumerWidget {
  const SectionElementWidget({super.key, required this.element});

  final SectionElement<dynamic> element;

  @override
  SectionElementWidgetState createState() => SectionElementWidgetState();
}

class SectionElementWidgetState extends ConsumerState<SectionElementWidget> {
  late final SectionElement<dynamic> element;
  late final Map<String, List<FormOption>> formOptionsMap;

  @override
  void initState() {
    element = widget.element;
    formOptionsMap = ref.read(formInstanceProvider).requireValue.formOptionsMap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final elementConfig = useState(element.properties);
    final expanded = useState(element.expanded);

    if (elementConfig.value.hidden) {
      return SizedBox.shrink();
    }

    return SectionInheritedWidget(
      section: element,
      child: ImprovedExpansionTile(
        title: '${element.properties.label}',
        enabled: element.elementControl.enabled,
        isExpanded: expanded.value,
        // onExpansionChanged: (bool value) {
        //   expanded.value = !expanded.value;
        // },
        child: switch (element) {
          SectionInstance() => SectionWidget(
              // key: ValueKey('${element.elementPath}_section'),
              element: element as SectionInstance),
          RepeatSectionInstance() => RepeatSectionWidget(
              // key: ValueKey('${element.elementPath}_repeatSection'),
              element: element as RepeatSectionInstance,
              formOptionsMap: formOptionsMap,
              onRemove: (index) => (element as RepeatSectionInstance)
                  .removeRepeatSectionItemAtIndex(index),
            ),
        },
      ),
    );
  }
}

class FormInheritedWidget extends InheritedWidget {
  const FormInheritedWidget({
    super.key,
    required this.formInstance,
    required super.child,
  });

  final FormInstance formInstance;

  static FormInstance of(BuildContext context) {
    final FormInheritedWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<FormInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No FormElementInheritedWidget found in context.';
    }
    return inheritedWidget.formInstance;
  }

  @override
  bool updateShouldNotify(covariant FormInheritedWidget oldWidget) {
    return formInstance != oldWidget.formInstance;
  }
}

class SectionInheritedWidget extends InheritedWidget {
  const SectionInheritedWidget({
    Key? key,
    required this.section,
    required this.child,
  }) : super(key: key, child: child);
  final SectionElement<dynamic> section;
  final Widget child;

  static SectionElement<dynamic> of(BuildContext context) {
    final SectionInheritedWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<SectionInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No FormElementInheritedWidget found in context.';
    }
    return inheritedWidget.section;
  }

  @override
  bool updateShouldNotify(covariant SectionInheritedWidget oldWidget) {
    return section != oldWidget.section;
  }
}
