// import 'package:mass_pro/sdk/core/d2_remote_configuration.dart';
// import 'package:mass_pro/sdk/d2_remote.dart';
//
// class D2RemoteManager {
//   D2Remote? D2Remote;
//
//   static final D2RemoteManager _instance = D2RemoteManager._internal();
//
//   // using a factory is important
//   // because it promises to return _an_ object of this type
//   // but it doesn't promise to make a new one.
//   factory D2RemoteManager() {
//     return _instance;
//   }
//
//   // This named constructor is the "real" constructor
//   // It'll be called exactly once, by the static property assignment above
//   // it's also private, so it can only be called in this class
//   D2RemoteManager._internal() {
//     // initialization logic
//   }
//
//   D2Remote? getD2Remote() {
//     if (D2Remote == null) throw Exception("D2Remote is not instantiated yet");
//     return D2Remote;
//   }
//
//   bool isD2Instantiated() {
//     return D2Remote != null;
//   }
//
//   Future<D2Remote> instantiateD2Remote(D2RemoteConfiguration d2Config) {
//     return D2Remote.logIn(username: username, password: password, url: url)
//   }
// }
