// import 'dart:async';
//
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:logger/logger.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
// import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour_factory.dart';
// import 'package:reactive_forms/src/models/control_status.dart';
// import 'package:rxdart/streams.dart';
// import 'package:rxdart/transformers.dart';
//
// E useRegisterDependencies<E extends FormElementInstance<dynamic>>(E element,
//     [List<String> unresolvedDependencies = const []]) {
//   /// resolve and cache a form element dependencies
//   final resolvedDependency = useMemoized(() {
//     return _resolveFormElementDependencies(element);
//   }, [element.dependenciesNames, element.pathRecursive]);
//
//   /// initialize and cache resolved dependencies actions behaviours.
//   final Map<String, List<ActionBehaviour>> dependenciesActionsBehaviours =
//       useMemoized(() {
//     return initDependenciesActionsBehaviours(resolvedDependency, element);
//   }, [element.dependenciesNames, element.pathRecursive]);
//
//   /// listen to dependencies changes and bind their
//   /// actionsBehaviours to the element
//   useEffect(() {
//     // bind to the
//     for (final elementDependency in resolvedDependency.values) {
//       // add a dependency entry in the the element's dependencies map
//       element.addContextElement(elementDependency);
//
//       // add/bind action behaviour to the element
//       element.setActionBehaviourToEvaluate(
//           dependenciesActionsBehaviours[elementDependency.name] ?? []);
//       // evaluate element's initial status
//       element.onDependencyChanged(
//           elementDependency.name, elementDependency.value);
//
//       // final StreamSubscription<ControlStatus> su = elementDependency.elementControl!.statusChanged.listen(onData)
//       // combine element's and element's control statuses streams
//       final combinedStream = CombineLatestStream.combine2(
//         elementDependency.elementChanged,
//         elementDependency.elementControl!.statusChanged,
//         (dependencyElementStatus, dependencyControlStatus) =>
//             dependencyElementStatus.mergeControlStatus(
//           dependencyControlStatus,
//         ),
//       );
//
//       final subscription =
//       useOnStreamChange(combinedStream, onData: (data) {
//         loggerInitialization.d(
//             'elementDependency changed: ${elementDependency.name}, notifying: ${element.name}');
//         element.onDependencyChanged(
//             elementDependency.name, elementDependency.value);
//       });
//
//       // Subscribes to a dependency changes stream and calls the
//       // [Stream.listen] to register the [onData]
//
//       // return subscription?.cancel;
//     }
//   }, [element.pathRecursive]);
//
//   return element;
// }
//
// Map<String, List<ActionBehaviour>>
//     initDependenciesActionsBehaviours<E extends FormElementInstance<dynamic>>(
//         Map<String, FormElementInstance<dynamic>> resolvedDependency,
//         E element) {
//   return resolvedDependency.map((k, v) {
//     return MapEntry(
//         k,
//         element.rulesToEvaluate(k).map((rule) {
//           if (!element.type.isSectionType) {
//             loggerInitialization.d({
//               'creating action ${rule.action?.name} for': '${element.name}',
//               'when': rule.expression,
//             });
//           }
//           return ActionBehaviourFactory.createAction(rule);
//         }).toList());
//   });
// }
//
// Map<String, FormElementInstance<dynamic>> _resolveFormElementDependencies(
//     FormElementInstance<dynamic> element) {
//   if (!element.type.isSectionType) {
//     loggerInitialization.i(
//         'resolving dependencies for: ${element.name} ${element.dependenciesNames.length > 0 ? ', dependencies: ${element.dependenciesNames}' : '... has no dependencies'}');
//   }
//
//   final Map<String, FormElementInstance<dynamic>> resolved = {};
//   for (final dependencyName in element.dependenciesNames) {
//     final dependency = element.findElementInParentSection(dependencyName);
//     if (dependency != null) {
//       resolved[dependencyName] = dependency;
//     }
//   }
//
//   return resolved;
// }
//
// final loggerInitialization = Logger(
//     printer: PrettyPrinter(
//         colors: true,
//         methodCount: 0,
//         printEmojis: false,
//         excludeBox: {Level.trace: true, Level.info: true}),
//     level: Level.debug);
//
// /// merging dependencies streams
// class MergedStreamResponse {
//   MergedStreamResponse(this.streamIdentity, this.data);
//
//   StreamIdentity streamIdentity;
//
//   dynamic data;
// }
//
// class StreamIdentity {
//   StreamIdentity(this.identifier, this.stream);
//
//   String identifier;
//
//   Stream<dynamic> stream;
// }
//
// Stream<MergedStreamResponse> mergeStream(List<StreamIdentity> streams) {
//   // Initialize a stream controller
//
//   StreamController<MergedStreamResponse> controller = StreamController();
//
//   for (var identity in streams) {
//     // Add a listener to all streams
//     identity.stream.listen((event) {
//       controller.add(MergedStreamResponse(identity, event));
//     });
//   }
//   return controller.stream;
// }
