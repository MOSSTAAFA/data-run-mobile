import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'program_uid_provider.g.dart';

@riverpod
class ProgramUid extends _$ProgramUid {
  @override
  String? build() {
    return null;
  }

  void setValue(String value) {
    state = value;
  }
}
