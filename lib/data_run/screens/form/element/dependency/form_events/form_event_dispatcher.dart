import 'package:mass_pro/data_run/screens/form/element/dependency/form_dependency_register.dart';
import 'package:mass_pro/data_run/screens/form/element/dependency/form_events/form_event.dart';


class FormEventDispatcher {

  FormEventDispatcher({required FormDependencyRegistery dependencyRegister})
      : _dependencyRegister = dependencyRegister;

  final FormDependencyRegistery _dependencyRegister;
  final Map<String, List<Function>> _listeners = {};
  final Map<String, FormEvent> _events = {};

  void subscribe(FormEvent event, Function callback) {
    _listeners.putIfAbsent(event, () => []).add(field);

    if (_listeners[event] == null) {
      _listeners[event] = [];
    }
    _listeners[event]!.add(callback);
  }

  void fireEvent(FormEvent event) {}

  void registerForEvent(String dependency, FormEvent event) {

  }

  void dispatch(String eventType, dynamic payload) {
    if (_listeners[eventType] != null) {
      for (var callback in _listeners[eventType]!) {
        callback(payload);
      }
    }
  }
}
