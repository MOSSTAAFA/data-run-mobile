
import 'package:expressions/expressions.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {

  const expressionString = "regex(x, \'^\\+?[0-9]{1,3}?[-. ]?(\\d{1,4})[-. ]?(\\d{1,4})[-. ]?(\\d{1,9})\$\')";
  // Parse expression:
  // Expression expression = Expression.parse("'Hello '+person.name");
  Expression expression = Expression.parse(expressionString);

// Create context containing all the variables and functions used in the expression
  final formFieldsContext = {
    'x': '+123-456-7890',
    'regex': (String x, String regEx) => RegExp(regEx).hasMatch(x),
  };

  var context = {
    "person": new Person("Jane")
  };

// The default evaluator can not handle member expressions like `person.name`.
// When you want to use these kind of expressions, you'll need to create a
// custom evaluator that implements the `evalMemberExpression` to get property
// values of an object (e.g. with `dart:mirrors` or some other strategy).
  final evaluator = const ExpressionEvaluator();
  var r = evaluator.eval(expression, formFieldsContext);

  List<MemberAccessor> memberAccessors;

  print(r); // = 'Hello Jane'

}

final fg =  fb.group({
  'name': FormControl<String>(),
  'age': FormControl<int>(value: 0),
  'discount': FormControl<int>(),
  'email': FormControl<String>(),
});

final List<String> Sections = ['mainSection', 'stockItems'];
final List<String> fields = ['mainSection.age', 'stockItems.price'];
final accessor = {
  'name': (obj){},
};

final memberAccessor = MemberAccessor(accessor);

typedef SingleMemberAccessor3<T> = dynamic Function(T);
typedef AnyMemberAccessor3<T> = dynamic Function(T, String member);

class MyMemberAccessor<T> implements MemberAccessor<T> {
  final Map<String, AnyMemberAccessor<T>> accessors;

  const MyMemberAccessor(this.accessors);

  @override
  bool canHandle(object, String member) {
    if (object is! T) return false;
    if (accessors.containsKey(member)) return true;
    return false;
  }

  @override
  dynamic getMember(T object, String member) {
    return accessors[member]!(object, member);
  }
}

class Person {
  Person(this.name);

  String name;

  String getName() {
    return name;
  }
}