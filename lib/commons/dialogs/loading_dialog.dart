// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:mass_pro/utils/mass_utils/utils.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('${L('loading')}...'),
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
