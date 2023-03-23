// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mass_pro/main/l10n/app_localizations.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!.localized!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('${localization.loading}...'),
        ),
        const Padding(
            padding: EdgeInsets.all(16.0),
            child: SizedBox(
              height: 4.0,
              child: LinearProgressIndicator(),
            ))
      ],
    );
  }
}
