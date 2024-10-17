import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/custom/q_reactive_field.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/custom/q_reactive_focusable_form_field.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

typedef QReactiveFormFieldCallback<T> = void Function(FormFieldElement<T> element);

// created by a static factory method
class QReactiveTextField<T> extends QReactiveFormField<T, String> {
  final TextEditingController? _textController;

  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  QReactiveTextField({
    super.key,
    required super.element,
    super.validationMessages,
    super.valueAccessor,
    super.showErrors,
    super.focusNode,
    TextInputAction? textInputAction,
    InputDecoration decoration = const InputDecoration(),
    TextInputType? keyboardType,
    bool obscureText = false,
    TextEditingController? controller,
    bool canRequestFocus = true,
    bool autofocus = false,
    EditableTextContextMenuBuilder? contextMenuBuilder =
        _defaultContextMenuBuilder,
    QReactiveFormFieldCallback<T>? onTap,
    QReactiveFormFieldCallback<T>? onEditingComplete,
    QReactiveFormFieldCallback<T>? onSubmitted,
    QReactiveFormFieldCallback<T>? onChanged,
  })  : _textController = controller,
        super(builder: (field) {
          final state = field;
          final effectiveDecoration = decoration
              .applyDefaults(Theme.of(state.context).inputDecorationTheme);
          // field as QReactiveFormFieldState<ModelDataType, ViewDataType>;
          // return Visibility(
          //     visible: field.fieldElement.visible, child: builder(field));

          return Visibility(
            visible: state.fieldElement.visible,
            child: TextField(
              maxLength: element.maxLength,
              maxLines: element.maxLines,
              keyboardType: element.inputType,
              readOnly: element.elementState.readOnly,
              autofocus: autofocus,
              contextMenuBuilder: contextMenuBuilder,
              obscureText: obscureText,
              textInputAction: textInputAction,
              enabled: element.elementControl!.enabled,
              canRequestFocus: canRequestFocus,
              decoration: effectiveDecoration.copyWith(
                  errorText: state.errorText, labelText: element.label),
              onTap: onTap != null ? () => onTap(element) : null,
              onSubmitted:
                  onSubmitted != null ? (_) => onSubmitted(element) : null,
              onEditingComplete: onEditingComplete != null
                  ? () => onEditingComplete.call(element)
                  : null,
              onChanged: (value) {
                field.didChange(value);
                onChanged?.call(element);
              },
            ),
          );
        });

  @override
  QReactiveFormFieldState<T, String> createState() =>
      _ReactiveTextFieldState<T>();
}

class _ReactiveTextFieldState<T>
    extends QReactiveFocusableFormFieldState<T, String> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _initializeTextController();
  }

  @override
  void onControlValueChanged(dynamic value) {
    final effectiveValue = (value == null) ? '' : value.toString();
    _textController.value = _textController.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }

  @override
  ControlValueAccessor<T, String> selectValueAccessor() {
    if (control is FormControl<int>) {
      return IntValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<double>) {
      return DoubleValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<DateTime>) {
      return DateTimeValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<TimeOfDay>) {
      return TimeOfDayValueAccessor() as ControlValueAccessor<T, String>;
    }

    return super.selectValueAccessor();
  }

  void _initializeTextController() {
    final initialValue = value;
    final currentWidget = widget as QReactiveTextField<T>;
    _textController = (currentWidget._textController != null)
        ? currentWidget._textController!
        : TextEditingController();
    _textController.text = initialValue == null ? '' : initialValue.toString();
  }

  @override
  void dispose() {
    final currentWidget = widget as QReactiveTextField<T>;
    if (currentWidget._textController == null) {
      _textController.dispose();
    }
    super.dispose();
  }
}
