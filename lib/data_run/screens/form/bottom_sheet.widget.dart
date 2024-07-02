import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/form/bottomsheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_sheet.widget.g.dart';

@riverpod
QBottomSheetDialogUiModel bottomSheetUiModel(BottomSheetUiModelRef ref) {
  return QBottomSheetDialogUiModel(
    title: 'Final Data',
    subtitle: 'Make the form Final before exiting.',
    iconResource: Icons.info,
    mainButton: QDialogButtonStyle.completeButton(),
    secondaryButton: QDialogButtonStyle.neutralButton(textResource: 'Not Now'),
  );
}

class QBottomSheetDialog extends StatelessWidget {
  const QBottomSheetDialog(
      {super.key,
      required this.uiModel,
      this.onMainClicked,
      this.onSecondaryClicked});

  final QBottomSheetDialogUiModel uiModel;
  final VoidCallback? onMainClicked;
  final VoidCallback? onSecondaryClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(uiModel.iconResource, size: 40),
          const SizedBox(height: 10),
          Text(
            uiModel.title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            uiModel.subtitle,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (uiModel.secondaryButton != null)
                _buildButton(context, uiModel.secondaryButton!),
              _buildButton(context, uiModel.mainButton),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, QDialogButtonStyle buttonStyle) {
    return ElevatedButton.icon(
      onPressed: buttonStyle.enabled
          ? () {
              buttonStyle.map(
                  mainButton: (_) => onMainClicked?.call(),
                  secondaryButton: (_) => onSecondaryClicked?.call());
              Navigator.pop(context);
            }
          : null,
      icon: buttonStyle.iconResource != null
          ? Icon(buttonStyle.iconResource)
          : const SizedBox.shrink(),
      label: Text(buttonStyle.textResource),
      style: ElevatedButton.styleFrom(
        foregroundColor: buttonStyle.colorResource,
        backgroundColor: buttonStyle.backgroundColor,
      ),
    );
  }
}
