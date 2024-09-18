import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/form/form.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_instance.dart';
import 'package:mass_pro/data_run/screens/form_reactive/repeat_section.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/section.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormConfigInheritedWidget extends InheritedWidget {
  const FormConfigInheritedWidget({
    super.key,
    required this.formConfiguration,
    required super.child,
  });

  final FormConfiguration formConfiguration;

  static FormConfiguration of(BuildContext context) {
    final FormConfigInheritedWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<FormConfigInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No FormConfigurationWidget found in context.';
    }
    return inheritedWidget.formConfiguration;
  }

  @override
  bool updateShouldNotify(covariant FormConfigInheritedWidget oldWidget) {
    return formInstance != oldWidget.formConfiguration;
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
