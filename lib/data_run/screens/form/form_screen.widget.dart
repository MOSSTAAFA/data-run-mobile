import 'package:fast_immutable_collections/src/ilist/ilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/screens/form/form_field.widget.dart';

class FormScreen extends ConsumerStatefulWidget {
  const FormScreen({super.key});

  @override
  ConsumerState<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<FormScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  // final GlobalKey<FormBuilderState> _listKey = GlobalKey<FormBuilderState>();

@override
  Widget build(BuildContext context) {
    final fields = ref.watch(formInputFieldsListNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Form')),
      body: fields.maybeWhen(
        data: (IList<FormFieldModel> data) {
          return Stack(children: [
            FormBuilder(
              onPopInvoked: (bool value) {
                /// show confirm, save, complete
              } ,
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
                // Map<String, dynamic> representing all fields
                ///{visitDate: 2024-06-25 00:00:00.000, patientName: , patientAge: , patientLocation: , gender: Male, testResult: null, detectionType: null, severity: null, treatment: null}
                debugPrint('form _formKey State Changed: ${_formKey.currentState!.value.toString()}');
                // debugPrint('form _listKey State Changed: ${_listKey.currentState!.value.toString()}');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  // key: _listKey,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: FormFieldWidget(
                        fieldModel: data[index],
                        fieldModelIndex: index,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (fields.isLoading)
              const Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
          ]);
        },
        error: (Object e, _) => Center(
          child: Text(
            e.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.red),
          ),
        ),
        orElse: () {},
      ),
    );
  }
}
