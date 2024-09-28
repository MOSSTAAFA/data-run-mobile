// import 'package:expressions/expressions.dart';
//
// import 'dart:math';
//
// import 'package:fast_expressions/fast_expressions.dart';
//
// //<editor-fold desc="fast expression">
// void main22(List<String> args) {
//   {
//     const e = '1.isEven ? "Yes, 1 is even" : "No, 1 is odd"';
//     final r = parseExpression(
//       e,
//       resolve: _resolve,
//     );
//     print(r());
//   }
//
//   {
//     const e = '1 + 2 * 3';
//     final r = parseExpression(e);
//     print(r());
//   }
//
//   {
//     const e = '1 + 2 * x';
//     final r = parseExpression(
//       e,
//       context: {
//         'x': 3,
//       },
//     );
//     print(r());
//   }
//
//   {
//     const e = '1 + 2 * x[y]';
//     final r = parseExpression(
//       e,
//       context: {
//         'x': [1, 2, 3],
//         'y': 2,
//       },
//     );
//     print(r());
//   }
//
//   {
//     const e = '1 + 2 * add(1, 2)';
//     final r = parseExpression(
//       e,
//       context: {
//         'add': (num x, num y) => x + y,
//       },
//     );
//     print(r());
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
//     print(r());
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
//     print(r());
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
//     print(r());
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
//     print(r());
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
// //</editor-fold>
//
// //<editor-fold desc="expression">
// void main() {
//   // const expressionString =
//   //     "regex(x, \'^\\+?[0-9]{1,3}?[-. ]?(\\d{1,4})[-. ]?(\\d{1,4})[-. ]?(\\d{1,9})\$\')";
//   // Parse expression:
//   Expression expression = Expression.parse("'Hello '+person.name");
//   // Expression expression = Expression.parse(expressionString);
//
// // Create context containing all the variables and functions used in the expression
//   final formFieldsContext = {
//     'x': '+123-456-7890',
//     'regex': (String x, String regEx) => RegExp(regEx).hasMatch(x),
//   };
//
//   var context = {'person': new Person('Jane')};
//
// // The default evaluator can not handle member expressions like `person.name`.
// // When you want to use these kind of expressions, you'll need to create a
// // custom evaluator that implements the `evalMemberExpression` to get property
// // values of an object (e.g. with `dart:mirrors` or some other strategy).
//
//   final accessor = {
//     'name': (obj) {
//       return obj.name;
//     },
//   };
//
//   final memberAccessor = MemberAccessor(accessor);
//
//   final List<MemberAccessor> ms = [];
//   ms.add(memberAccessor);;
//
//   final evaluator = ExpressionEvaluator(memberAccessors: ms);
//   var r = evaluator.eval(expression, formFieldsContext);
//
//   print(r); // = 'Hello Jane'
// }
//
// final accessor = {
//   'name': (obj) {
//     return obj.name;
//   },
// };
//
// final memberAccessor = MemberAccessor(accessor);
//
// typedef SingleMemberAccessor3<T> = dynamic Function(T);
// typedef AnyMemberAccessor3<T> = dynamic Function(T, String member);
//
// class MyMemberAccessor<T> implements MemberAccessor<T> {
//   final Map<String, AnyMemberAccessor<T>> accessors;
//
//   const MyMemberAccessor(this.accessors);
//
//   @override
//   bool canHandle(object, String member) {
//     if (object is! T) return false;
//     if (accessors.containsKey(member)) return true;
//     return false;
//   }
//
//   @override
//   dynamic getMember(T object, String member) {
//     return accessors[member]!(object, member);
//   }
// }
//
// class Person {
//   Person(this.name);
//
//   String name;
//
//   String getName() {
//     return name;
//   }
// }
// //</editor-fold>
