import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'app_border.dart';

class FormCard extends StatelessWidget {
  const FormCard({
    super.key,
    this.children,
    this.child,
    this.crossAxisAlignment,
    this.padding,
    this.internalPadding,
    this.isLast = false,
    this.forceNarrow = false,
    this.elevation = 4,
    this.constraints,
  });

  final Widget? child;
  final List<Widget>? children;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool forceNarrow;
  final EdgeInsets? padding;
  final EdgeInsets? internalPadding;
  final bool isLast;
  final double elevation;
  final BoxConstraints? constraints;

  FormCard copyWith(
      {Widget? child,
      List<Widget>? children,
      CrossAxisAlignment? crossAxisAlignment,
      bool? forceNarrow,
      EdgeInsets? padding,
      EdgeInsets? internalPadding,
      bool? isLast,
      double? elevation,
      BoxConstraints? constraints}) {
    return FormCard(
      child: child ?? this.child,
      children: children ?? this.children,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      forceNarrow: forceNarrow ?? this.forceNarrow,
      padding: padding ?? this.padding,
      internalPadding: internalPadding ?? this.internalPadding,
      isLast: isLast ?? this.isLast,
      elevation: elevation ?? this.elevation,
      constraints: constraints ?? this.constraints,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (child == null && (children == null || children?.isEmpty == true)) {
      return const SizedBox();
    }

    return Padding(
      padding: padding ??
          (forceNarrow
              ? EdgeInsets.symmetric(
                  horizontal:
                      max((MediaQuery.of(context).size.width - 510) / 2, 16),
                )
              : EdgeInsets.only(
                  left: kMobileDialogPadding,
                  top: kMobileDialogPadding,
                  right: kMobileDialogPadding,
                  bottom: isLast ? kMobileDialogPadding : 0,
                )),
      child: FocusTraversalGroup(
        child: Card(
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          child: AppBorder(
            hideBorder: true, //!isDarkMode(context),
            child: Padding(
              padding: internalPadding ?? const EdgeInsets.all(16),
              child: child ??
                  Container(
                    width: double.infinity,
                    constraints: constraints,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment:
                          crossAxisAlignment ?? CrossAxisAlignment.center,
                      children: children!,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
