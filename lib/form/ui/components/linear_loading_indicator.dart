import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/form/ui/form_view_model.dart';
import '../../../utils/mass_utils/colors.dart';

class LinearLoadingIndicator extends ConsumerWidget {
  const LinearLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 10,
      child: ref.watch(loadingProvider)
          ? LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  convertHexStringToColor('#FF9800')!),
              semanticsLabel: 'Loading progress indicator',
            )
          : SizedBox(),
    );
  }
}
