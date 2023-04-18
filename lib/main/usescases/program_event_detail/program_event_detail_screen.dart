import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/main/usescases/program_event_detail/program_event_detail_contract.dart';

import '../general/view_Base.dart';

/// ProgramEventDetailActivity
class ProgramEventDetailScreen extends StatefulWidget {
  const ProgramEventDetailScreen({super.key});

  @override
  State<ProgramEventDetailScreen> createState() =>
      _ProgramEventDetailScreenState();
}

class _ProgramEventDetailScreenState extends State<ProgramEventDetailScreen>
    with ProgramEventDetailView, ViewBase {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void hideFilters() {
    // TODO: implement hideFilters
  }

  @override
  void navigateToEvent(String eventId, String orgUnit) {
    // TODO: implement navigateToEvent
  }

  @override
  void openOrgUnitTreeSelector() {
    // TODO: implement openOrgUnitTreeSelector
  }

  @override
  void renderError(String message) {
    // TODO: implement renderError
  }

  @override
  void setProgram(Program programModel) {
    // TODO: implement setProgram
  }

  @override
  void setWritePermission(bool aBoolean) {
    // TODO: implement setWritePermission
  }

  @override
  void showCatOptComboDialog(String catComboUid) {
    // TODO: implement showCatOptComboDialog
  }

  @override
  void showFilterProgress() {
    // TODO: implement showFilterProgress
  }

  @override
  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  void startNewEvent() {
    // TODO: implement startNewEvent
  }

  @override
  void updateFilters(int totalFilters) {
    // TODO: implement updateFilters
  }
}
