// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../model/field_ui_model.dart';
// import '../model/key_board_action_type.dart';
// import '../model/section_ui_model_impl.dart';
// import 'di/form_view_controllers.dart';
// import 'intent/form_intent.dart';
//
// part 'data_entry_item_controller.g.dart';
//
// @riverpod
// class DataEntryItemController extends _$DataEntryItemController {
//   @override
//   FieldUiModel build(int index) {
//     final item = ref.watch(itemsResultProvider
//         .select((itemsListAsyncValue) => itemsListAsyncValue.value![index]));
//     return item;
//   }
//
//   void updateValue(
//           FieldUiModel Function(FieldUiModel? current) updateCallback) =>
//       state = updateCallback.call(state);
//
//   void setCallback(Callback callback) =>
//       state = state.copyWith(callback: callback);
//
//   void setValue(String? value) => state = state.copyWith(value: value);
//
//   void setIsLoadingData(bool isLoadingData) =>
//       state = state.copyWith(isLoadingData: isLoadingData);
//
//   void setFocus() => state = state.copyWith(focused: true);
//
//   void setError(String? error) => state = state.copyWith(error: error);
//
//   void setEditable(bool editable) =>
//       state = state.copyWith(editable: editable);
//
//   // void setLegend(LegendValue? legendValue) =>
//   //     state = state?.copyWith(legend: legendValue);
//
//   void setWarning(String warning) => state = state.copyWith(warning: warning);
//
//   void setFieldMandatory() => state = state.copyWith(mandatory: true);
//
//   void setDisplayName(String? displayName) =>
//       state = state.copyWith(displayName: displayName);
//
//   void setKeyBoardActionDone() =>
//       state = state.copyWith(keyboardActionType: KeyboardActionType.DONE);
//
//   void setSelected() {
//     if(state is SectionUiModelImpl) {
//       state.onItemClick();
//       if ((state as SectionUiModelImpl).selectedField != null) {
//         String sectionToOpen = state.uid;
//         // ignore: cast_nullable_to_non_nullable
//         if ((state as SectionUiModelImpl).selectedField == state.uid) {
//           sectionToOpen = '';
//         }
//         state.callback?.intent?.call(FormIntent.onSection(sectionToOpen));
//         state = state.copyWith(selectedField: sectionToOpen);
//       }
//     }
//   }
//
//   void setSectionNumber(int sectionNumber) =>
//       state = state.copyWith(sectionNumber: sectionNumber);
//
//   void setShowBottomShadow(bool showBottomShadow) =>
//       state = state.copyWith(showBottomShadow: showBottomShadow);
//
//   void setLastSectionHeight(bool lastPositionShouldChangeHeight) =>
//       state = state.copyWith(
//           lastPositionShouldChangeHeight: lastPositionShouldChangeHeight);
// }
//
// /// Section Controller
// ///
// // @riverpod
// // class DataEntryItemSectionController extends _$DataEntryItemSectionController {
// //   @override
// //   SectionUiModelImpl build(SectionUiModelImpl sectionUiModelImpl) {
// //     return sectionUiModelImpl;
// //   }
// //
// //   void updateValue(
// //           SectionUiModelImpl Function(SectionUiModelImpl? current)
// //               updateCallback) =>
// //       state = updateCallback.call(state);
// //
// //   void setSelected() {
// //     state.onItemClick();
// //     if (state.selectedField != null) {
// //       String sectionToOpen = state.uid;
// //       if (state.selectedField == state.uid) {
// //         sectionToOpen = '';
// //       }
// //       state.callback?.intent?.call(FormIntent.onSection(sectionToOpen));
// //       state = state.copyWith(selectedField: sectionToOpen);
// //     }
// //   }
// //
// //   void setSectionNumber(int sectionNumber) =>
// //       state = state.copyWith(sectionNumber: sectionNumber);
// //
// //   void setShowBottomShadow(bool showBottomShadow) =>
// //       state = state.copyWith(showBottomShadow: showBottomShadow);
// //
// //   void setLastSectionHeight(bool lastPositionShouldChangeHeight) =>
// //       state = state.copyWith(
// //           lastPositionShouldChangeHeight: lastPositionShouldChangeHeight);
// //
// //   void setCallback(Callback callback) =>
// //       state = state.copyWith(callback: callback);
// //
// //   void setValue(String? value) => state = state.copyWith(value: value);
// //
// //   void setIsLoadingData(bool isLoadingData) =>
// //       state = state.copyWith(isLoadingData: isLoadingData);
// //
// //   void setFocus() => state = state.copyWith(focused: true);
// //
// //   void setError(String? error) => state = state.copyWith(error: error);
// //
// //   void setEditable(bool editable) => state = state.copyWith(editable: editable);
// //
// //   // void setLegend(LegendValue? legendValue) =>
// //   //     state = state.copyWith(legend: legendValue);
// //
// //   void setWarning(String warning) => state = state.copyWith(warning: warning);
// //
// //   void setFieldMandatory() => state = state.copyWith(mandatory: true);
// //
// //   void setDisplayName(String? displayName) =>
// //       state = state.copyWith(displayName: displayName);
// //
// //   void setKeyBoardActionDone() =>
// //       state = state.copyWith(keyboardActionType: KeyboardActionType.DONE);
// // }
//
// // abstract class DataEntryItemController {
// //   void updateValue(FieldUiModel Function(FieldUiModel? current) updateCallback);
// //
// //   void setCallback(Callback callback);
// //
// //   void setValue(String? value);
// //
// //   void setIsLoadingData(bool isLoadingData);
// //
// //   void setFocus();
// //
// //   void setError(String? error);
// //
// //   void setEditable(bool editable);
// //
// //   // void setLegend(LegendValue? legendValue);
// //
// //   void setWarning(String warning);
// //
// //   void setFieldMandatory();
// //
// //   void setDisplayName(String? displayName);
// //
// //   void setKeyBoardActionDone();
// // }
