import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/mass_utils/colors.dart';

class LinearLoadingIndicator extends ConsumerWidget {
  const LinearLoadingIndicator({
    super.key,
    this.isLoading = false,
    this.backgroundColor,
  });

  final bool isLoading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: backgroundColor,
      height: 10,
      child: isLoading
          ? LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  convertHexStringToColor('#FF9800')!),
              semanticsLabel: 'Loading progress indicator',
              minHeight: 8,
            )
          : null,
    );
  }
}
