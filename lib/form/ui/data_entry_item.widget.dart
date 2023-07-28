import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../commons/custom_widgets/fields/factory/field_widget_factory_impl.dart';
import '../../commons/custom_widgets/fields/form_edit_text.widget.dart';
import '../../commons/custom_widgets/form_card.dart';
import '../model/field_ui_model.dart';
import 'event/list_view_ui_events.dart';
import 'form_view_model.dart';
import 'intent/form_intent.dart';

final AutoDisposeProvider<FieldWidgetFactoryImpl> fieldWidgetFactoryProvider =
    Provider.autoDispose<FieldWidgetFactoryImpl>(
        (_) => FieldWidgetFactoryImpl());

class DataEntryItem extends ConsumerWidget {
  const DataEntryItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final itemr = ref.watch(fieldItemProvider(Callback(
    //     intent: (intent) => _intentCallback(intent, ref),
    //     listViewUiEvents: (uiEvent) => _listViewEventCallback(uiEvent, ref))));
    final item = ref.watch(itemsProvider.select((list) => list.isNotEmpty
        ? list[ref.watch(indexProvider)].setCallback(Callback(
            intent: (intent) => _intentCallback(intent, ref),
            listViewUiEvents: (uiEvent) =>
                _listViewEventCallback(uiEvent, ref)))
        : null));

    return ProviderScope(
        overrides: [fieldRowProvider.overrideWith((_) => item)],
        child: FormEditText());
    // : const SizedBox.shrink();
  }

  void _listViewEventCallback(ListViewUiEvents uiEvent, WidgetRef ref) =>
      ref.read(uiEventProvider.notifier).setValue(uiEvent);

  void _intentCallback(FormIntent intent, WidgetRef ref) {
    FormIntent formIntent = intent;
    if (intent is OnNext) {
      // scrollToPosition(intent.position!);
      formIntent = intent.copyWith(position: ref.read(indexProvider) + 1);
      Future(() => ref.read(uiIntentProvider.notifier).setValue(formIntent));

      //   itemScrollController.scrollTo(
      //       index: intent.position!,
      //       duration: const Duration(milliseconds: 700),
      //       curve: Curves.easeInOutCubic);
      //   // itemScrollController.jumpTo(index: intent.position!);
      // }
    }
  }

  Widget createWidgetByType(
      {Key? key,
      ValueType? valueType,
      ValueTypeRenderingType? renderingType,
      String? optionSet,
      SectionRenderingType? sectionRenderingType}) {
    switch (valueType) {
      case ValueType.AGE:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_age_custom
      case ValueType.DATE:
      case ValueType.TIME:
      case ValueType.DATETIME:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_date_time
      case ValueType.LONG_TEXT:
        return const FormEditText(); //R.layout.form_long_text_custom
      case ValueType.ORGANISATION_UNIT:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_org_unit
      case ValueType.COORDINATE:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_coordinate_custom
      case ValueType.IMAGE:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_picture
      case ValueType.TEXT:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_edit_text_custom
            );
      case ValueType.TRUE_ONLY:
      case ValueType.BOOLEAN:
        switch (renderingType) {
          case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
          case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
          case ValueTypeRenderingType.DEFAULT:
            return Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); //R.layout.form_radio_button
          case ValueTypeRenderingType.TOGGLE:
            switch (valueType) {
              case ValueType.TRUE_ONLY:
                return Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                ); //R.layout.form_toggle
              default:
                return Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                ); //R.layout.form_radio_button
            }
          case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
          case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
            return Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); //R.layout.form_check_button
          default:
            return Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); //R.layout.form_radio_button
        }
      case ValueType.LETTER:
        return const FormEditText(); //R.layout.form_letter
      case ValueType.PHONE_NUMBER:
        return const FormEditText(); //R.layout.form_phone_number
      case ValueType.EMAIL:
        return const FormEditText(); //R.layout.form_email
      case ValueType.NUMBER:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_number
            );
      case ValueType.UNIT_INTERVAL:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_unit_interval
            );
      case ValueType.PERCENTAGE:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_percentage
            );
      case ValueType.INTEGER:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_integer
            );
      case ValueType.INTEGER_POSITIVE:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_integer_positive
            );
      case ValueType.INTEGER_NEGATIVE:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_integer_negative
            );
      case ValueType.INTEGER_ZERO_OR_POSITIVE:
        return getLayoutForOptionSet(
            optionSet,
            sectionRenderingType,
            renderingType,
            const FormEditText() //R.layout.form_integer_zero_positive
            );
      case ValueType.URL:
        return const FormEditText(); //R.layout.form_url
      case ValueType.REFERENCE:
      case ValueType.GEOJSON:
      case ValueType.FILE_RESOURCE:
      case ValueType.USERNAME:
      case ValueType.TRACKER_ASSOCIATE:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_unsupported
      default:
        return const FormEditText(); //R.layout.form_edit_text_custom
    }
  }

  Widget createWidgetForSection() {
    return const FormCard(
      // isLast: true,
      children: <Widget>[],
    ); //R.layout.form_section;
  }

  Widget getLayoutForOptionSet(
      String? optionSet,
      SectionRenderingType? sectionRenderingType,
      ValueTypeRenderingType? renderingType,
      /*@LayoutRes*/ Widget defaultLayout) {
    if (shouldRenderAsMatrixImage(
        optionSet, sectionRenderingType, renderingType)) {
      return const Text(
        'form_option_set_matrix',
        style: TextStyle(fontSize: 20),
      ); //R.layout.form_option_set_matrix
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_option_set_selector
    } else if (shouldRenderAsSpinner(optionSet)) {
      return const Text(
        'form_option_set_spinner',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_option_set_spinner
    } else if (shouldRenderAsScan(renderingType)) {
      return const Text(
        'form_scan',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_scan
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_option_set_selector
    } else {
      return defaultLayout;
    }
  }

  bool shouldRenderAsScan(ValueTypeRenderingType? renderingType) {
    switch (renderingType) {
      case ValueTypeRenderingType.QR_CODE:
      case ValueTypeRenderingType.BAR_CODE:
        return true;
      default:
        return false;
    }
  }

  bool shouldRenderAsSpinner(String? optionSet) {
    return optionSet != null;
  }

  bool shouldRenderAsSelector(
      String? optionSet, ValueTypeRenderingType? renderingType) {
    bool isOptionSet = optionSet != null;
    bool isSelectorRendering = false;
    switch (renderingType) {
      case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
      case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
      case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
      case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
        isSelectorRendering = true;
        break;
      default:
        isSelectorRendering = false;
    }
    return isOptionSet && isSelectorRendering;
  }

  bool shouldRenderAsMatrixImage(
      String? optionSet,
      SectionRenderingType? sectionRenderingType,
      ValueTypeRenderingType? renderingType) {
    final bool isOptionSet = optionSet != null;
    final bool isDefaultRendering = renderingType == null ||
        renderingType == ValueTypeRenderingType.DEFAULT;
    final bool isSectionRenderingMatrix =
        (sectionRenderingType ?? SectionRenderingType.LISTING) !=
            SectionRenderingType.LISTING;
    return isOptionSet && isDefaultRendering && isSectionRenderingMatrix;
  }
}
