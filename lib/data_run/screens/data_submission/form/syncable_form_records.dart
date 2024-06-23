import 'package:equatable/equatable.dart';

class SyncableFormRecords with EquatableMixin {
  const SyncableFormRecords({required this.uid, required this.formCode});

  final String uid;
  final String formCode;

  @override
  List<Object?> get props => [uid, formCode];
}
