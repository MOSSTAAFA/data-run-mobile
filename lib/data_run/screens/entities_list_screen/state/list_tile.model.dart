import 'package:mass_pro/core/common/state.dart';

class ListTileModel {
  ListTileModel(
      {required this.title, required this.summary, required this.state});

  final String title;
  final String summary;
  final SyncableEntityState state;


}
