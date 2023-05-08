import 'package:equatable/equatable.dart';

import '../../../../commons/ui/metadata_icon_data.dart';

class ProgramViewModel with EquatableMixin {
  ProgramViewModel({
    this.uid = '',
    this.title = '',
    this.metadataIconData,
    this.count = 0,
    this.type,
    this.typeName = '',
    this.programType = '',
    this.description,
    this.onlyEnrollOnce = true,
    this.accessDataWrite = true,
    this.dirty = false,
    this.hasOverdueEvent = false,
    this.filtersAreActive = false,
    this.downloadState = ProgramDownloadState.DOWNLOADED,
    this.downloadActive = false,
    this.hasShownCompleteSyncAnimation = false,
  });

  final String uid;
  final String title;

  // final MetadataIconData metadataIconData;
  final MetadataIconData? metadataIconData;

  final int count;
  final String? type;
  final String typeName;
  final String programType;
  final String? description;
  final bool onlyEnrollOnce;
  final bool accessDataWrite;

  // final State state;
  final bool dirty;
  final bool hasOverdueEvent;
  final bool filtersAreActive;
  final ProgramDownloadState downloadState;
  final bool downloadActive; //: Boolean = false

  /// var
  final bool hasShownCompleteSyncAnimation;

  bool hasShowCompleteSyncAnimation() => hasShownCompleteSyncAnimation;

  bool translucent() {
    return (filtersAreActive && count == 0) ||
        downloadState == ProgramDownloadState.DOWNLOADING;
  }

  String countDescription() => '$count $typeName';

  bool isDownloading() =>
      downloadActive || downloadState == ProgramDownloadState.DOWNLOADING;

  double getAlphaValue() => isDownloading() ? 0.5 : 1;

  ProgramViewModel copyWith(
          {final String? uid,
          String? title,
          MetadataIconData? metadataIconData,
          int? count,
          String? type,
          String? typeName,
          String? programType,
          String? description,
          bool? onlyEnrollOnce,
          bool? accessDataWrite,
          //  State state,
          bool? dirty,
          bool? hasOverdueEvent,
          bool? filtersAreActive,
          ProgramDownloadState? downloadState,
          bool? downloadActive,
          bool? hasShownCompleteSyncAnimation}) =>
      ProgramViewModel(
          uid: uid ?? this.uid,
          title: title ?? this.title,
          metadataIconData: metadataIconData ?? this.metadataIconData,
          count: count ?? this.count,
          type: type ?? this.type,
          typeName: typeName ?? this.typeName,
          programType: programType ?? this.programType,
          description: description ?? this.description,
          onlyEnrollOnce: onlyEnrollOnce ?? this.onlyEnrollOnce,
          accessDataWrite: accessDataWrite ?? this.accessDataWrite,
          dirty: dirty ?? this.dirty,
          hasOverdueEvent: hasOverdueEvent ?? this.hasOverdueEvent,
          filtersAreActive: filtersAreActive ?? this.filtersAreActive,
          downloadState: downloadState ?? this.downloadState,
          downloadActive: downloadActive ?? this.downloadActive,
          hasShownCompleteSyncAnimation: hasShownCompleteSyncAnimation ??
              this.hasShownCompleteSyncAnimation);

  @override
  List<Object?> get props => [
        uid,
        title,
        metadataIconData,
        count,
        type,
        typeName,
        programType,
        description,
        onlyEnrollOnce,
        accessDataWrite,
        dirty,
        hasOverdueEvent,
        filtersAreActive,
        downloadState,
        downloadActive,
        hasShownCompleteSyncAnimation
      ];
}

enum ProgramDownloadState { DOWNLOADING, DOWNLOADED, ERROR, NONE }
