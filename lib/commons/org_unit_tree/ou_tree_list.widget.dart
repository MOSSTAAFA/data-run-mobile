import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';

import '../../../main/l10n/app_localizations.dart';
import '../custom_widgets/buttons/app_text_button.dart';
import '../custom_widgets/responsive_padding.dart';
import '../custom_widgets/scrollable_listview.dart';
import 'business_logic/ou_tree_list_presenter.dart';
import 'business_logic/ou_tree_list_view.dart';
import 'business_logic/ou_tree_node.model.dart';
import 'ou_tree_node.widget.dart';

class OuTreeList extends StatefulWidget {
  const OuTreeList(
      {super.key,
      required this.selectedOrgUnits,
      required this.onOrgUnitClick,
      required this.onOrgUnitSelected,
      required this.presenter,
      required this.onSelectionFinished,
      this.showAsDialog = true});

  final List<String> selectedOrgUnits;

  final void Function(OuTreeNodeModel node) onOrgUnitClick;
  final void Function(OrganisationUnit organisationUnit, bool isSelected)
      onOrgUnitSelected;
  final void Function(List<OrganisationUnit?> selectedOrgUnits)
      onSelectionFinished;
  final bool showAsDialog;

  // TODO(NMC): Inject
  final OuTreeListPresenter presenter;

  @override
  State<OuTreeList> createState() => _OuTreeListState();
}

class _OuTreeListState extends State<OuTreeList> implements OuTreeListView {
  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      child: Material(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _headerRow(),
            Expanded(
                child: StreamBuilder<List<OuTreeNodeModel>>(
                    stream: widget.presenter.orgUnitListStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<OuTreeNodeModel>> snapshot) {
                      if (snapshot.hasError) {
                        // return ReloadScreen(error: '${snapshot.error}', reload: presenter.loadData);
                        return Text('error: ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        return _createList(snapshot.data!);
                      }
                      return const SizedBox(height: 0);
                    })),
            _createButtons()
          ],
        ),
      ),
    );
  }

  Widget _headerRow() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: TextField(
            onChanged: (value) {
              widget.presenter.onStartSearchStream;
              if (value.isEmpty) {
                widget.presenter.onStartSearchValue = true;
              } else {
                widget.presenter.onSearchListenerValue = value;
              }
            },
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppLocalization.of(context)!.localized!.filter,
            ),
          ),
        ),
        AppTextButton(
          label: AppLocalization.of(context)!.lookup('clear_all'),
          isInHeader: true,
          onPressed: () => clearAll(),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _createButtons() {
    return Row(
      children: <Widget>[
        AppTextButton(
          label: AppLocalization.of(context)!.lookup('cancel'),
          onPressed: () => clearAndDismiss(),
        ),
        Expanded(
          child: AppTextButton(
            label: AppLocalization.of(context)!.lookup('accept'),
            onPressed: () => exitOuSelection(),
          ),
        ),
      ],
    );
  }

  Widget _createList(List<OuTreeNodeModel> organisationUnits) {
    return StreamBuilder<bool>(
        stream: widget.presenter.onRebuildListStream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            // return ReloadScreen(error: '${snapshot.error}', reload: presenter.loadData);
            return Text('error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return ScrollableListViewBuilder(
              itemCount: organisationUnits.length,
              itemBuilder: (BuildContext context, int index) {
                final OuTreeNodeModel node = organisationUnits[index];
                return OuTreeNode(
                  node: node,
                  preselected:
                      widget.selectedOrgUnits.contains(node.content.id),
                  checkCallback:
                      (OrganisationUnit organisationUnit, bool isChecked) {
                    widget.onOrgUnitSelected(organisationUnit, isChecked);
                  },
                  onOrgUnitClick: (OrganisationUnit organisationUnit) {
                    // Expand
                  },
                );
              },
            );
          }
          return const SizedBox(height: 0);
        });
  }

  void clearAll() {
    widget.selectedOrgUnits.clear();
    widget.presenter.rebuildList();
  }

  void clearAndDismiss() {
    widget.selectedOrgUnits.clear();
    Navigator.pop(context);
  }

  void exitOuSelection() {
    widget.presenter.getOrgUnits(widget.selectedOrgUnits).then(
        (List<OrganisationUnit?> orgUnits) =>
            widget.onSelectionFinished(orgUnits));
    // if (widget.showAsDialog) {
    Navigator.pop(context);
    // }
  }

  @override
  List<OuTreeNodeModel> getCurrentList() {
    // TODO(NMC): implement getCurrentList
    throw UnimplementedError();
  }

  @override
  void setOrgUnits(List<OuTreeNodeModel> organisationUnits) {
    // TODO(NMC): implement setOrgUnits
  }
}
