import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';

class OptionSetConfiguration {
  const OptionSetConfiguration();

  Future<Option?> optionInDataSetByCode(
      String optionSetUid, String optionCode) async {
    return D2Remote.optionModule.option
        .byOptionSet(optionSetUid)
        .where(attribute: 'code', value: optionCode)
        .getOne(); // .blockingGet()
  }

  Future<Option?> optionInDataSetByName(
      String optionSetUid, String optionName) async {
    return D2Remote.optionModule.option
        .byOptionSet(optionSetUid)
        .where(attribute: 'name', value: optionName)
        .getOne(); // .blockingGet()
  }
}
