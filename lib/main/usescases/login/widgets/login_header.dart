import 'package:flutter/material.dart';
import 'package:datarun/generated/l10n.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 60), // Adjust padding as needed
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).dialogBackgroundColor,
                Theme.of(context).dialogBackgroundColor
              ]),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 4,
                color: Colors.black)
          ],
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
      child: Column(
        children: [
          Image.asset(
            'assets/launcher_icon/logo_white.png',
            height: 120,
            width: 120,
            // fit: BoxFit.contain,
          ),
          const SizedBox(height: 8), // Spacer between logo and text
          Text(
            S.of(context).nmcpYemen,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor, // Match with logo color
            ),
          ),
        ],
      ),
    );
  }
}
