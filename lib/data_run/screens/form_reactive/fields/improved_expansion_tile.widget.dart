import 'package:flutter/material.dart';

class ImprovedExpansionTile extends StatelessWidget {
  ImprovedExpansionTile({
    this.title,
    this.titleWidget,
    required this.child,
    this.isExpanded = true,
    this.enabled = false,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.maintainState = false,
  });

  final String? title;
  final Widget? titleWidget;
  final bool enabled;
  final Widget child;
  final bool isExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  final bool initiallyExpanded;
  final bool maintainState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
// Adjust colors based on the current theme
    final backgroundColor = isDarkMode ? theme.cardColor : Colors.blue.shade50;
    final textColor =
        isDarkMode ? theme.textTheme.bodyMedium!.color : Colors.blue;
    final iconColor = isDarkMode ? theme.iconTheme.color : Colors.blue;

    return Card(
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          enableFeedback: true,
          maintainState: maintainState,
          enabled: enabled,
          onExpansionChanged: onExpansionChanged,
          initiallyExpanded: isExpanded,
          tilePadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          title: titleWidget != null
              ? titleWidget!
              : Text(
                  title ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: !isDarkMode ? Colors.blue : null,
                  ),
                ),
          backgroundColor: !isDarkMode ? Colors.blue.shade50 : null,
          trailing: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: Duration(milliseconds: 100),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.blue,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
