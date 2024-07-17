import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:mass_pro/sdk/core/mp/enrollment/enrollment_status.dart';

import 'enrollment_service.dart';

class EnrollmentServiceImpl implements EnrollmentService {
  @override
  Future<bool> isOpen(String enrollmentUid) async {
    final Enrollment? enrollment =
        await D2Remote.trackerModule.enrollment.getOne();
    if (enrollment == null) {
      return true;
    }
    return enrollment.status.toEnrollmentStatus == EnrollmentStatus.ACTIVE;
  }

  @override
  Future<bool> allowEventCreation(
      String enrollmentUid, List<String> stagesToHide) {
    return getAllowEventCreation(enrollmentUid, stagesToHide);
  }

  @override
  Future<bool> getAllowEventCreation(
      String enrollmentUid, List<String> stagesToHide) {
    // TODO(NMC): implement getAllowEventCreation
    return Future<bool>.value(true);
  }
}
