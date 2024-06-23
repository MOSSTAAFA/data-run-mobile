import 'package:equatable/equatable.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/core/common/state.dart';

class ActivityFormItemModel with EquatableMixin {
  ActivityFormItemModel(
      {this.uid = '',
      this.title = '',
      this.metadataIconData,
      this.count = 0,
      this.activityType = '',
      this.description,
      this.dirty = false,
      required this.state});

  final String uid;
  final String title;

  // final MetadataIconData metadataIconData;
  final MetadataIconData? metadataIconData;

  final int count;
  final String activityType;
  final String? description;

  final SyncableEntityState state;
  final bool dirty;

  String countDescription() => '$count $title';

  ActivityFormItemModel copyWith(
          {final String? uid,
          String? title,
          MetadataIconData? metadataIconData,
          int? count,
          String? activityType,
          String? description,
          SyncableEntityState? state,
          bool? dirty}) =>
      ActivityFormItemModel(
          uid: uid ?? this.uid,
          title: title ?? this.title,
          metadataIconData: metadataIconData ?? this.metadataIconData,
          count: count ?? this.count,
          state: state ?? this.state,
          activityType: activityType ?? this.activityType,
          description: description ?? this.description,
          dirty: dirty ?? this.dirty);

  @override
  List<Object?> get props => [
        uid,
        title,
        metadataIconData,
        count,
        state,
        activityType,
        description,
        dirty,
      ];
}
