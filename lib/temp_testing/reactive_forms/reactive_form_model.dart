// // Widget that uses ReactiveFormField with UserValueAccessor
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class UserFormField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveForm(
//       formGroup: FormGroup({
//         'user': FormControl<User>(value: User('John Doe', 30)),
//       }),
//       child: Column(
//         children: [
//           ReactiveFormField<User, Map<String, dynamic>>(
//             formControlName: 'user',
//             valueAccessor: UserValueAccessor(),
//             builder: (ReactiveFormFieldState<User, Map<String, dynamic>> field) {
//               return Column(
//                 children: [
//                   TextFormField(
//                     initialValue: field.value?['name'],
//                     decoration: InputDecoration(labelText: 'Name'),
//                     onChanged: (value) {
//                       final updatedValue = field.control.value;
//                       field.didChange({
//                         'name': value,
//                         'age': updatedValue?['age'],
//                       });
//                     },
//                   ),
//                   TextFormField(
//                     initialValue: field.value?['age'].toString(),
//                     decoration: InputDecoration(labelText: 'Age'),
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       final updatedValue = field.control.value;
//                       field.didChange({
//                         'name': updatedValue?['name'],
//                         'age': int.tryParse(value) ?? 0,
//                       });
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Model class
// class User {
//   final String name;
//   final int age;
//
//   User(this.name, this.age);
// }
//
// // Custom ControlValueAccessor for User
// class UserValueAccessor extends ControlValueAccessor<User, Map<String, dynamic>> {
//   @override
//   Map<String, dynamic>? modelToViewValue(User? modelValue) {
//     if (modelValue == null) return null;
//     return {'name': modelValue.name, 'age': modelValue.age};
//   }
//
//   @override
//   User? viewToModelValue(Map<String, dynamic>? viewValue) {
//     if (viewValue == null) return null;
//     return User(viewValue['name'] as String, viewValue['age'] as int);
//   }
// }
