// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class FormElementBuilder<T extends FormElementInstance<dynamic>> extends StatelessWidget {
//   const FormElementBuilder({
//     required this.builder,
//     required this.element,
//     this.child,
//   });
//
//   final Widget Function(BuildContext context, T element) builder;
//   final T element;
//   final Widget? child;
//
//   @override
//   Widget build(BuildContext context) {
//     return builder(context, element);
//   }
// }
//
// class FormElementConsumer<T> extends StatelessWidget {
//   const FormElementConsumer({
//     required this.builder,
//     required this.element,
//     this.child,
//   });
//
//   final Widget Function(BuildContext context, T element) builder;
//   final T element;
//   final Widget? child;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return builder(context, element);
//   }
// }
//
// // create form based on generated widget
// final form = UserProfileFormBuilder(
//   model: UserProfile(),
//   builder: (context_, formModel_, child_) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ReactiveTextField<String>(
//             formControl: formModel.firstNameControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             decoration: const InputDecoration(
//               labelText: 'First name',
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           ReactiveTextField<String>(
//             formControl: formModel.lastNameControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             decoration: const InputDecoration(
//               labelText: 'Last name',
//             ),
//           ),
//           const SizedBox(height: 24.0),
//           Text('Home address', style: TextStyle(fontSize: 18)),
//           ReactiveTextField<String>(
//             formControl: formModel.homeForm.cityControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             decoration: const InputDecoration(
//               labelText: 'Home city',
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           ReactiveTextField<String>(
//             formControl: formModel.homeForm.streetControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             decoration: const InputDecoration(
//               labelText: 'Home street',
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           ReactiveTextField<String>(
//             formControl: formModel.homeForm.zipControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             textInputAction: TextInputAction.done,
//             decoration: const InputDecoration(
//               labelText: 'Home zip',
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           Text('Office address', style: TextStyle(fontSize: 18)),
//           const SizedBox(height: 8.0),
//           ReactiveTextField<String>(
//             formControl: formModel.officeForm.cityControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             decoration: const InputDecoration(
//               labelText: 'Office city',
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           ReactiveTextField<String>(
//             formControl: formModel.officeForm.streetControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             decoration: const InputDecoration(
//               labelText: 'Office street',
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           ReactiveTextField<String>(
//             formControl: formModel.officeForm.zipControl,
//             validationMessages: {
//               ValidationMessage.required: (_) => 'Must not be empty',
//             },
//             decoration: const InputDecoration(
//               labelText: 'Office zip',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (formModel.form.valid) {
//                 print(formModel.model);
//               } else {
//                 formModel.form.markAllAsTouched();
//               }
//             },
//             child: const Text('Sign Up'),
//           ),
//           ReactiveUserProfileFormConsumer(
//             builder: (context, form, child) {
//               return ElevatedButton(
//                 child: Text('Submit'),
//                 onPressed: form.form.valid
//                     ? () {
//                   print(form.model.firstName);
//                   print(form.model.lastName);
//                 }
//                     : null,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   },
// );