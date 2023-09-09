import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'nav_info_notifier.dart';

class MenuItem {
  MenuItem({this.iconData, required this.text});

  IconData? iconData;
  String text;
}

class FABBottomAppBar extends ConsumerStatefulWidget {
  const FABBottomAppBar(
      {super.key,
      this.items = const [],
      this.onTabSelected,
      this.color = Colors.grey,
      this.selectedColor = Colors.orangeAccent,
      this.centerItemText,
      this.height = 60.0,
      this.iconSize = 24.0,
      this.backgroundColor,
      this.notchedShape});

  final List<MenuItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;

  @override
  ConsumerState<FABBottomAppBar> createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends ConsumerState<FABBottomAppBar> {
  void _updateIndex(int index) {
    widget.onTabSelected?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    // items.insert(items.length >> 1, _buildMiddleTabItem());
    items.add(_buildMiddleTabItem());

    // BottomNavigationBar();
    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  // final TabController tabBar;
  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required MenuItem item,
    required int index,
    ValueChanged<int>? onPressed,
  }) {
    final Color color =
        ref.watch(navInfoNotifierProvider /*(widget.key)*/).index == index
            ? widget.selectedColor
            : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed?.call(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
