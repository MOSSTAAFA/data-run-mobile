// Flutter imports:
import 'package:flutter/material.dart';

import '../../../utils/mass_utils/colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isInHeader = false,
    this.color,
  });

  final String label;
  final Function()? onPressed;
  final bool isInHeader;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // final prefState = context.select((AppBloc bloc) => bloc.state.prefState);
    // final headerTextColor =
    //     context.select((AppBloc bloc) => bloc.state.headerTextColor);

    Color? primaryColor;
    if (onPressed == null) {
      //
    } else if (color != null) {
      primaryColor = color;
    } else if (isInHeader) {
      primaryColor = convertHexStringToColor('#000000'); //headerTextColor;
    }
    /*else if (prefState.enableDarkMode) {
      primaryColor = Colors.white;
    } else {
      primaryColor = Colors.black87;
    }*/

    final ButtonStyle flatButtonStyle =
        TextButton.styleFrom(primary: primaryColor);

    return TextButton(
      style: flatButtonStyle,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
