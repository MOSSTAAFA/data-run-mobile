// Flutter imports:
import 'package:flutter/material.dart';

import '../../utils/mass_utils/colors.dart';
import '../../utils/mass_utils/completers.dart';
import '../../utils/mass_utils/formatting.dart';
import '../constants.dart';

class ListFilter extends StatefulWidget {
  const ListFilter({
    super.key,
    required this.onFilterChanged,
    required this.filter,
    // required this.entityIds,
    this.entityIds,
    this.placeholder,
    // in case of desktop too
  });

  // final EntityType entityType;
  final String? filter;
  final Function(String?) onFilterChanged;
  final List<String>? entityIds;
  final String? placeholder;

  // final List<EntityStatus>? statuses;
  // final Function(EntityStatus, bool)? onSelectedStatus;
  // final Function(EntityState, bool)? onSelectedState;

  @override
  _ListFilterState createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  late TextEditingController _filterController;
  late FocusNode _focusNode;
  final _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    _filterController = TextEditingController();
    _focusNode = FocusNode()..addListener(onFocusChanged);
  }

  void onFocusChanged() {
    // Check is needed to prevent the TextField from
    // refocusing when the users tries to tab out
    if (_focusNode.hasFocus) {
      setState(() {});
    }
  }

  String get _getPlaceholder {
    if (_focusNode.hasFocus) {
      return '';
    }

    // final count = widget.entityIds.length;
    final count = widget.entityIds?.length ?? 0;

    final isSingle = count == 1;

    if (widget.placeholder != null) {
      return isSingle
          ? widget.placeholder!
          : widget.placeholder!.replaceFirst(
              ':count', formatNumber(count.toDouble(), context) ?? '');
    }
    return 'search';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _filterController.text = widget.filter ?? '';

    if (widget.filter != null) {
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _filterController.dispose();
    _focusNode.removeListener(onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1?.color;
    final isFilterSet = (widget.filter ?? '').isNotEmpty;

    Color? color;
    // if (enableDarkMode) {
    //   color = convertHexStringToColor(
    //       isFilterSet ? kDefaultDarkBorderColor : kDefaultDarkBorderColor);
    // } else {
    color = convertHexStringToColor(
        isFilterSet ? kDefaultLightBorderColor : kDefaultLightBorderColor);
    // }

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              height: 40,
              margin: const EdgeInsets.only(bottom: 2.0),
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.all(Radius.circular(kBorderRadius)),
              ),
              child: TextField(
                focusNode: _focusNode,
                textAlign:
                    _filterController.text.isNotEmpty || _focusNode.hasFocus
                        ? TextAlign.start
                        : TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 8, right: 8, bottom: 6),
                  suffixIcon: _filterController.text.isNotEmpty ||
                          _focusNode.hasFocus
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: textColor,
                          ),
                          onPressed: () {
                            _filterController.text = '';
                            _focusNode.unfocus(
                                disposition:
                                    UnfocusDisposition.previouslyFocusedChild);
                            widget.onFilterChanged(null);
                          },
                        )
                      : Icon(Icons.search, color: textColor),
                  border: InputBorder.none,
                  hintText: _getPlaceholder,
                ),
                autocorrect: false,
                onChanged: (value) {
                  _debouncer.run(() {
                    widget.onFilterChanged(value);
                  });
                },
                controller: _filterController,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
