import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../form/ui/components/linear_loading_indicator.dart';
import '../program_event_detail_view_model.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LinearLoadingIndicator(
      isLoading: ref.watch(
          programEventDetailModelProvider.select((value) => value.progress)),
    );
  }
}
