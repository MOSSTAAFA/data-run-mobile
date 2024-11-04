// import 'dart:async';
//
// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
//
//
// Future<DUser?> fetchUser() async {
//  return D2Remote.authenticatedUser();
// }
//
// Stream<DUser?> monitorUserChanges(Future<DUser?> user) async* {
//   final object = await user;
//   final controller = StreamController<DUser?>();
//
//   Future.delayed(Duration(seconds: 5), () {
//     object.name = 'Updated Name';
//     controller.add(object);
//   });
//
//   yield object; // Emit the initial object
//
//   // ... continue listening to updates and emitting them
//
//   yield* controller.stream;
// }
// //
// // // Usage:
// // FutureBuilder(
// // future: fetchObject(),
// // builder: (context, snapshot) {
// // if (snapshot.hasData) {
// // return StreamBuilder<MyObject>(
// // stream: monitorObjectChanges(snapshot.data!),
// // builder: (context, snapshot) {
// // if (snapshot.hasData) {
// // final object = snapshot.data!;
// // return Text(object.name);
// // } else {
// // return CircularProgressIndicator();
// // }
// // },
// // );
// // } else {
// // return CircularProgressIndicator();
// // }
// // },
// // );
