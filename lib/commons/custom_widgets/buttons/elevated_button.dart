// Flutter imports:
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../icon_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconData,
    this.color,
    this.width,
  });

  final Color? color;
  final IconData? iconData;
  final String label;
  final Function()? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color ?? Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        elevation: 4,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
      child: iconData != null
          ? IconText(
              icon: iconData!,
              text: label,
              alignment: MainAxisAlignment.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          : SizedBox(
              height: 24,
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: width == null
          ? button
          : SizedBox(
              width: width,
              child: button,
            ),
    );
  }
}
