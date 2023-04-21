import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class Bundle {
  Bundle() : state = IMap<String, dynamic>({});
  IMap<String, dynamic> state;

  void putString(String key, String? value) {
    state = state.add(key, value);
    //  Map.from(state)
    //   ..update(
    //     key,
    //     (_) => value,
    //     ifAbsent: () => value,
    //   );
  }

  void putInt(String key, int? value) {
    state = state.add(key, value);
    // Map.from(state)
    //   ..update(
    //     key,
    //     (_) => value,
    //     ifAbsent: () => value,
    //   );
  }

  String? getString(String key) {
    return state[key];
  }

  int? getInt(String key) {
    return state[key];
  }
}
