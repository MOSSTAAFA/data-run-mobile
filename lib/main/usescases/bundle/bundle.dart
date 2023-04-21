import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bundle.g.dart';

@riverpod
class BundleObject extends _$BundleObject {
  @override
  Bundle build() {
    return Bundle();
  }

  void setValue(Bundle value) {
    state = value;
  }

  void putString(String key, String? value) {
    state = state.putString(key, value);
  }

  void putInt(String key, int? value) {
    state = state.putInt(key, value);
  }

  String? getString(String key) {
    return state.getString(key);
  }

  int? getInt(String key) {
    return state.getInt(key);
  }
}

class Bundle with EquatableMixin {
  Bundle([IMap<String, dynamic>? map])
      : bundleMap = map ?? IMap<String, dynamic>();
  IMap<String, dynamic> bundleMap;

  Bundle putString(String key, String? value) {
    bundleMap = bundleMap.add(key, value);
    return Bundle(bundleMap);
    //  Map.from(state)
    //   ..update(
    //     key,
    //     (_) => value,
    //     ifAbsent: () => value,
    //   );
  }

  Bundle putInt(String key, int? value) {
    bundleMap = bundleMap.add(key, value);
    return Bundle(bundleMap);
    // Map.from(state)
    //   ..update(
    //     key,
    //     (_) => value,
    //     ifAbsent: () => value,
    //   );
  }

  String? getString(String key) {
    return bundleMap[key];
  }

  int? getInt(String key) {
    return bundleMap[key];
  }

  @override
  List<Object?> get props => [bundleMap];
}
