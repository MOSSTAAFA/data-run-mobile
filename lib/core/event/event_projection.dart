import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:mass_pro/core/arch/handlers/transformer.dart';

EventProjectionBuilder get _eventProjectionBuilder => EventProjectionBuilder();

class EventCreateProjection {
  final String? _enrollment;

  // final String program;
  final String _programStage;
  final String _organisationUnit;
  final String _activity;

  static const Transformer _transformer = _EventTransformer();

  EventCreateProjection._builder(EventProjectionBuilder builder)
      : _enrollment = builder.enrollment,
        // program = builder.program!,
        _programStage = builder.programStage!,
        _organisationUnit = builder.organisationUnit!,
        _activity = builder.activity!;

  Event _transform() => _transformer.transform(this);

  static EventProjectionBuilder builder() => _eventProjectionBuilder;
}

class EventProjectionBuilder {
  String? enrollment;

  // String? program;
  String? programStage;
  String? organisationUnit;
  String? activity;
  String? status;

  EventProjectionBuilder();

  Event build() {
    // if (program == null) throw ArgumentError('program: Cannot be null');
    if (programStage == null) {
      throw ArgumentError('programStage: Cannot be null');
    }
    if (organisationUnit == null) {
      throw ArgumentError('organisationUnit: Cannot be null');
    }
    if (activity == null) throw ArgumentError('activity: Cannot be null');
    return EventCreateProjection._builder(this)._transform();
  }
}

class _EventTransformer implements Transformer<EventCreateProjection, Event> {
  const _EventTransformer();

  @override
  Event transform(EventCreateProjection projection) {
    // String generatedUid = DhisUidGenerator.generate();
    String creationDate = DateTime.now().toIso8601String().split('.')[0];

    return Event(
        activity: projection._activity,
        enrollment: projection._enrollment,
        orgUnit: projection._organisationUnit,
        programStage: projection._programStage,
        status: 'ACTIVE',
        created: creationDate,
        lastUpdated: creationDate,
        createdAtClient: creationDate,
        lastUpdatedAtClient: creationDate,
        deleted: false,
        dirty: true,
        synced: false);
  }
}
