import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../screens/form/element/form_element.dart';

part 'scanned_items_notifier.g.dart';

@riverpod
class Gs1ScannedItemsNotifier extends _$Gs1ScannedItemsNotifier {
  @override
  List<Gs1ScannedItem> build() {
    throw UnimplementedError();
  }

  void addItem(Gs1ScannedItem item) {
    state = [...state, item];
  }
}
