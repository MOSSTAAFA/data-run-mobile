import 'package:equatable/equatable.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';

class DashboardItemModel with EquatableMixin {
  DashboardItemModel(
      {this.uid = '',
      this.title = '',
      this.metadataIconData,
      this.type,
      this.typeName = '',
      // this.programType = '',

      /// Count of activities
      this.count = 0,
      this.progress = 0,
      this.description,
      this.accessDataWrite = true,
      this.dirty = false,
      this.hasOverdueEvent = false,
      this.filtersAreActive = false,
      this.downloadState = ProjectDownloadState.DOWNLOADED,
      this.downloadActive = false});

  final String uid;
  final String title;

  // final MetadataIconData metadataIconData;
  final MetadataIconData? metadataIconData;

  final int count;
  final double progress;
  final String? type;
  final String typeName;
  // final String programType;
  final String? description;
  final bool accessDataWrite;

  // final State state;
  final bool dirty;
  final bool hasOverdueEvent;
  final bool filtersAreActive;
  final ProjectDownloadState downloadState;
  final bool downloadActive; //: Boolean = false

  bool translucent() {
    return (filtersAreActive && count == 0) ||
        downloadState == ProjectDownloadState.DOWNLOADING;
  }

  String countDescription() => '$count $typeName';

  bool isDownloading() =>
      downloadActive || downloadState == ProjectDownloadState.DOWNLOADING;

  double getAlphaValue() => isDownloading() ? 0.5 : 1;

  DashboardItemModel copyWith(
          {final String? uid,
          String? title,
          MetadataIconData? metadataIconData,
          int? count,
          String? type,
          String? typeName,
          // String? programType,
          String? description,
          bool? onlyEnrollOnce,
          bool? accessDataWrite,
          //  State state,
          bool? dirty,
          bool? hasOverdueEvent,
          bool? filtersAreActive,
          ProjectDownloadState? downloadState,
          bool? downloadActive,
          bool? hasShownCompleteSyncAnimation}) =>
      DashboardItemModel(
          uid: uid ?? this.uid,
          title: title ?? this.title,
          metadataIconData: metadataIconData ?? this.metadataIconData,
          count: count ?? this.count,
          type: type ?? this.type,
          typeName: typeName ?? this.typeName,
          // programType: programType ?? this.programType,
          description: description ?? this.description,
          accessDataWrite: accessDataWrite ?? this.accessDataWrite,
          dirty: dirty ?? this.dirty,
          hasOverdueEvent: hasOverdueEvent ?? this.hasOverdueEvent,
          filtersAreActive: filtersAreActive ?? this.filtersAreActive,
          downloadState: downloadState ?? this.downloadState,
          downloadActive: downloadActive ?? this.downloadActive);

  @override
  List<Object?> get props => [
        uid,
        title,
        metadataIconData,
        count,
        type,
        typeName,
        // programType,
        description,
        accessDataWrite,
        dirty,
        hasOverdueEvent,
        filtersAreActive,
        downloadState,
        downloadActive
      ];
}

enum ProjectDownloadState { DOWNLOADING, DOWNLOADED, ERROR, NONE }
