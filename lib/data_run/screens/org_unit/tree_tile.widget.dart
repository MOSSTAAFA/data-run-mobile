import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:mass_pro/data_run/screens/org_unit/data_model/tree_node.dart';

class TreeTile extends StatefulWidget {
  const TreeTile({
    super.key,
    required this.entry,
    required this.match,
    required this.searchPattern,
    this.onSelect,
    this.isSelected = false,
  });

  final TreeEntry<TreeNode> entry;
  final TreeSearchMatch? match;
  final Pattern? searchPattern;
  final void Function(TreeNode?)? onSelect;
  final bool isSelected; // New parameter

  @override
  State<TreeTile> createState() => _TreeTileState();
}

class _TreeTileState extends State<TreeTile> {
  late InlineSpan titleSpan;

  TextStyle? dimStyle;
  TextStyle? highlightStyle;

  bool get shouldShowBadge =>
      !widget.entry.isExpanded && (widget.match?.subtreeMatchCount ?? 0) > 0;

  @override
  Widget build(BuildContext context) {
    return TreeIndentation(
      entry: widget.entry,
      child: GestureDetector(
        onTap: () => widget.onSelect?.call(widget.entry.node),
        child: Container(
          color: widget.isSelected
              ? Colors.blue.withOpacity(0.2) // Highlight color
              : Colors.transparent, // Default background color
          child: Row(
            children: [
              ExpandIcon(
                key: GlobalObjectKey(widget.entry.node),
                isExpanded: widget.entry.isExpanded,
                onPressed: (_) => TreeViewScope.of<TreeNode>(context)
                  ..controller.toggleExpansion(widget.entry.node),
              ),
              if (shouldShowBadge)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Badge(
                    label: Text('${widget.match?.subtreeMatchCount}'),
                  ),
                ),
              Flexible(
                child: Text.rich(
                  titleSpan,
                  style: widget.isSelected
                      ? const TextStyle(
                          fontWeight: FontWeight.bold) // Bold text for selected
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setupTextStyles();
    titleSpan = buildTextSpan();
  }

  @override
  void didUpdateWidget(covariant TreeTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchPattern != widget.searchPattern ||
        oldWidget.entry.node.data.name != widget.entry.node.data.name) {
      titleSpan = buildTextSpan();
    }
  }

  void setupTextStyles() {
    final TextStyle style = DefaultTextStyle.of(context).style;
    final Color highlightColor = Theme.of(context).colorScheme.primary;
    highlightStyle = style.copyWith(
      color: highlightColor,
      decorationColor: highlightColor,
      decoration: TextDecoration.underline,
    );
    dimStyle = style.copyWith(color: style.color?.withAlpha(128));
  }

  InlineSpan buildTextSpan() {
    final String title = widget.entry.node.data.name!;

    if (widget.searchPattern == null) {
      return TextSpan(text: title);
    }

    final List<InlineSpan> spans = <InlineSpan>[];
    bool hasAnyMatches = false;

    title.splitMapJoin(
      widget.searchPattern!,
      onMatch: (Match match) {
        hasAnyMatches = true;
        spans.add(TextSpan(text: match.group(0)!, style: highlightStyle));
        return '';
      },
      onNonMatch: (String text) {
        spans.add(TextSpan(text: text));
        return '';
      },
    );

    if (hasAnyMatches) {
      return TextSpan(children: spans);
    }

    return TextSpan(text: title, style: dimStyle);
  }
}
