import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ScannedItemDetailsWidget extends StatelessWidget {
  const ScannedItemDetailsWidget({
    Key? key,
    required this.itemForm,
  }) : super(key: key);

  final FormGroup itemForm;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: itemForm,
      child: ReactiveValueListenableBuilder<Gs1ScannedItem>(
        builder: (BuildContext context, AbstractControl<Gs1ScannedItem> control,
            Widget? child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Scanned Item Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text('GTIN: ${control.value?.gtin ?? '-'}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Production Date: ${control.value?.productionDate != null ? DateFormat('yyyy-MM-dd').format(control.value!.productionDate!) : '-'}'),
                    Text('Batch/Lot: ${control.value?.batchLot ?? '-'}'),
                    Text('Serial: ${control.value?.serialNumber ?? '-'}'),
                    Text(
                        'Type: ${control.value?.isBundle != null ? control.value!.isBundle ? 'Bundle' : 'Single Item' : '-'}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text('Quantity:'),
                    SizedBox(width: 8),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'count',
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Quantity',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
