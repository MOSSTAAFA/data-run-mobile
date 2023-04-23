// Flutter imports:
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    this.text,
    required this.icon,
    this.style,
    this.alignment,
  });

  final String? text;
  final IconData icon;
  final TextStyle? style;
  final MainAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: style?.color),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text ?? '',
            style: style,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
