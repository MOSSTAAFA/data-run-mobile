import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:flutter/material.dart' show Icons;

import '../../../../commons/resources/resource_manager.dart';
import '../../../../commons/ui/metadata_icon_data.dart';
import '../../../../core/common/state.dart';
import 'program_view.model.dart';

/// TODO(NMC): maybe implement in programModelProvider instead
class ProgramViewModelMapper {
  ProgramViewModelMapper(this.resourceManager);

  // final ProgramViewModelMapperRef ref;
  final ResourceManager resourceManager;

  ProgramViewModel map(
      Program program,
      int recordCount,
      String recordLabel,

      /// State
      State dirty,
      {bool hasOverdue = false,
      bool filtersAreActive = false}) {
    return ProgramViewModel(
        uid: program.id!,
        title: program.displayName!,
        metadataIconData: MetadataIconData(
            programColor: resourceManager
                .getColorOrDefaultFrom(/* program.style?.color */ null),
            iconResource: resourceManager.getObjectStyleDrawableResource(
                /* program.style()?.icon() */
                null,
                Icons.question_mark)),
        count: recordCount,
        type: program.trackedEntityType != null
            ? program.trackedEntityType!
            : null,
        typeName: recordLabel,
        programType: program.programType,
        description: program.description,
        onlyEnrollOnce: program.onlyEnrollOnce ?? false,
        // accessDataWrite:program.access().data().write(),
        dirty: program.dirty,
        // State.valueOf(state.name),
        hasOverdueEvent: hasOverdue,
        filtersAreActive: filtersAreActive,
        downloadState: ProgramDownloadState.NONE);
  }

  // fun map(
  //     dataSet: DataSet,
  //     dataSetInstanceSummary: DataSetInstanceSummary,
  //     recordCount: Int,
  //     dataSetLabel: String,
  //     filtersAreActive: Boolean
  // ): ProgramViewModel {
  //     return ProgramViewModel(
  //         uid:dataSetInstanceSummary.dataSetUid(),
  //         title:dataSetInstanceSummary.dataSetDisplayName(),
  //         metadataIconData:MetadataIconData(
  //             programColor:resourceManager.getColorOrDefaultFrom(dataSet.style()?.color()),
  //             iconResource:resourceManager.getObjectStyleDrawableResource(
  //                 dataSet.style()?.icon(),
  //                 R.drawable.ic_default_outline
  //             )
  //         ),
  //         count:recordCount,
  //         type:null,
  //         typeName:dataSetLabel,
  //         programType:"",
  //         description:dataSet.description(),
  //         onlyEnrollOnce:false,
  //         accessDataWrite:dataSet.access().data().write(),
  //         state:dataSetInstanceSummary.state(),
  //         hasOverdueEvent:false,
  //         filtersAreActive:filtersAreActive,
  //         downloadState:ProgramDownloadState.NONE
  //     )
  // }

  ProgramViewModel mapDownloadState(
      ProgramViewModel programViewModel, ProgramDownloadState downloadState) {
    return programViewModel.copyWith(downloadState: downloadState);
  }
}
