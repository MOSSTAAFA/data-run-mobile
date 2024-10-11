// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:mass_pro/commons/logging/logging.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_element_inherited.widget.dart';
// import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
// import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour_factory.dart';
//
// class ReactiveFormElementInit extends Hook<FormElementInstance<dynamic>> {
//   const ReactiveFormElementInit({required this.element, required this.builder});
//
//   final FormElementInstance<dynamic> element;
//   final Widget Function(BuildContext context,
//       FormElementInstance<dynamic> formElement, Widget child)? builder;
//
//   @override
//   _ReactiveFormElementInitState createState() =>
//       _ReactiveFormElementInitState();
// }
//
// class _ReactiveFormElementInitState
//     extends HookState<FormElementInstance<dynamic>, ReactiveFormElementInit> {
//   late FormElementInstance<dynamic> _element = hook.element;
//   Map<String, FormElementInstance<dynamic>> _resolvedDependencies = {};
//   Map<String, List<ActionBehaviour>> _actionsBehaviours = {};
//   Map<String, String?> _dependenciesPaths = {};
//
//   @override
//   void initHook() {
//     super.initHook();
//     final resolvedNotifier = _resolveDependencies();
//     _resolvedDependencies.addAll(resolvedNotifier);
//     _resolvedDependencies.values.forEach((element) {
//       _dependenciesPaths[element.name] = element.elementPath;
//     });
//
//     _actionsBehaviours.addAll(_initActionsBehaviours());
//
//     _listenToResolvedDependencies();
//
//     _evaluateInitState();
//
//     if (_element.disabled) {
//       _element.form.markAsDisabled();
//     }
//
//     if (_element.hidden) {
//       _element.form.markAsDisabled();
//       _element.markAsHidden();
//     }
//   }
//
//   Map<String, FormElementInstance<dynamic>> _resolveDependencies() {
//     logDebug(
//         'resolving: ${_element.name}\'s dependencies: [${_element.requiredNotifiersNames}]');
//     final Map<String, FormElementInstance<dynamic>> resolved = {};
//     for (final dependencyName in _element.requiredNotifiersNames) {
//       final dependency = _element.findElementInParentSection(dependencyName);
//       if (dependency != null) {
//         resolved[dependencyName] = dependency;
//       }
//     }
//
//     return resolved;
//   }
//
//   Map<String, List<ActionBehaviour>> _initActionsBehaviours() {
//     return _resolvedDependencies.map((k, v) {
//       return MapEntry(
//           k,
//           _element.rulesToEvaluate(k).map((rule) {
//             if (!_element.type.isSectionType) {
//               logDebug({
//                 'bind action ${rule.action?.name} to': '${_element.name}',
//                 'when': rule.expression,
//               });
//             }
//             return ActionBehaviourFactory.createAction(rule);
//           }).toList());
//     });
//   }
//
//   void bindActionsBehaviours() {
//     for (final notifier in _resolvedDependencies.values) {
//       _element.setActionBehaviourToEvaluate(
//           _actionsBehaviours[notifier.name] ?? []);
//     }
//   }
//
//   void _listenToResolvedDependencies() {
//     for (final notifier in _resolvedDependencies.values) {
//       logDebug('Setting ${_element.name} as Listener for: ${notifier.name}');
//       _element.addContextElement(notifier);
//
//       final elementCallback = () {
//         logDebug(
//             'elementCallback.. Notifier: ${notifier.name}, notifying: ${_element.name}');
//         _element.onDependencyChanged(notifier.name, notifier.value);
//         // _element.elementControl
//         //     ?.reset(value: _element.value, emitEvent: true, updateParent: true);
//       };
//
//       notifier.addListener(elementCallback);
//
//       notifier.elementControl!.statusChanged.listen((value) {
//         logDebug(
//             'statusChanged callback .. Notifier ${notifier.name}, notifying: ${_element.name}');
//         _element.onDependencyChanged(notifier.name, notifier.value);
//       });
//     }
//   }
//
//   void _evaluateInitState() {
//     for (final notifier in _resolvedDependencies.values) {
//       logDebug(
//
//               'Evaluating initState: ${_element.name} for $notifier init value: ${notifier.value}');
//       _element.onDependencyChanged(notifier.name, notifier.value,
//           notify: false);
//     }
//   }
//
//   @override
//   void didUpdateHook(ReactiveFormElementInit oldHook) {
//     super.didUpdateHook(oldHook);
//
//     if(hook.element.elementState != oldHook.element.elementState) {
//       setState(() {
//         _element = hook.element;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FormElementInheritedWidget(
//       element: _element,
//       child: FormElementConsumer(
//         builder: (context, element, _) =>
//             widget.builder(context, this._element, widget.child),
//         child: widget.child,
//       ),
//     );
//   }
// }
