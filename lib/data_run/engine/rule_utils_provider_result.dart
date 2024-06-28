import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class RuleUtilsProviderResult {
  // final List<RulesUtilsProviderConfigurationError> configurationErrors;

  // final IMap<String, List<String>> optionsToHide;
  // final IMap<String, List<String>> optionGroupsToHide;
  // final IMap<String, List<String>> optionGroupsToShow;

  RuleUtilsProviderResult({
    required this.canComplete,
    this.messageOnComplete,
    required this.fieldsWithErrors,
    required this.fieldsWithWarnings,
    required this.unsupportedRules,
    required this.fieldsToUpdate,
    required this.stagesToHide,
    // required this.configurationErrors,
    // required this.optionsToHide,
    // required this.optionGroupsToHide,
    // required this.optionGroupsToShow,
  });

  final bool canComplete;
  final String? messageOnComplete;
  final List<FieldWithError> fieldsWithErrors;
  final List<FieldWithError> fieldsWithWarnings;
  final List<String> unsupportedRules;
  final List<String> fieldsToUpdate;
  final List<String> stagesToHide;

  IMap<String, String> errorMap() {
    return IMap.fromEntries(
      fieldsWithErrors.map((e) => MapEntry(e.fieldUid, e.errorMessage)),
    );
  }

  IMap<String, String> warningMap() {
    return IMap.fromEntries(
      fieldsWithWarnings.map((e) => MapEntry(e.fieldUid, e.errorMessage)),
    );
  }

// List<String> optionsToHide(String fieldUid) {
//   return optionsToHide[fieldUid] ?? [];
// }
//
// List<String> optionGroupsToHide(String fieldUid) {
//   return optionGroupsToHide[fieldUid] ?? [];
// }
//
// List<String> optionGroupsToShow(String fieldUid) {
//   return optionGroupsToShow[fieldUid] ?? [];
// }
}

class FieldWithError {
  FieldWithError({
    required this.fieldUid,
    required this.errorMessage,
  });

  final String fieldUid;
  final String errorMessage;
}

// class RulesUtilsProviderConfigurationError {
//   // Define the properties and constructor of this class based on your requirements
// }
