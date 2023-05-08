import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../enrollment/enrollment_service.dart';
import '../enrollment/enrollment_service_impl.dart';
import '../event/event_service.dart';
import '../event/event_service_impl.dart';

part 'providers.g.dart';

@riverpod
EnrollmentService enrollmentService(EnrollmentServiceRef ref) {
  return EnrollmentServiceImpl();
}

@riverpod
EventService eventService(EventServiceRef ref) {
  return const EventServiceImpl();
}
