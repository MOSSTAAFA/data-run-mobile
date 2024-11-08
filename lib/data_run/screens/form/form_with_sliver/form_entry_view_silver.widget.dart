import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormInstanceEntryViewSliver extends HookConsumerWidget {
  const FormInstanceEntryViewSliver({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;

    return ReactiveForm(
      formGroup: formInstance.form,
      child: CustomScrollView(
        controller: scrollController,
        slivers: formInstance.elements.values.map((element) {
          return SliverStickyHeader(
            header: Container(
              height: 40.0,
              color: element.elementControl!.hasErrors
                  ? Colors.deepOrange
                  : Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: Text(
                element.label,
                style: TextStyle(
                    color: Colors.white),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => FormElementWidgetFactory.createWidget(element),
                childCount: 1,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
