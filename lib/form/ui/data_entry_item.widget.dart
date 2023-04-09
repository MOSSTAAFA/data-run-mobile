import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/form/ui/form_view_model.dart';
import '../../commons/custom_widgets/fields/factory/field_widget_factory_impl.dart';
import '../model/field_ui_model.dart';
import 'event/list_view_ui_events.dart';
import 'intent/form_intent.dart';

final AutoDisposeProvider<FieldWidgetFactoryImpl> fieldWidgetFactoryProvider =
    Provider.autoDispose<FieldWidgetFactoryImpl>(
        (_) => FieldWidgetFactoryImpl());

class DataEntryItem extends ConsumerWidget {
  const DataEntryItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<FieldUiModel> item = ref.watch(itemProvider(Callback(
        intent: (intent) => _intentCallback(intent, ref),
        listViewUiEvents: (uiEvent) => _listViewEventCallback(uiEvent, ref))));

    return item.when(
      data: (FieldUiModel data) => ProviderScope(
        overrides: [fieldRowProvider.overrideWith((_) => data)],
        child: ref.read(fieldWidgetFactoryProvider).createWidgetByType(
            valueType: data.valueType,
            renderingType: null,
            optionSet: data.optionSet,
            sectionRenderingType: null),
      ),
      error: (error, stack) => Text('error loading field $error'),
      loading: () => Text('loading fieldModel..'),
    );
  }

  void _listViewEventCallback(ListViewUiEvents uiEvent, WidgetRef ref) =>
      ref.read(uiEventProvider.notifier).setValue(uiEvent);

  void _intentCallback(FormIntent intent, WidgetRef ref) {
    FormIntent formIntent = intent;
    if (intent is OnNext) {
      // scrollToPosition(intent.position!);
      formIntent = intent.copyWith(position: ref.read(indexProvider) + 1);
      ref.read(uiIntentProvider.notifier).setValue(formIntent);
      //   itemScrollController.scrollTo(
      //       index: intent.position!,
      //       duration: const Duration(milliseconds: 700),
      //       curve: Curves.easeInOutCubic);
      //   // itemScrollController.jumpTo(index: intent.position!);
      // }
    }
  }
}
