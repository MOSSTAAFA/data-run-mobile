import 'package:mass_pro/data_run/screens/form/element/dependency/form_dependency_register.dart';
import 'package:mass_pro/data_run/screens/form/element/dependency/form_events/form_event.dart';
import 'package:mass_pro/data_run/screens/form/element/dependency/form_events/form_event_dispatcher.dart';

/// a global event bus to publish and subscribe to events.
/// - get the dependency graph sorted,
/// - dispatch the event and managing when,
/// - prevent circular dependency
// class FormEventBus {
//
//   final FormDependencyRegister _dependencyRegister;
//   // eventBus.fire(ValueChangedEvent('transactionInfo.transaction', 'supply'));
//
// }
