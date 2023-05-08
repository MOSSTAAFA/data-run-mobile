import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/extensions/dynamic_extensions.dart';

part 'bundle.g.dart';

@riverpod
class BundleObject extends _$BundleObject {
  @override
  Bundle build() {
    logInfo(info: '######## BundleObject is Created');

    ref.onDispose(() {
      logInfo(info: '######## BundleObject is disposed');
    });

    ref.onCancel(() =>  logInfo(info: 'cancel: $state'));
    ref.onResume(() =>  logInfo(info: 'resume: $state'));
    ref.onDispose(() =>  logInfo(info: 'dispose: $state'));

    // get the [KeepAliveLink]
    // final link = ref.keepAlive();


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
      : bundleMap = IMap.orNull(map?.unlock) ?? IMap<String, dynamic>();
  IMap<String, dynamic> bundleMap;

  Bundle putString(String key, String? value) {
    bundleMap = bundleMap.add(key, value);
    return Bundle(bundleMap);
  }

  Bundle putInt(String key, int? value) {
    bundleMap = bundleMap.add(key, value);
    return Bundle(bundleMap);
  }

  Bundle putBool(String key, bool? value) {
    bundleMap = bundleMap.add(key, value);
    return Bundle(bundleMap);
  }

  String? getString(String key) {
    return bundleMap[key];
  }

  int? getInt(String key) {
    return bundleMap[key];
  }

  bool? getBool(String key) {
    return bundleMap[key];
  }

  @override
  List<Object?> get props => [bundleMap];
}
