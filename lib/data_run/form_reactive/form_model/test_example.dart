import 'dart:collection';


class FormField {
  FormField(this.name, this.dependencies, this.onUpdate);

  final String name;
  final List<String> dependencies;
  final Function onUpdate;
}

class Form {
  Form(
      {Map<String, FormField> fields = const {},
        required this.eventQueue,
        Map<String, dynamic> data = const {}}) {
    this.fields.clear();
    this.fields.addAll(fields);
    this.data.clear();
    this.data.addAll(data);
  }

  final Map<String, FormField> fields = {};
  Queue<FormField> eventQueue;
  final Map<String, dynamic> data = {};

  void processEvents() {
    while (eventQueue.isNotEmpty) {
      final field = eventQueue.removeFirst();
      if (dependenciesSatisfied(field)) {
        field.onUpdate();
        updateDependencies(field);
      } else {
        eventQueue.addLast(field);
      }
    }
  }

  bool dependenciesSatisfied(FormField field) {
    return field.dependencies.every((dep) => data.containsKey(dep));
  }

  void updateDependencies(FormField field) {
    for (final dep in field.dependencies) {
      final depField = fields[dep];
      if (depField != null && !depField.dependencies.contains(field.name)) {
        depField.dependencies.add(field.name);
      }
    }
  }

  void updateField(String name, dynamic value) {
    data[name] = value;
    final field = fields[name];
    if (field != null) {
      eventQueue.add(field);
      processEvents();
    }
  }
}

class DependencyGraph {
  final Map<String, Set<String>> dependencies = {};

  void addDependency(String field, String dependency) {
    dependencies[field] ??= Set();
    dependencies[field]!.add(dependency);
  }

  List<String> topologicalSort() {
    final sorted = <String>[];
    final visited = <String>{};

    void dfs(String field) {
      if (visited.contains(field)) {
        return;
      }
      visited.add(field);

      for (final dependency in dependencies[field] ?? Set()) {
        dfs(dependency);
      }

      sorted.insert(0, field);
    }

    for (final field in dependencies.keys) {
      dfs(field);
    }

    return sorted;
  }
}

//
// void main() async {
//
//   final formFields = {
//     'fieldA': FormField('fieldA', ['fieldB'], () => print('fieldA updated')),
//     'fieldB': FormField('fieldB', [], () => print('fieldB updated')),
//   };
//
//   final form = Form(fields: formFields, eventQueue: Queue(), data: {});
//   form.updateField('fieldB', 'valueB');
//   form.updateField('fieldA', 'valueA');
//   form.updateField('fieldB', 'valueA');
// }
