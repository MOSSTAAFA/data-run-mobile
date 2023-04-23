import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:dartx/dartx_io.dart' show IterableFilter, Pair;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../../extensions/list_extensions.dart';
import 'ou_tree_list_view.dart';
import 'ou_tree_node.model.dart';
import 'ou_tree_repository.dart';

// TODO(NMC): implement Search and children nodes list
class OuTreeListPresenter extends GetxController implements Listenable {
  OuTreeListPresenter(
      {required this.view,
      required this.repository,
      required this.preselectedOrgUnits});

  final OuTreeListView view;
  final OuTreeRepository repository;
  final List<String> preselectedOrgUnits;

  final Rx<Pair<int, OrganisationUnit>?> _ouChildListener =
      Rx<Pair<int, OrganisationUnit>?>(null);

  final Rx<String?> _onSearchListener = Rx<String?>(null);

  final Rx<bool> _onStartSearch = Rx<bool>(false);

  final Rx<bool> _onRebuildList = Rx<bool>(false);

  final Rx<List<OuTreeNodeModel>> _orgUnitList = Rx<List<OuTreeNodeModel>>([]);

  Future<void> loadData() async {
    try {
      // isLoading = true;

      final List<OrganisationUnit> orgUnits = await repository.orgUnits();
      final orgs = orgUnits.filter((orgUnit) =>
          orgUnit.level == orgUnits.minBy((item) => item.level!)?.level);
      final List<OuTreeNodeModel> nodes = [];
      for (final org in orgs) {
        nodes.add(OuTreeNodeModel(
            content: org,
            isOpen: false,
            hasChild: await repository.orgUnitHasChildren(org.id!),
            isChecked: preselectedOrgUnits.contains(org.id),
            level: org.level ?? 0,
            selectedChildrenCount: await repository.countSelectedChildren(
                org, preselectedOrgUnits)));
      }

      orgUnitListValue = nodes;
    } catch (error) {
      print(error);
      // if (error == DomainError.accessDenied) {
      //   isSessionExpired = true;
      // } else {
      //   _surveys.subject.addError(UIError.unexpected.description);
      // }
    } finally {
      // isLoading = false;
    }
  }

  Future<List<OrganisationUnit?>> getOrgUnits(List<String> selectedOrgUnits) {
    return Future.wait(
        selectedOrgUnits.map((String id) async => repository.orgUnit(id)));
  }
}

extension PresenterListeners on OuTreeListPresenter {
  set ouChildListenerValue(Pair<int, OrganisationUnit> value) =>
      _ouChildListener.value = value;

  set onSearchListenerValue(String value) => _onSearchListener.value = value;

  set onStartSearchValue(bool value) => _onStartSearch.value = value;

  set orgUnitListValue(List<OuTreeNodeModel> orgUnits) =>
      _orgUnitList.value = orgUnits;

  void rebuildList() {
    _onRebuildList.value = !_onRebuildList.value;
  }

  Stream<Pair<int, OrganisationUnit>> get ouChildListenerStream =>
      _ouChildListener.stream.whereNotNull();

  Stream<String?> get onSearchListenerStream =>
      _onSearchListener.stream.whereNotNull();

  Stream<bool> get onStartSearchStream => _onStartSearch.stream;

  Stream<List<OuTreeNodeModel>> get orgUnitListStream => _orgUnitList.stream;

  Stream<bool> get onRebuildListStream => _onRebuildList.stream;
}
