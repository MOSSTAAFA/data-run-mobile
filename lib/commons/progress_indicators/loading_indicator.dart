// Flutter imports:
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.useCard = false, this.height});

  final double? height;
  final bool useCard;

  @override
  Widget build(BuildContext context) {
    if (useCard) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 200.0,
          width: double.infinity,
          child: Card(
            elevation: 4.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: height ?? double.infinity,
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
