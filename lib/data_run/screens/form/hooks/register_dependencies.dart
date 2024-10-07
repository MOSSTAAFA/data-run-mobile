import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:logger/logger.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour_factory.dart';

void useRegisterDependencies(FormElementInstance<dynamic> element) {
  final loggerInitialization = Logger(
      printer: PrettyPrinter(
          colors: true,
          methodCount: 0,
          printEmojis: false,
          excludeBox: {Level.trace: true, Level.info: true}),
      level: Level.debug);

  final resolvedNotifiers = useMemoized(() {
    if (!element.type.isSectionType) {
      loggerInitialization.i(
          'resolving dependencies for: ${element.name} ${element.requiredNotifiersNames.length > 0 ? ', dependencies: ${element.requiredNotifiersNames}' : '... has no dependencies'}');
    }

    return _resolveNotifiers(element);
  }, [element.requiredNotifiersNames]);

  final Map<String, List<ActionBehaviour>> actionsBehaviours = useMemoized(() {
    return resolvedNotifiers.map((k, v) {
      return MapEntry(
          k,
          element.rulesToEvaluate(k).map((rule) {
            if (!element.type.isSectionType) {
              loggerInitialization.d({
                'binding action ${rule.action?.name} for': '${element.name}',
                'when': rule.expression,
              });
            }
            return ActionBehaviourFactory.createAction(rule);
          }).toList());
    });
  }, [element.requiredNotifiersNames]);

  // resolved and bind notifiers and rule actions behaviours.
  useEffect(() {
    // bind
    for (final notifier in resolvedNotifiers.values) {
      loggerInitialization
          .d('Setting ${element.name} as Listener for: ${notifier.name}');
      element.addContextElement(notifier);

      final elementCallback = () {
        loggerInitialization.d(
            'elementCallback.. Notifier changed: ${notifier.name}, notifying: ${element.name}');
        element.onDependencyChanged(notifier.name, notifier.value);
        element.elementControl
            ?.reset(value: element.value, emitEvent: true, updateParent: true);
      };

      notifier.addListener(elementCallback);
      element
          .setActionBehaviourToEvaluate(actionsBehaviours[notifier.name] ?? []);

      if (notifier.value == null) {
        element.onDependencyChanged(notifier.name, notifier.value);
      }
      notifier.elementControl!.statusChanged.listen((value) {
        loggerInitialization
            .d('${notifier.name} statusChanged, notifying: ${element.name}');
        element.onDependencyChanged(notifier.name, notifier.value);
      }, onDone: () {
        loggerInitialization.d(
            'notifier ${notifier.name} Done, removing ${element.name} listener');
        notifier.removeListener(elementCallback);
      });
    }
  }, [element.elementChanged]);
}

Map<String, FormElementInstance<dynamic>> _resolveNotifiers(
    FormElementInstance<dynamic> element) {
  // logDebug(
  //     info:
  //         'resolving/caching: ${element.name}\'s dependencies: [${element.requiredNotifiers}]');
  final Map<String, FormElementInstance<dynamic>> resolved = {};
  for (final dependencyName in element.requiredNotifiersNames) {
    final dependency = element.findElementInParentSection(dependencyName);
    if (dependency != null) {
      resolved[dependencyName] = dependency;
    }
  }

  return resolved;
}
