import 'package:equatable/equatable.dart';
import 'package:mass_pro/core/common/state.dart';

class SubmissionStatusModel with EquatableMixin {
  const SubmissionStatusModel({
    this.toPost = 0,
    this.toUpdate = 0,
    this.synced = 0,
    this.withError = 0,
  });

  final int toPost;
  final int toUpdate;
  final int synced;
  final int withError;

  SyncableEntityState get syncStatus => switch (this) {
        SubmissionStatusModel(:final int withError) when withError > 0 =>
          SyncableEntityState.ERROR,
        SubmissionStatusModel(:final int toPost) when toPost > 0 =>
          SyncableEntityState.TO_POST,
        _ => SyncableEntityState.SYNCED,
      };

  @override
  List<Object?> get props => [toPost, toUpdate, synced, withError];
}
