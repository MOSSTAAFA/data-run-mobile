// import 'dart:math';
//
// import 'package:fast_expressions/fast_expressions.dart';
//
// void validateField(String expression, Map<String, dynamic> formFields) {
//   final r = parseExpression(
//     expression,
//     context: formFields,
//     resolve: (object, member) => formFields[member],
//   );
//
//   // print(r()); // Evaluate the expression and print the result (true or false)
// }
//
// void main() {
//   {
//     const e =
//         "hasMatch(x, '^\\+?[0-9]{1,3}?[-. ]?(\\d{1,4})[-. ]?(\\d{1,4})[-. ]?(\\d{1,9})\$')";
//     final r = parseExpression(
//       e,
//       context: {
//         'x': '+123-456-7890',
//         'hasMatch': (String x, String regEx) => RegExp(regEx).hasMatch(x),
//       },
//     );
//     // print(r());
//   }
//
//   {
//     const e = '1 + 2 * foo.add(1, 2)';
//     final r = parseExpression(
//       e,
//       context: {
//         'foo': Foo(),
//       },
//       resolve: _resolve,
//     );
//     // print(r());
//   }
//
//   {
//     const e = '1 + 2 * foo.list()[foo.add(1, 1)]';
//     final r = parseExpression(
//       e,
//       context: {
//         'foo': Foo(),
//       },
//       resolve: _resolve,
//     );
//     // print(r());
//   }
//
//   {
//     const e = '1 + 2 * sub(x: 7, y: 4)';
//     final r = parseExpression(
//       e,
//       context: {
//         'sub': ({required num x, required num y}) => x - y,
//       },
//     );
//     // print(r());
//   }
//
//   {
//     const e = '''
// "Hello, " + friends[random()].name
// ''';
//     final friends = [
//       Person('Jack'),
//       Person('Jerry'),
//       Person('John'),
//     ];
//     final r = parseExpression(
//       e,
//       context: {
//         'friends': friends,
//         'random': () => Random().nextInt(friends.length - 1),
//       },
//       resolve: _resolve,
//     );
//     // print(r());
//   }
// }
//
// dynamic _resolve(dynamic object, String member) {
//   Never error() {
//     throw StateError("Invalid member '$member', object is $object");
//   }
//
//   if (object is Foo) {
//     switch (member) {
//       case 'add':
//         return object.add;
//       case 'list':
//         return object.list;
//     }
//   }
//
//   if (object is Person) {
//     switch (member) {
//       case 'name':
//         return object.name;
//     }
//   }
//
//   if (object is int) {
//     switch (member) {
//       case 'isEven':
//         return object.isEven;
//     }
//   }
//
//   error();
// }
//
// class Foo {
//   num add(num x, num y) => x + y;
//
//   List<num> list() => [1, 2, 3];
// }
//
// class Person {
//   Person(this.name);
//
//   final String name;
// }
