import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';

class FormElementWidget extends StatefulHookConsumerWidget {
  const FormElementWidget({super.key, required this.element});

  final FormElementInstance<dynamic> element;

  @override
  ConsumerState<FormElementWidget> createState() => _FormElementWidgetState();
}

class _FormElementWidgetState extends ConsumerState<FormElementWidget> {
  @override
  void initState() {
    super.initState();
    // widget.element.addListener();
  }

  @override
  void dispose() {
    // widget.element.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return FormElementWidgetFactory.createWidget(widget.element);
  }
}

// class FormElementWidget extends HookWidget {
//   FormElementWidget({super.key, required this.element});
//
//   final FormElementInstance<dynamic> element;
//
//   @override
//   Widget build(BuildContext context) {
//     // final elementConfig = useStream(
//     //     CombineLatestStream.combine2(
//     //       element.elementChanged, // Your custom stream for properties like visibility
//     //       element.elementControl!.statusChanged, // Control status stream
//     //           (visibilityStatus, controlStatus) => visibilityStatus?.mergeWith(controlStatus),
//     //     )
//     // );
//     // filtering
//     // Visibility control start from here
//     useRegisterDependencies(element);
//
//     return FormElementWidgetFactory.createWidget(element);
//   }
// }
