import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked_entity_attribute_value.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_tracked_entity_attribute.entity.dart';
import 'package:dartx/dartx_io.dart';

import '../../core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
import 'enrollment_event_generator.dart';
import 'enrollment_event_generator_repository_impl.dart';

class MpEnrollmentUtils {
  const MpEnrollmentUtils();

  Future<bool> isEventEnrollmentOpen(Event event) async {
    if (event.enrollment != null) {
      final Enrollment? enrollment = await D2Remote.trackerModule.enrollment
          .byId(event.enrollment.id ?? '')
          .getOne();

      return enrollment == null ||
          enrollment.status.toEnrollmentStatus == EnrollmentStatus.ACTIVE;
    } else {
      return true;
    }
  }

  Future<bool> isTrackedEntityAttributeValueUnique(
      String uid, String? value, String teiUid) async {
    if (value == null) {
      return true;
    }

    // TrackedEntityAttribute localUid = (await D2Remote.programModule
    //     .trackedEntityAttribute.byId(uid).getOne())!;
    // d2.trackedEntityModule().trackedEntityAttributes().uid(uid).blockingGet()!!;
    final ProgramTrackedEntityAttribute localUid = (await D2Remote
        .programModule.programTrackedEntityAttribute
        .byId(uid)
        .getOne())!;
    // rp

    final isUnique = localUid.isUnique ?? false;
    final orgUnitScope = localUid.orgunitScope ?? false;

    if (!isUnique) {
      return true;
    }

    // return
    if (!orgUnitScope) {
      final hasValue =
          (await getTrackedEntityAttributeValues(uid, value, teiUid))
              .isNotEmpty;
      return !hasValue;
    } else {
      // TODO(NMC): add Activity
      final String? enrollingOrgUnit = await getOrgUnit(teiUid);

      // var hasValue = getTrackedEntityAttributeValues(uid, value, teiUid)
      //     .map {
      // getOrgUnit(it.trackedEntityInstance()!!)
      // }
      //     .all { it != enrollingOrgUnit }
      // return hasValue;
      // rp
      final List<TrackedEntityAttributeValue> teavs =
          await getTrackedEntityAttributeValues(uid, value, teiUid);
      bool hasValue = false;
      for (final teav in teavs) {
        final String? orgUnit = await getOrgUnit(teav.trackedEntityInstance!);
        hasValue = enrollingOrgUnit == orgUnit;
        break;
      }

      return !hasValue;
    }
  }

  Future<Pair<String, String?>> generateEnrollmentEvents(
      String enrollmentUid) async {
    return const EnrollmentEventGenerator(
            EnrollmentEventGeneratorRepositoryImpl())
        .generateEnrollmentEvents(enrollmentUid);
  }

  Future<String?> getOrgUnit(String teiUid) async {
    return (await D2Remote.trackerModule.trackedEntityInstance
            .byId(teiUid)
            .getOne())
        ?.orgUnit;
  }

  Future<List<TrackedEntityAttributeValue>> getTrackedEntityAttributeValues(
      String uid, String value, String teiUid) async {
    return await D2Remote.trackerModule.trackedEntityAttributeValue
        .resetFilters()
        .byAttribute(uid)
        .whereNeq(attribute: 'trackedEntityInstance', value: teiUid)
        .where(attribute: 'value', value: value)
        .get();
  }
}
