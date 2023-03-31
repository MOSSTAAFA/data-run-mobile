import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/shared/utilities/dhis_uid_generator.util.dart';
import 'package:mass_pro/core/arch/handlers/transformer.dart';

EventProjectionBuilder get _eventProjectionBuilder => EventProjectionBuilder();

class EventCreateProjection {
  EventCreateProjection._builder(EventProjectionBuilder builder)
      : _enrollment = builder.enrollment,
        // program = builder.program!,
        _programStage = builder.programStage!,
        _organisationUnit = builder.organisationUnit!,
        _activity = builder.activity!;
  final String? _enrollment;

  // final String program;
  final String _programStage;
  final String _organisationUnit;
  final String _activity;

  static const Transformer _transformer = _EventTransformer();

  Event _transform() => _transformer.transform(this);

  static EventProjectionBuilder builder() => _eventProjectionBuilder;
}

class EventProjectionBuilder {
  EventProjectionBuilder();

  String? enrollment;

  // String? program;
  String? programStage;
  String? organisationUnit;
  String? activity;
  String? status;

  Event build() {
    // assert(program != null, 'program: Cannot be null');
    assert(programStage != null, 'programStage: Cannot be null');
    assert(organisationUnit != null, 'organisationUnit: Cannot be null');
    assert(activity != null, 'activity: Cannot be null');
    return EventCreateProjection._builder(this)._transform();
  }
}

class _EventTransformer implements Transformer<EventCreateProjection, Event> {
  const _EventTransformer();

  @override
  Event transform(EventCreateProjection projection) {
    // String generatedUid = DhisUidGenerator.generate();
    final String creationDate = DateTime.now().toIso8601String().split('.')[0];

    return Event(
        id: DhisUidGenerator.generate(),
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
