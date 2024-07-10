import 'package:flutter/material.dart';
import 'package:mass_pro/main/l10n/app_localizations.dart';

class MessageDialog extends StatelessWidget {
  @deprecated
  const MessageDialog(
    this.message, {
    this.onDismiss,
    this.onDiscard,
    this.dismissLabel,
    this.secondaryActions,
  });

  final String message;
  final String? dismissLabel;
  final List<TextButton>? secondaryActions;
  final Function? onDismiss;
  final Function? onDiscard;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 24),
      child: Column(
        children: <Widget>[
          Material(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (secondaryActions != null)
                        Row(
                          children: secondaryActions!
                              .map((action) => Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: action,
                                  ))
                              .toList(),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (onDismiss != null) {
                              onDismiss!();
                            }
                          },
                          child: Text((dismissLabel ?? L.of(context)!.lookup('dismiss'))
                              .toUpperCase()),
                        ),
                      ),
                      if (onDiscard != null)
                        TextButton(
                            autofocus: true,
                            child:
                                Text(L.of(context)!.lookup('discardChanges').toUpperCase()),
                            onPressed: () {
                              Navigator.of(context).pop();
                              onDiscard!();
                            }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
