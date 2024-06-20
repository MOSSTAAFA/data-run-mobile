import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field_intent.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/syncable_form_repository.dart';

class FormInputFieldWidget extends ConsumerWidget {
  const FormInputFieldWidget({
    super.key,
    this.onIntent,
    // this.onListViewUiEvents,
    // required this.records,
  });

  // final FormRepositoryRecords records;

  final void Function(FormInputFieldIntent intent)? onIntent;

  // final void Function(ListViewUiEvents uiEvent)? onListViewUiEvents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemIndex = ref.watch(formInputFieldListIndexProvider);
    // final FormInputFieldIntent? item = ref.watch(formViewModelNotifierProvider.select(
    //     (asyncList) => asyncList.value?.isNotEmpty ?? false
    //         ? asyncList.value![itemIndex]
    //         : null));
    // debugPrint(
    //     'build(): $runtimeType, itemIndex $itemIndex, itemUid: ${item?.uid}, itemValue: ${item?.value}, '
    //     'itemLabel ${item?.label}, itemMandatory ${item?.mandatory}, '
    //     'itemError ${item?.error}, itemWarning ${item?.warning}');

    return Placeholder();

    // return FormEditText(
    //   item: item?.copyWith(intentCallback: (intent) {
    //     FormIntent formIntent = intent;
    //     if (intent is OnNext) {
    //       formIntent =
    //           intent.copyWith(position: ref.read(formInputFieldListIndexProvider));
    //     }
    //     onIntent?.call(formIntent);
    //   }, listViewUiEventsCallback: (uiEvent) {
    //     onListViewUiEvents?.call(uiEvent);
    //   }),
    // );
  }

// void _listViewEventCallback(ListViewUiEvents uiEvent, WidgetRef ref) =>
//     ref.read(uiEventProvider.notifier).setValue(uiEvent);
//
// void _intentCallback(FormIntent intent, WidgetRef ref) {
//   FormIntent formIntent = intent;
//   if (intent is OnNext) {
//     // scrollToPosition(intent.position!);
//     formIntent =
//         intent.copyWith(position: ref.read(formViewIndexProvider) + 1);
//     ref.read(uiIntentProvider.notifier).setValue(formIntent);
//     // Future(() => ref.read(uiIntentProvider.notifier).setValue(formIntent));
//
//     //   itemScrollController.scrollTo(
//     //       index: intent.position!,
//     //       duration: const Duration(milliseconds: 700),
//     //       curve: Curves.easeInOutCubic);
//     //   // itemScrollController.jumpTo(index: intent.position!);
//     // }
//   }
// }
}
