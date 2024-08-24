import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class OptionConfiguration with EquatableMixin {
  OptionConfiguration(
      {List<FormOption>? options,
      List<String>? optionsToHide,
      List<String>? optionsToShow})
      : this.options = IList.orNull(options) ?? IList(),
        this.optionsToHide = IList.orNull(optionsToHide) ?? IList(),
        this.optionsToShow = IList.orNull(optionsToShow) ?? IList();

  final IList<FormOption> options;
  final IList<String> optionsToHide;
  final IList<String> optionsToShow;

  OptionConfiguration copyWith(
          {List<FormOption>? options,
          List<String>? optionsToHide,
          List<String>? optionsToShow}) =>
      OptionConfiguration(
        options: options ?? this.options.unlock,
        optionsToHide: optionsToHide ?? this.optionsToHide.unlock,
        optionsToShow: optionsToShow ?? this.optionsToShow.unlock,
      );

  List<FormOption> get optionsToDisplay {
    List<FormOption> toDisplay = [];

    if (optionsToShow.isNotEmpty) {
      toDisplay = options
          .where((FormOption option) => optionsToShow.contains(option.name))
          .toList();
    } else {
      toDisplay = options
          .where((FormOption option) => !optionsToHide.contains(option.name))
          .toList();
    }
    return toDisplay;
  }

  @override
  List<Object?> get props => [optionsToHide, optionsToShow];
//
// // NMC
// IList<FormOption> get optionsToDisplayCumulative => _getOptions();
//
// IList<FormOption> _getOptions() {
//   IList<FormOption> optionsToDisplay = options;
//
//   if (optionsToHide.isNotEmpty) {
//     optionsToDisplay =
//         options.removeWhere((item) => optionsToHide.contains(item.name));
//   }
//
//   if (optionsToShow.isNotEmpty) {
//     optionsToDisplay =
//         options.retainWhere((item) => optionsToShow.contains(item.name));
//   }
//
//   return optionsToDisplay
//       .sort((a, b) => (a.sortOrder).compareTo(b.sortOrder));
// }
}
