// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import '../../main/l10n/app_localizations.dart';
import '../../utils/mass_utils/icons.dart';
import '../utils/view_actions.dart';

class ActionMenuButton extends StatelessWidget {
  const ActionMenuButton({
    super.key,
    // required this.entity,
    required this.onSelected,
    this.isSaving = false,
    this.entityActions,
    this.color,
    this.iconData,
    this.iconSize,
  });

  // final Identifiable entity;
  final List<ViewAction?>? entityActions;
  final Function(BuildContext, ViewAction) onSelected;
  final bool isSaving;
  final Color? color;
  final IconData? iconData;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuEntry<ViewAction>> actions = [];
    // final appState = context.watch<AppBloc>().state;
    // final appState = context.watch<AppBloc>().state;

    if (isSaving) {
      return const IconButton(
        onPressed: null,
        icon: SizedBox(
          width: 26,
          height: 26,
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    entityActions?.forEach((action) {
      if (action == null) {
        actions.add(const PopupMenuDivider());
      } else {
        actions.add(PopupMenuItem<ViewAction>(
          value: action,
          child: Row(
            children: <Widget>[
              Icon(
                getViewActionIcon(action),
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                    AppLocalization.of(context)!.lookup(action.toString())),
              ),
            ],
          ),
        ));
      }
    });

    return PopupMenuButton<ViewAction>(
      icon: Icon(
        iconData ?? Icons.more_vert,
        size: iconSize,
        color: color,
      ),
      itemBuilder: (BuildContext context) => actions,
      onSelected: (ViewAction action) {
        onSelected(context, action);
      },
      enabled: actions.isNotEmpty,
      // tooltip: appState.prefState.enableTooltips ? null : '',
    );
  }
}

/// This class is used to differentiate List and View ActionMenuButtons
/// during tests
class ViewActionMenuButton extends StatelessWidget {
  const ViewActionMenuButton({
    super.key,
    // required this.entity,
    required this.onSelected,
    this.isSaving = false,
    this.entityActions,
  });

  // final Identifiable entity;
  final List<ViewAction?>? entityActions;
  final Function(BuildContext, ViewAction) onSelected;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return ActionMenuButton(
        // entity: entity,
        onSelected: onSelected,
        isSaving: isSaving,
        entityActions: entityActions);
  }
}
