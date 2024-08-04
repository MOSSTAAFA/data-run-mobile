// ignore_for_file: strict_raw_type

import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';

import 'package:mass_pro/core/arch/handlers/transformer.dart';

EnrollmentProjectionBuilder get _enrollmentProjectionBuilder =>
    EnrollmentProjectionBuilder();

class EnrollmentCreateProjection {
  EnrollmentCreateProjection._builder(EnrollmentProjectionBuilder builder)
      : _program = builder.program!,
        _organisationUnit = builder.organisationUnit!,
        _activity = builder.activity!,
        _trackedEntityType = builder.trackedEntityType!;
  final String _program;
  final String _organisationUnit;
  final String _activity;
  final String _trackedEntityType;

  static const Transformer _transformer = _EnrollmentTransformer();

  Enrollment _transform() => _transformer.transform(this);

  static EnrollmentProjectionBuilder builder() => _enrollmentProjectionBuilder;
}

class EnrollmentProjectionBuilder {
  EnrollmentProjectionBuilder();

  String? program;
  String? organisationUnit;
  String? activity;
  String? trackedEntityType;

  Enrollment build() {
    assert(program != null, 'program: Cannot be null');
    assert(organisationUnit != null, 'organisationUnit: Cannot be null');
    assert(activity != null, 'activity: Cannot be null');
    assert(trackedEntityType != null, 'trackedEntityType: Cannot be null');

    return EnrollmentCreateProjection._builder(this)._transform();
  }
}

class _EnrollmentTransformer
    implements Transformer<EnrollmentCreateProjection, Enrollment> {
  const _EnrollmentTransformer();

  @override
  Enrollment transform(EnrollmentCreateProjection projection) {
    // String generatedUid = DhisUidGenerator.generate();
    final String creationDate = DateUtils.databaseDateFormat().format(DateTime.now().toUtc());

    return Enrollment(
        activity: projection._activity,
        orgUnit: projection._organisationUnit,
        program: projection._program,
        trackedEntityType: projection._trackedEntityType,
        createdDate: creationDate,
        lastModifiedDate: creationDate,
        createdAtClient: creationDate,
        lastUpdatedAtClient: creationDate,
        // deleted: false,
        status: 'ACTIVE',
        dirty: true,
        synced: false);
  }
}
