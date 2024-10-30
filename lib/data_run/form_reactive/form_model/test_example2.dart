
class FormField {
  FormField({
    required this.name,
    this.choiceFilter,
    this.rules = const [],
    this.dependencies = const [],
  });

  String name;
  String? choiceFilter;
  List<Rule> rules;
  List<String> dependencies;
}

class Rule {
  Rule({
    required this.expression,
    required this.action,
    required this.dependencies,
  });

  String expression;
  String action;
  List<String> dependencies;
}

class Form {
  Form({
    // required this.uid,
    // required this.name,
    required this.fields,
    // required this.options,
  });

  // String uid;
  // String name;
  List<FormField> fields;
// Map<String, List<FormField>> options;
}

class EventDispatcher {
  EventDispatcher(this.form) {
    _buildDependencyGraph();
  }

  Form form;
  Map<String, dynamic> values = {};

  void _buildDependencyGraph() {
    // Create a directed graph of field dependencies
    Map<String, Set<String>> dependencyGraph = {};
    for (var field in form.fields) {
      dependencyGraph[field.name] = Set<String>();
      for (var rule in field.rules) {
        dependencyGraph[field.name]!.addAll(rule.dependencies);
      }
      if (field.choiceFilter != null) {
        dependencyGraph[field.name]!.addAll(field.choiceFilter!.split(' == '));
      }
    }

    // Topologically sort the graph to determine processing order
    List<String> processingOrder = topologicalSort(dependencyGraph);

    // Process fields in the correct order
    for (var fieldName in processingOrder) {
      _processField(form.fields.firstWhere((f) => f.name == fieldName));
    }
  }

  void _processField(FormField field) {
    // Evaluate rules and apply actions
    for (var rule in field.rules) {
      if (_evaluateRule(rule)) {
        _applyAction(rule);
      }
    }

    // Apply choice filter and update options
    if (field.choiceFilter != null) {
      _applyChoiceFilter(field);
    }
  }

  bool _evaluateRule(Rule rule) {
    // Implement rule evaluation logic here
    // ...
    return true; // Placeholder
  }

  void _applyAction(Rule rule) {
    // Implement action application logic here
    // ...
  }

  void _applyChoiceFilter(FormField field) {
    // Implement choice filter application logic here
    // ...
  }

  // Topological sort algorithm
  List<String> topologicalSort(Map<String, Set<String>> graph) {
    List<String> result = [];
    Set<String> visited = Set();
    Set<String> visiting = Set();

    void visit(String node) {
      if (visiting.contains(node)) {
        throw Exception('Cycle detected in dependency graph');
      }
      if (visited.contains(node)) {
        return;
      }
      visiting.add(node);
      for (var neighbor in graph[node]!) {
        visit(neighbor);
      }
      visiting.remove(node);
      visited.add(node);
      result.add(node);
    }

    for (var node in graph.keys) {
      if (!visited.contains(node)) {
        visit(node);
      }
    }

    return result.reversed.toList();
  }
}

void main() {
  // Define fields with their rules
  final fdf = 0 % 25;
  print(fdf);
  var fieldA = FormField(
    name: 'fieldA',
    rules: [],
  );

  var fieldB = FormField(
    name: 'fieldB',
    rules: [
      Rule(
          dependencies: ['fieldA'], expression: 'fieldA == 10', action: 'show'),
    ],
  );

  var fieldC = FormField(
    name: 'fieldC',
    rules: [
      Rule(
          dependencies: ['fieldB'],
          expression: 'fieldB == 20',
          action: 'makeMandatory'),
    ],
  );

  var form = Form(fields: [fieldA, fieldB, fieldC]);
  var eventDispatcher = EventDispatcher(form);

  print('ff$form');
}
