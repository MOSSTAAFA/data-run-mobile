// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// Project imports:
import '../../main/l10n/app_localizations.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization =
        AppLocalization.of(context)!.localized!;

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
