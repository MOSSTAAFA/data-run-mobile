import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'form_generate2.gform.dart';

@Rf()
class StockDistribution {
  StockDistribution({
    @RfArray() this.stockItems = const [],
  });
  final List<RepeatedStockItem> stockItems;
}

@RfGroup()
class RepeatedStockItem {
  RepeatedStockItem({
    @RfControl() required this.received,
  });

  final int received;
}

