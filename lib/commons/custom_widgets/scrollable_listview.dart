// Flutter imports:
import 'package:flutter/material.dart';

class ScrollableListView extends StatefulWidget {
  const ScrollableListView({
    super.key,
    required this.children,
    this.scrollController,
    this.padding,
    this.scrollDirection = Axis.vertical,
  });

  final List<Widget> children;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;

  @override
  State<ScrollableListView> createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends State<ScrollableListView> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: widget.padding,
      controller: widget.scrollController ?? _scrollController,
      shrinkWrap: true,
      children: widget.children,
    );
  }
}

class ScrollableListViewBuilder extends StatefulWidget {
  const ScrollableListViewBuilder({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.separatorBuilder,
    this.scrollController,
    this.padding,
    this.scrollDirection = Axis.vertical,
  });

  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final int itemCount;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;

  @override
  State<ScrollableListViewBuilder> createState() =>
      _ScrollableListViewBuilderState();
}

class _ScrollableListViewBuilderState extends State<ScrollableListViewBuilder> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.separatorBuilder != null
        ? ListView.separated(
            scrollDirection: widget.scrollDirection,
            separatorBuilder: widget.separatorBuilder!,
            padding: widget.padding,
            itemBuilder: widget.itemBuilder,
            itemCount: widget.itemCount,
            controller: widget.scrollController ?? _scrollController,
            shrinkWrap: true,
          )
        : ListView.builder(
            scrollDirection: widget.scrollDirection,
            padding: widget.padding,
            itemBuilder: widget.itemBuilder,
            itemCount: widget.itemCount,
            controller: widget.scrollController ?? _scrollController,
            shrinkWrap: true,
          );
  }
}
