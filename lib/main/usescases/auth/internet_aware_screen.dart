import 'package:flutter/material.dart';
import 'package:mass_pro/core/network/connectivy_service.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InternetAwareChip extends StatefulWidget {
  const InternetAwareChip();
  @override
  _InternetAwareChipState createState() => _InternetAwareChipState();
}

class _InternetAwareChipState extends State<InternetAwareChip> {
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    ConnectivityService.instance.connectivityStatusStream.listen((isOnline) {
      setState(() {
        _isOnline = isOnline;
      });
      if (!isOnline) {
        _showNoInternetDialog();
      }
    });
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('No Internet Connection'),
        content: Text('Please check your internet settings.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
        label: _isOnline
            ? Text(S.of(context).online)
            : Text(S.of(context).noInternetAccess),
        avatar: _isOnline ? Icon(MdiIcons.webCheck) : Icon(MdiIcons.webOff));
  }
}
