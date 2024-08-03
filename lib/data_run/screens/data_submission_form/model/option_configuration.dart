import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_configuration.freezed.dart';

@freezed
class OptionConfiguration with _$OptionConfiguration {
  const factory OptionConfiguration.defaultOptionSet(
      {required IList<FormOption> options,
      @Default(IListConst([])) IList<String> optionsToHide,
      @Default(IListConst([])) IList<String> optionsToShow}) = DefaultOptionSet;

  const factory OptionConfiguration.bigOptionSet(
      {@Default(IListConst([])) IList<FormOption> options,
      @Default(IListConst([])) IList<String> optionsToHide,
      @Default(IListConst([])) IList<String> optionsToShow}) = BigOptionSet;

  const OptionConfiguration._();

  static OptionConfiguration config(
      int optionCount, IList<FormOption> Function() optionRequestCallback) {
    return optionCount > 15
        ? const BigOptionSet()
        : OptionConfiguration.defaultOptionSet(
            options: optionRequestCallback());
  }

  OptionConfiguration updateOptionsToHideAndShow(
      {required IList<String> optionsToShow,
      required IList<String> optionsToHide}) {
    return setOptionsToHide(optionsToHide).setOptionsToShow(optionsToShow);
  }

  OptionConfiguration setOptionsToHide(IList<String> optionsToHide) {
    return map(
        defaultOptionSet: (DefaultOptionSet defaultOptionSet) =>
            defaultOptionSet.copyWith(optionsToHide: optionsToHide),
        bigOptionSet: (BigOptionSet bigOptionSet) =>
            bigOptionSet.copyWith(optionsToHide: optionsToHide));
  }

  OptionConfiguration setOptionsToShow(IList<String> optionsToShow) {
    return map(
        defaultOptionSet: (DefaultOptionSet defaultOptionSet) =>
            defaultOptionSet.copyWith(optionsToShow: optionsToShow),
        bigOptionSet: (BigOptionSet bigOptionSet) =>
            bigOptionSet.copyWith(optionsToShow: optionsToShow));
  }

  IList<FormOption> get optionsToDisplay => options
      .where((FormOption option) => optionsToShow.isNotEmpty
          ? optionsToShow.contains(option.name)
          : !optionsToHide.contains(option.name))
      .toIList();
}
