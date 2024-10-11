import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/element_section_repeat_instance.widget.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/element_section_instance.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/improved_expansion_tile.widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// [ElementSectionWidget] would be the widget of either a [ElementSectionInstance]
/// or a [ElementSectionRepeatInstance] type element, here where initializing their
/// states happen.
class ElementSectionWidget extends HookWidget {
  const ElementSectionWidget({super.key, required this.sectionElement});

  // element of typ section
  final SectionElement<dynamic> sectionElement;

  @override
  Widget build(BuildContext context) {
    /// a hook that init some data, listeners
    // final sectionElement = useRegisterDependencies(sectionElement);
    // final sectionElement = sectionElement;

    return switch (sectionElement) {
      SectionInstance() => ImprovedExpansionTile(
          leading: Icon(Icons.playlist_add_check_rounded),
          title: '${sectionElement.label}',
          enabled: sectionElement.elementControl!.enabled == true,
          initiallyExpanded: sectionElement.expanded,
          // maintainState: true,
          child: ReactiveForm(
              formGroup: (sectionElement as SectionInstance).elementControl,
              child: ElementSectionInstanceWidget(
                section: sectionElement as SectionInstance,
              ))),
      RepeatInstance() => ImprovedExpansionTile(
          leading: Icon(Icons.repeat),
          title: '${sectionElement.label}',
          enabled: sectionElement.elementControl!.enabled,
          // maintainState: true,
          initiallyExpanded: sectionElement.expanded,
          child: ReactiveFormArray(
              formArray: (sectionElement as RepeatInstance).elementControl,
              builder: (BuildContext context, FormArray<dynamic> formArray,
                  Widget? child) {
                return child!;
              },
              child: ElementSectionRepeatInstanceWidget(
                repeatSectionElement: sectionElement as RepeatInstance,
              ))),
    };

    // return FormElementConsumer(
    //   formElement: initSectionElement,
    //   builder: (BuildContext context, SectionElement<dynamic> elementState,
    //       Widget? child) {
    //     return Visibility(visible: elementState.visible, child: child!);
    //   },
    //   child: selectedSection,
    // );
  }
}
