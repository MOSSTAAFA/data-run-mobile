import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../form/model/form_repository_records.dart';

// part 'bundle.g.dart';

// @riverpod
// class BundleObject extends _$BundleObject {
//   @override
//   Bundle build() {
//     logInfo(info: '######## BundleObject is Created');
//
//     ref.onDispose(() {
//       logInfo(info: '######## BundleObject is disposed');
//     });
//
//     ref.onCancel(() => logInfo(info: 'cancel: $state'));
//     ref.onResume(() => logInfo(info: 'resume: $state'));
//     ref.onDispose(() => logInfo(info: 'dispose: $state'));
//
//     // get the [KeepAliveLink]
//     // final link = ref.keepAlive();
//
//     return Bundle();
//   }
//
//   void setValue(Bundle value) {
//     state = value;
//   }
//
//   void putString(String key, String? value) {
//     state = state.putString(key, value);
//   }
//
//   void putInt(String key, int? value) {
//     state = state.putInt(key, value);
//   }
//
//   String? getString(String key) {
//     return state.getString(key);
//   }
//
//   int? getInt(String key) {
//     return state.getInt(key);
//   }
// }

class Bundle with EquatableMixin {
  Bundle([IMap<String, dynamic>? map, FormRepositoryRecords? repositoryRecords])
      : bundleMap = IMap.orNull(map?.unlock) ?? IMap<String, dynamic>(),
        formRepositoryRecords = repositoryRecords;
  IMap<String, dynamic> bundleMap;
  FormRepositoryRecords? formRepositoryRecords;

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

  Bundle putObject(String key, Object? value) {
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

  Object? getObject(String key) {
    return bundleMap[key];
  }

  FormRepositoryRecords? getRepositoryRecords() {
    return formRepositoryRecords;
  }

  @override
  List<Object?> get props => [bundleMap, formRepositoryRecords];
}
