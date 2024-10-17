import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'form_generate.gform.dart';

/// could be looked at as a Section because the form as a whole start as a section
/// that contains the different types of dynamic fields, sections, repeatSections
///
@Rf()
class StockDistribution {
  StockDistribution({
    @RfControl() this.fieldName,
    this.malariaUnit,
    @RfArray() this.stockItems = const [],
  });

  final String? fieldName;
  final MUnitSection? malariaUnit;

  /// also could be looked at as a the repeated Section that
  final List<RepeatedStockItem> stockItems;
}

@RfGroup()
class MUnitSection {
  MUnitSection({
    @RfControl() this.mUnitName,
    @RfControl() this.mUnitType,
  });

  final String? mUnitName;

  final String? mUnitType;
}

/// each item could be looked at as a single repeatedSection Item model
final gs = Validators.required;

@RfGroup()
class RepeatedStockItem {
  RepeatedStockItem({
    @RfControl(validators: [const RequiredValidator()]) this.itemType = '',
    @RfControl() required this.receivedQuantity,
    required this.oum,
  });

  final String itemType;

  final String receivedQuantity;
  final StockUom oum;
}

@RfGroup()
class StockUom {
  StockUom({
    @RfControl() this.uom,
    @RfControl() this.uomRate,
  });

  final String? uom;

  final String? uomRate;
}
