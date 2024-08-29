import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/model/q_field.model.dart';

class SectionField extends StatefulWidget {
  const SectionField({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  State<SectionField> createState() => _SectionFieldState();
}

class _SectionFieldState extends State<SectionField> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
