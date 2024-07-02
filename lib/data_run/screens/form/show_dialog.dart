import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  String confirmButtonText = 'Confirm',
  String cancelButtonText = 'Cancel',
  required VoidCallback onConfirm,
}) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the action
              },
              child: Text(cancelButtonText),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop(true); // Confirm the action
              },
              child: Text(confirmButtonText),
            ),
          ],
        ),
      ) ??
      false; // Return false if the dialog is dismissed
}
