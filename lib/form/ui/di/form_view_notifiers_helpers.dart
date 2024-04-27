// part of 'form_view_notifier.dart';
//
// /// Private to this file global functions
// ///
// RowAction _getRowActionFromIntent(FormIntent intent) {
//   return intent.map(
//     onClear: (OnClear intent) =>
//         _createRowAction(uid: '', value: null, actionType: ActionType.ON_CLEAR),
//     clearValue: (ClearValue intent) =>
//         _createRowAction(uid: intent.uid, value: null),
//     selectLocationFromCoordinates: (SelectLocationFromCoordinates intent) {
//       final Exception? error =
//           _checkFieldError(ValueType.COORDINATE, intent.coordinates, null);
//       return _createRowAction(
//           uid: intent.uid,
//           value: intent.coordinates,
//           extraData: intent.extraData,
//           error: error,
//           valueType: ValueType.COORDINATE);
//     },
//     selectLocationFromMap: (SelectLocationFromMap intent) =>
//         _setCoordinateFieldValue(
//             fieldUid: intent.uid,
//             featureType: intent.featureType,
//             coordinates: intent.coordinates),
//     saveCurrentLocation: (SaveCurrentLocation intent) {
//       final Exception? error =
//           _checkFieldError(ValueType.COORDINATE, intent.value, null);
//       return _createRowAction(
//           uid: intent.uid,
//           value: intent.value,
//           extraData: intent.featureType,
//           error: error,
//           valueType: ValueType.COORDINATE);
//     },
//     onNext: (OnNext intent) => _createRowAction(
//         uid: intent.uid, value: intent.value, actionType: ActionType.ON_NEXT),
//     onSave: (OnSave intent) {
//       final Exception? error =
//           _checkFieldError(intent.valueType, intent.value, intent.fieldMask);
//       return _createRowAction(
//           uid: intent.uid,
//           value: intent.value,
//           error: error,
//           valueType: intent.valueType);
//     },
//     onFocus: (OnFocus intent) => _createRowAction(
//         uid: intent.uid, value: intent.value, actionType: ActionType.ON_FOCUS),
//     onTextChange: (OnTextChange intent) => _createRowAction(
//         uid: intent.uid,
//         value: intent.value,
//         actionType: ActionType.ON_TEXT_CHANGE,
//         valueType: ValueType.TEXT),
//     onSection: (OnSection intent) => _createRowAction(
//         uid: intent.sectionUid,
//         value: null,
//         actionType: ActionType.ON_SECTION_CHANGE),
//     onFinish: (OnFinish intent) => _createRowAction(
//         uid: '', value: null, actionType: ActionType.ON_FINISH),
//     onRequestCoordinates: (OnRequestCoordinates intent) => _createRowAction(
//         uid: intent.uid,
//         value: null,
//         actionType: ActionType.ON_REQUEST_COORDINATES),
//     onCancelRequestCoordinates: (OnCancelRequestCoordinates intent) =>
//         _createRowAction(
//             uid: intent.uid,
//             value: null,
//             actionType: ActionType.ON_CANCELL_REQUEST_COORDINATES),
//     init: (Init intent) =>
//         _createRowAction(uid: '', value: null, actionType: ActionType.ON_INIT),
//   );
// }
//
// /// _createRowAction Global to this file function
// RowAction _createRowAction(
//         {required String uid,
//         String? value,
//         String? extraData,
//         Exception? error,
//         ActionType actionType = ActionType.ON_SAVE,
//         ValueType? valueType}) =>
//     RowAction(
//         id: uid,
//         value: value,
//         extraData: extraData,
//         error: error,
//         type: actionType,
//         valueType: valueType);
//
// /// _checkFieldError Global to this file function
// ThrowableException? _checkFieldError(
//     ValueType? valueType, String? fieldValue, String? fieldMask) {
//   if (fieldValue.isNullOrEmpty) {
//     return null;
//   }
//
//   return fieldValue!.let((String value) {
//     ThrowableException? error;
//     final Result<String, ThrowableException>? result = valueType
//         ?.takeIf((ValueType item) => item != ValueType.IMAGE)
//         ?.validator
//         .validate(value);
//     error =
//         result?.fold((ThrowableException failure) => failure, (String success) => null);
//
//     fieldMask?.let((String mask) {
//       final Result<String, ThrowableException> result =
//           FieldMaskValidator(mask).validate(value);
//       error = result.fold(
//           (ThrowableException failure) => failure, (String success) => error);
//     });
//     return error;
//   });
// }
//
// RowAction _setCoordinateFieldValue(
//     {required String fieldUid,
//     required String featureType,
//     String? coordinates}) {
//   final FeatureType? type = FeatureType.valueOfFeatureType(featureType);
//   String? geometryCoordinates;
//   /*coordinates?.let {
//   geometryController.generateLocationFromCoordinates(
//       type,
//       coordinates
//       )?.coordinates();*/
//
//   Exception? error;
//   if (type == FeatureType.POINT) {
//     error = _checkFieldError(ValueType.COORDINATE, geometryCoordinates, null);
//   } else {
//     error = null;
//   }
//
//   return _createRowAction(
//       uid: fieldUid,
//       value: geometryCoordinates,
//       extraData: featureType,
//       error: error,
//       valueType: ValueType.COORDINATE);
// }
