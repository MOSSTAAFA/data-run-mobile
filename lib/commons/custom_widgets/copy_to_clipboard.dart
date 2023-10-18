// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
// Package imports:
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

// Project imports:
import '../../main/l10n/app_localizations.dart';

class CopyToClipboard extends StatelessWidget {
  const CopyToClipboard({
    super.key,
    required this.value,
    this.child,
    this.showBorder = false,
    this.onLongPress,
    this.prefix,
  });

  final Widget? child;
  final String? value;
  final bool showBorder;
  final Function()? onLongPress;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    if ((value ?? '').isEmpty) {
      return const SizedBox();
    }

    final Widget widget = child ??
        Text(
          prefix != null ? '$prefix: $value' : value!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
    final AppLocalizations localization =
        AppLocalization.of(context)!.localized!;

    void onTap() => _onTap(context);

    if (showBorder) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 180),
        child: OutlinedButton(
          onPressed: onTap,
          onLongPress: onLongPress,
          child: widget,
        ),
      );
    } else {
      return InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: widget,
      );
    }
  }

  void _onTap(BuildContext context) {
    Clipboard.setData(ClipboardData(text: value ?? ''));
    showToast(
      AppLocalization.of(context)!.localized!.copiedToClipboard.replaceFirst(
            ':value',
            value!.replaceAll('\n', ' '),
          ),
    );
  }
}
