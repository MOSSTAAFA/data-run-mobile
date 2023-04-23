// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../utils/mass_utils/colors.dart';
import '../constants.dart';

class AppBorder extends StatelessWidget {
  const AppBorder({
    super.key,
    required this.child,
    this.isTop,
    this.isBottom,
    this.isLeft,
    this.hideBorder = false,
  });

  final Widget child;
  final bool? isTop;
  final bool? isBottom;
  final bool? isLeft;
  final bool? hideBorder;

  @override
  Widget build(BuildContext context) {
    if (hideBorder == true) {
      return child;
    }

    // final Store<AppState> store = StoreProvider.of<AppState>(context);
    // final state = store.state;
    final enableDarkMode = false; //state.prefState.enableDarkMode;
    final isAllSides = isTop == null && isLeft == null;
    const borderWidth = kIsWeb ? 2.0 : 1.5;

    final color = enableDarkMode
        ? convertHexStringToColor(kDefaultDarkBorderColor)!
        : convertHexStringToColor(kDefaultLightBorderColor)!;

    return Container(
        decoration: BoxDecoration(
          borderRadius:
              isAllSides ? BorderRadius.circular(kBorderRadius) : null,
          border: isAllSides
              ? Border.all(
                  width: borderWidth,
                  color: color,
                )
              : Border(
                  top: isTop == true
                      ? BorderSide(
                          width: borderWidth,
                          color: color,
                        )
                      : BorderSide.none,
                  bottom: isBottom == true
                      ? BorderSide(
                          width: borderWidth,
                          color: color,
                        )
                      : BorderSide.none,
                  left: isLeft == true
                      ? BorderSide(
                          width: borderWidth,
                          color: color,
                        )
                      : BorderSide.none,
                ),
        ),
        child: child);
  }
}
