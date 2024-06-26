import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class OverlayConfirmButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onConfirm;

  const OverlayConfirmButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onConfirm,
  }) : super(key: key);

  @override
  OverlayConfirmButtonState createState() => OverlayConfirmButtonState();
}

class OverlayConfirmButtonState extends State<OverlayConfirmButton> {
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  bool _isConfirming = false;
  OverlayEntry? _overlayEntry;

  void _showConfirmation() {
    setState(() {
      _isConfirming = true;
    });

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _hideConfirmation();
        },
        child: ColoredBox(
          color: Colors.black54,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedLoadingButton(
                  borderRadius: 4,
                  width: 430,
                  controller: _buttonController,
                  color: Colors.green,
                  onPressed: () {
                    _buttonController.start();
                    widget.onConfirm();

                    _buttonController.stop();

                    _hideConfirmation();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check, color: Colors.white),
                      Text(' Confirm ${widget.label}',
                          style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideConfirmation() {
    setState(() {
      _isConfirming = false;
    });
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool) => _hideConfirmation(),
      canPop: _canPop(),
      child: ElevatedButton.icon(
        onPressed: _isConfirming ? null : _showConfirmation,
        icon: Icon(widget.icon, color: Colors.white),
        label: Text(widget.label, style: const TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
        ),
      ),
    );
  }

  bool _canPop() {
    if (_overlayEntry != null) {
      // _hideConfirmation();
      return false;
    }
    return true;
  }
}
