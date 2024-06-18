import 'package:equatable/equatable.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';

class ProjectDetailItemModel with EquatableMixin {
  ProjectDetailItemModel({
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
    required this.state,
    this.hasOverdueEvent = false,
    this.filtersAreActive = false,
    this.downloadState = ProjectDownloadState.DOWNLOADED,
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

  final State state;
  final bool dirty;
  final bool hasOverdueEvent;
  final bool filtersAreActive;
  final ProjectDownloadState downloadState;
  final bool downloadActive; //: Boolean = false

  /// var
  final bool hasShownCompleteSyncAnimation;

  bool hasShowCompleteSyncAnimation() => hasShownCompleteSyncAnimation;

  bool translucent() {
    return (filtersAreActive && count == 0) ||
        downloadState == ProjectDownloadState.DOWNLOADING;
  }

  String countDescription() => '$count $typeName';

  bool isDownloading() =>
      downloadActive || downloadState == ProjectDownloadState.DOWNLOADING;

  double getAlphaValue() => isDownloading() ? 0.5 : 1;

  ProjectDetailItemModel copyWith(
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
          State? state,
          bool? dirty,
          bool? hasOverdueEvent,
          bool? filtersAreActive,
          ProjectDownloadState? downloadState,
          bool? downloadActive,
          bool? hasShownCompleteSyncAnimation}) =>
      ProjectDetailItemModel(
          uid: uid ?? this.uid,
          title: title ?? this.title,
          metadataIconData: metadataIconData ?? this.metadataIconData,
          count: count ?? this.count,
          type: type ?? this.type,
          state: state ?? this.state,
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
        state,
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
