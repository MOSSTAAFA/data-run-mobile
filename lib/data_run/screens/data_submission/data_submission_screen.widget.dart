import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.provider.dart';
import 'package:mass_pro/data_run/screens/data_submission/strategy/activity_type.dart';
import 'package:mass_pro/data_run/screens/data_submission/strategy/form_creation_strategy/form_creation_strategy.provider.dart';

class DataSubmissionScreen extends ConsumerStatefulWidget {
  DataSubmissionScreen({super.key});

  @override
  ConsumerState<DataSubmissionScreen> createState() =>
      _DataSubmissionScreenState();
}

class _DataSubmissionScreenState extends ConsumerState<DataSubmissionScreen> {
  late final DActivity activity;
  late final ActivityType activityType;
  late final DTeam team;

  @override
  Widget build(BuildContext context) {
    final formStrategy = ref.watch(formCreationStrategyProvider);
    final repository = ref.watch(activityDataRepositoryProvider);

    final formFields = formStrategy.createFormFields();

    return Scaffold(
      appBar: AppBar(title: Text('Submit Data for ${activity.name}')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              // Generate form fields dynamically (similar to previous examples)
              // For example:
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
              ),
              // More fields...
              ElevatedButton(
                onPressed: () {
                  // Collect form data
                  Map<String, dynamic> formData = {
                    'location': 'Some Location',
                    'numberDistributed': 100,
                    'date': '2023-12-01',
                  };

                  // Adapt form data
                  // final adaptedData = adapter.adapt(formData);

                  // Save data using the context
                  // repository.saveData(adaptedData);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
