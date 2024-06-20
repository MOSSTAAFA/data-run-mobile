import 'package:equatable/equatable.dart';
import 'package:mass_pro/data_run/utils/activity_type.dart';

class SyncableFormRecords with EquatableMixin {
  const SyncableFormRecords({required this.uid, required this.activityType});

  final String uid;
  final ActivityType activityType;

  @override
  List<Object?> get props => [uid, activityType];
}
