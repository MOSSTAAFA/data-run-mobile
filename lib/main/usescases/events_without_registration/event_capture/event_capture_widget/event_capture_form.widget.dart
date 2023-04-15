import 'package:flutter/material.dart';

import 'event_capture_form_view.dart';

class EventCaptureForm extends StatefulWidget {
  const EventCaptureForm({super.key});

  @override
  State<EventCaptureForm> createState() => _EventCaptureFormState();
}

class _EventCaptureFormState extends State<EventCaptureForm>
    with EventCaptureFormView {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void hideSaveButton() {
    // TODO: implement hideSaveButton
  }

  @override
  void onReopen() {
    // TODO: implement onReopen
  }

  @override
  void performSaveClick() {
    // TODO: implement performSaveClick
  }

  @override
  void showSaveButton() {
    // TODO: implement showSaveButton
  }
}
