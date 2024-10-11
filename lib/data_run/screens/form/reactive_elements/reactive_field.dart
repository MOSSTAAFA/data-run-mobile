// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:logger/logger.dart';
// import 'package:mass_pro/data_run/form_state/element_providers.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
// import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
// import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour_factory.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
// import 'package:rxdart/streams.dart';
//
// class ReactiveField<ModelDataType, ViewDataType> extends HookWidget {
//   final FormElementInstance<ModelDataType> element;
//   final String formControlName;
//   final ControlValueAccessor<ModelDataType, ViewDataType>? valueAccessor;
//
//   ReactiveField(
//       {Key? key,
//       required this.formControlName,
//       this.valueAccessor,
//       required this.element})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final state = useRegisterDependencies(element);
//     return TextField(
//       onChanged: (val) => state.value = val,
//     );
//   }
// }
//
// FormElementInstance<dynamic> useFieldHook(
//     FormElementInstance<dynamic> element) {
//   final loggerInitialization = Logger(
//       printer: PrettyPrinter(
//           colors: true,
//           methodCount: 0,
//           printEmojis: false,
//           excludeBox: {Level.trace: true, Level.info: true}),
//       level: Level.debug);
//
//   final resolvedNotifiers = useMemoized(() {
//     if (!element.type.isSectionType) {
//       loggerInitialization.i(
//           'resolving dependencies for: ${element.name} ${element.requiredNotifiersNames.length > 0 ? ', dependencies: ${element.requiredNotifiersNames}' : '... has no dependencies'}');
//     }
//
//     return _resolveNotifiers(element);
//   }, [element.requiredNotifiersNames]);
//
//   final Map<String, List<ActionBehaviour>> actionsBehaviours = useMemoized(() {
//     return resolvedNotifiers.map((k, v) {
//       return MapEntry(
//           k,
//           element.rulesToEvaluate(k).map((rule) {
//             if (!element.type.isSectionType) {
//               loggerInitialization.d({
//                 'binding action ${rule.action?.name} for': '${element.name}',
//                 'when': rule.expression,
//               });
//             }
//             return ActionBehaviourFactory.createAction(rule);
//           }).toList());
//     });
//
//     /// should be when unresolved deps changes or requiredDeps
//   }, [element.requiredNotifiersNames]);
//
//   // resolved and bind notifiers and rule actions behaviours.
//   useEffect(() {
//     // bind
//     for (final notifier in resolvedNotifiers.values) {
//       loggerInitialization
//           .d('Setting ${element.name} as Listener for: ${notifier.name}');
//       element.addContextElement(notifier);
//
//       notifier.elementChanged.listen((elementStatus) {
//         loggerInitialization.d(
//             'elementCallback.. Notifier changed: ${notifier.name}, notifying: ${element.name}');
//         element.onDependencyChanged(notifier.name, notifier.value);
//         // element.elementControl
//         //     ?.reset(value: element.value, emitEvent: true, updateParent: true);
//       });
//       element
//           .setActionBehaviourToEvaluate(actionsBehaviours[notifier.name] ?? []);
//
//       element.onDependencyChanged(notifier.name, notifier.value);
//       notifier.elementControl!.statusChanged.listen((value) {
//         loggerInitialization
//             .d('${notifier.name} statusChanged, notifying: ${element.name}');
//         element.onDependencyChanged(notifier.name, notifier.value);
//       }, onDone: () {
//         loggerInitialization.d(
//             'notifier ${notifier.name} Done, removing ${element.name} listener');
//         // notifier.removeListener(elementCallback);
//       });
//     }
//   });
//
//   return element;
// }
//
// Map<String, FormElementInstance<dynamic>> _resolveNotifiers(
//     FormElementInstance<dynamic> element) {
//   // logDebug(
//   //     info:
//   //         'resolving/caching: ${element.name}\'s dependencies: [${element.requiredNotifiers}]');
//   final Map<String, FormElementInstance<dynamic>> resolved = {};
//   for (final dependencyName in element.requiredNotifiersNames) {
//     final dependency = element.findElementInParentSection(dependencyName);
//     if (dependency != null) {
//       resolved[dependencyName] = dependency;
//     }
//   }
//
//   return resolved;
// }
