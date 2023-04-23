// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

import '../../utils/mass_utils/utils.dart';
import '../constants.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return Padding(
        padding: EdgeInsets.only(
            left: kMobileDialogPadding,
            top: kMobileDialogPadding,
            right: kMobileDialogPadding,
            bottom: kMobileDialogPadding +
                MediaQuery.of(context).viewInsets.bottom),
        child: child,
      );
    } else {
      return FractionallySizedBox(
        widthFactor: .4,
        child: Padding(
            padding: const EdgeInsets.only(top: kMobileDialogPadding * 2),
            child: child),
      );
    }
  }
}
