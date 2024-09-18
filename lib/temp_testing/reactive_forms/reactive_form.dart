// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form/form.dart';
// import 'package:mass_pro/data_run/form_reactive/form_service.dart';
// import 'package:mass_pro/data_run/form_reactive/rule/rule_engine.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class ReactiveFormExample extends StatefulWidget {
//   const ReactiveFormExample({super.key});
//
//   @override
//   createState() => _ReactiveFormExampleState();
// }
//
// class _ReactiveFormExampleState extends State<ReactiveFormExample> {
//   // late final FormPresenter presenter;
//
//   // final _form = FormGroup({
//   //   'nickname': FormControl<String>(
//   //     validators: [
//   //       Validators.required,
//   //       Validators.minLength(3),
//   //       Validators.pattern(r'^([^\x00-\x7F]|[\w_\.\-]){3,16}$'),
//   //     ],
//   //   ),
//   //   'email': FormControl<String>(
//   //     validators: [
//   //       Validators.required,
//   //       Validators.email,
//   //     ],
//   //   ),
//   //   'comment': FormControl<String>(),
//   //   'termsAccepted': FormControl<bool>(
//   //     validators: [
//   //       Validators.requiredTrue,
//   //     ],
//   //   ),
//   // });
//
//   @override
//   void initState() {
//     final ruleEngine =
//         RuleEngine(FormConfiguration(form: '', label: '', version: 1), rules: {
//       'age': (formGroup) {
//         if (formGroup.control('age').value == 2) {
//           formGroup.setErrors({'tooYoung': true});
//         }
//
//         final control = formGroup.control('age');
//         final value = control.value;
//         if (value == null) {
//           // Assign 20% discount for seniors
//         } else if (value > 60) {
//           formGroup
//               .control('discount')
//               .updateValue(80); // No discount for others
//         } else if (value == 3) {
//           formGroup
//               .control('discount')
//               .markAsDisabled(); // No discount for others
//         } else {
//           formGroup.control('discount').markAsEnabled();
//           // formGroup
//           //     .control('discount')
//           //     .updateValue(0); // No discount for others
//         }
//       },
//       'email': (formGroup) {
//         final value = formGroup.control('email').value;
//         if (value != null && value.contains('@example.com') == true) {
//           formGroup.setErrors({'invalidDomain': true});
//         }
//       },
//     });
//
//     // final FormService service = FormService(LocalRepository());
//     // presenter = FormPresenter(service, ruleEngine);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     presenter.onDispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reactive Form Example'),
//       ),
//       body: ReactiveForm(
//         formGroup: presenter.formGroup,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 16,
//             horizontal: 24,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 ReactiveTextField<String>(
//                   key: const Key('name'),
//                   formControlName: 'name',
//                   decoration: const InputDecoration(
//                     label: Text('name'),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                   validationMessages: {
//                     'tooYoung': (error) => '$error: tooYoung error',
//                     ValidationMessage.requiredTrue: (error) =>
//                         '$error: requiredTrue error',
//                   },
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveTextField<int>(
//                   key: const Key('age'),
//                   formControlName: 'age',
//                   decoration: const InputDecoration(
//                     label: Text('age'),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                   validationMessages: {
//                     'tooYoung': (error) => '$error: tooYoung error',
//                     ValidationMessage.requiredTrue: (error) =>
//                         '$error: requiredTrue error',
//                   },
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveTextField<int>(
//                   key: const Key('discount'),
//                   formControlName: 'discount',
//                   decoration: const InputDecoration(
//                     label: Text('discount'),
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveTextField<String>(
//                   key: const Key('email'),
//                   formControlName: 'email',
//                   decoration: const InputDecoration(
//                     label: Text('Email'),
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                   validationMessages: {
//                     ValidationMessage.required: (error) =>
//                         '$error: Please enter some text',
//                     'invalidDomain': (error) => '$error: Please valid domain',
//                   },
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 ReactiveFormConsumer(
//                   key: const Key('submit'),
//                   builder: (context, form, _) => ElevatedButton(
//                     onPressed: () {
//                       presenter.onSubmit();
//                       // if (form.valid) {
//                       //   ScaffoldMessenger.of(context).showSnackBar(
//                       //     const SnackBar(
//                       //       content: Text('Processing Data'),
//                       //       backgroundColor: Colors.greenAccent,
//                       //     ),
//                       //   );
//                       // }
//                     },
//                     child: const Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
