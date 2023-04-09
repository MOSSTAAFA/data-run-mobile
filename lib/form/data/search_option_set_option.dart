import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option_set.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/option.module.dart';
import 'package:d2_remote/modules/metadata/option_set/queries/option.query.dart';
import 'package:d2_remote/shared/utilities/sort_order.util.dart';

class SearchOptionSetOption {
  const SearchOptionSetOption(this.optionSetModule);

  final OptionModule optionSetModule;

  //List<Option> invoke(String? optionSetUid, String textToSearch,
  //       List<String> optionsToShow, List<String> optionsToHide)
  Future<List<Option>> call(String? optionSetUid, String textToSearch,
      List<String> optionsToShow, List<String> optionsToHide) async {
    OptionSet? optionSet;
    OptionQuery query = optionSetModule.option;

    query = query.byOptionSet(optionSet?.id ?? '');

    if (textToSearch.isNotEmpty) {
      query = query.like(attribute: 'displayName', value: '%$textToSearch%');
    }

    if (optionsToShow.isNotEmpty) {
      query =
          query.whereIn(attribute: 'id', values: optionsToShow, merge: true);
    }

    // TODO(NMC): implement in SDK
    if (optionsToHide.isNotEmpty) {
      // query = query
      //     .whereIn(attribute: 'id', values: optionsToHide, merge: true);
      // repository = repository.byUid().notIn(optionsToHide)
    }

    return query
        .orderBy(attribute: 'sortOrder', order: SortOrder.ASC)
        .get(); //.blockingGet()
  }
}
