import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_intent.freezed.dart';

@freezed
class FormIntent with _$FormIntent {
  // NMC
  const factory FormIntent.init() = Init;

  /// Similar to on save() called on the form state
  /// clear all form's fields' values
  /// Invoked when the form's GlobalKey's currentState.save() method is called.
  /// Ideal for capturing data from the field for further processing or storage (e.g., sending to a server, saving to local storage).
  /// Doesn't trigger any immediate UI changes or validation.
  const factory FormIntent.onFinish([String? extraData]) = OnFinish;

  /// clear all form's fields' values
  const factory FormIntent.onClear([String? extraData]) = OnClear;

  const factory FormIntent.onFocus(String uid, String? value) = OnFocus;

  /// If you want to trigger specific actions based on user input
  /// completion, such as submitting a form, searching
  /// based on entered text, or performing calculations,
  /// use onSubmit. It's more suited for immediate actions
  /// tied to user interaction.
  /// In some cases, you might use both onSave and onSubmit.
  /// For example, you could use onSubmit to show a loading
  /// indicator while onSave gathers validated data for submission.
  /// Fired when the user presses the "Enter" key in the TextFormField.
  /// Commonly used to perform form submission logic
  /// (e.g., validation, data processing, navigation).
  /// Can optionally hide the keyboard by setting the textInputAction
  /// property to a "completion action" (like "done" or "send").
  const factory FormIntent.onNext(
      {required String uid, String? value, int? position}) = OnNext;

  /// onSave value whenever text changed
  /// Purpose: Used to extract the current value from a TextFormField
  /// when the form is submitted (typically by a button press). It's
  /// part of a form validation and data collection process.
  /// Callback Function: Takes a single argument of type String
  /// (or the appropriate type for your field) to capture the user's input.
  /// Trigger: Invoked when the form's GlobalKey is used with
  /// currentState.save(). This method iterates through all fields
  /// with an onSave callback and calls them one by one.
  const factory FormIntent.onSave(
      {required String uid,
      String? value,
      ValueType? valueType,
      String? fieldMask}) = OnSave;

  const factory FormIntent.onTextChange(String uid, String? value) =
      OnTextChange;

  /// Clear single field value
  const factory FormIntent.clearValue(String uid) = ClearValue;

  const factory FormIntent.selectLocationFromCoordinates({
    required String uid,
    String? coordinates,
    required String extraData,
  }) = SelectLocationFromCoordinates;

  const factory FormIntent.selectLocationFromMap(
      {required String uid,
      required String featureType,
      String? coordinates}) = SelectLocationFromMap;

  const factory FormIntent.saveCurrentLocation({
    required String uid,
    String? value,
    required String featureType,
  }) = SaveCurrentLocation;

  const factory FormIntent.onSection(String sectionUid) = OnSection;

  const factory FormIntent.onRequestCoordinates(String uid) =
      OnRequestCoordinates;

  const factory FormIntent.onCancelRequestCoordinates({required String uid}) =
      OnCancelRequestCoordinates;

  const FormIntent._();
}
