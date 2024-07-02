// Flutter imports:
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/utils/mass_utils/colors.dart';

class ListDivider extends StatelessWidget {
  const ListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final color = convertHexStringToColor(kDefaultLightBorderColor);
    return Container(
      color: color,
      child: Divider(
        color: color,
        thickness: 1.5,
        height: 1.5,
      ),
    );
  }
}
