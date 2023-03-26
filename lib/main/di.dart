// Package imports:
import 'package:get/get.dart';

// Project imports:

import '../commons/org_unit_selector/ou_selector_dialog.presenter.dart';

void init() {
  /// New >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  /// Disk Persistence -----------------
  Get.lazyPut<OuSelectorDialogPresenter>(() => OuSelectorDialogPresenter(),
      fenix: true);
}
