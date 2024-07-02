import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mass_pro/data_run/engine/rule_engine.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Expression>()])
@GenerateNiceMocks([MockSpec<ExpressionEvaluator>()])
import 'rule_engine_test.mocks.dart';

// class MockExpressionEvaluator extends Mock implements ExpressionEvaluator {}

void main() {
  // var expression = MockExpression();
  // var evaluator = MockExpressionEvaluator();

  group('RuleEngine Tests', () {
    late RuleEngine ruleEngine;
    late MockExpressionEvaluator mockEvaluator;

    setUp(() {
      mockEvaluator = MockExpressionEvaluator();
      ruleEngine = RuleEngine(mockEvaluator);
    });

    test('Context is correctly built from fields', () {
      final fields = IList(const [
        QFieldModel(
            uid: 'field1',
            value: 'value1',
            isFocused: false,
            isEditable: true,
            isMandatory: true,
            label: 'Field 1'),
        QFieldModel(
            uid: 'field2',
            value: 'value2',
            isFocused: false,
            isEditable: true,
            isMandatory: true,
            label: 'Field 2'),
      ]);

      final context = ruleEngine.getContext(fields);

      expect(context.unlock, {
        'field1': 'value1',
        'field2': 'value2',
      });
    });

    test('Field rules are correctly extracted and cached', () {
      final rule1 = Rule(
          id: 'rule1',
          field: 'field1',
          expression: 'expression1',
          action: 'show');
      final rule2 = Rule(
          id: 'rule2',
          field: 'field2',
          expression: 'expression2',
          action: 'hide');

      final fields = IList([
        QFieldModel(
            uid: 'field1',
            fieldRules: IList([rule1]),
            isFocused: false,
            isEditable: true,
            isMandatory: true,
            label: 'Field 1'),
        QFieldModel(
            uid: 'field2',
            fieldRules: IList([rule2]),
            isFocused: false,
            isEditable: true,
            isMandatory: true,
            label: 'Field 2'),
      ]);

      final rulesMap = ruleEngine.getRules(fields);

      expect(rulesMap.get('field1'), IList([rule1]));
      expect(rulesMap.get('field2'), IList([rule2]));
    });

    test('Rules are correctly applied to fields', () async {
      final rule1 = Rule(
          id: 'rule1', field: 'field1', expression: 'true', action: 'show');
      final fields = IList([
        QFieldModel(
            uid: 'field1',
            value: 'value1',
            isVisible: false,
            fieldRules: IList([rule1]),
            isFocused: false,
            isEditable: true,
            isMandatory: true,
            label: 'Field 1'),
      ]);

      when(mockEvaluator.eval(any, any)).thenReturn(true);

      final updatedFields = await ruleEngine.applyRules(fields);

      expect(updatedFields[0].isVisible, isTrue);
    });

    test('Actions (show, hide, error, warning) are correctly executed', () {
      final fields = IList(const [
        QFieldModel(
            uid: 'field1',
            isVisible: false,
            isFocused: false,
            isEditable: true,
            isMandatory: true,
            label: 'Field 1'),
      ]);

      final showRule = Rule(
          id: 'rule1', field: 'field1', expression: 'true', action: 'show');
      final hideRule = Rule(
          id: 'rule2', field: 'field1', expression: 'true', action: 'hide');
      final errorRule = Rule(
          id: 'rule3',
          field: 'field1',
          expression: 'true',
          action: 'error',
          message: 'Error message');
      final warningRule = Rule(
          id: 'rule4',
          field: 'field1',
          expression: 'true',
          action: 'warning',
          message: 'Warning message');

      when(mockEvaluator.eval(any, any)).thenReturn(true);

      var updatedFields = ruleEngine.applyAction(
          fields, 'field1', showRule.action, showRule.message);
      expect(updatedFields[0].isVisible, isTrue);

      updatedFields = ruleEngine.applyAction(
          updatedFields, 'field1', hideRule.action, hideRule.message);
      expect(updatedFields[0].isVisible, isFalse);

      updatedFields = ruleEngine.applyAction(
          updatedFields, 'field1', errorRule.action, errorRule.message);
      expect(updatedFields[0].error, 'Error message');

      updatedFields = ruleEngine.applyAction(
          updatedFields, 'field1', warningRule.action, warningRule.message);
      expect(updatedFields[0].warning, 'Warning message');
    });

    test('Fields with show rules are initially hidden if condition is not met', () async {
      final rule1 = Rule(id: 'rule1', field: 'field1', expression: 'false', action: 'show');
      final fields = IList([
        QFieldModel(uid: 'field1', isVisible: true, fieldRules: IList([rule1]), isFocused: false, isEditable: true, isMandatory: true, label: 'Field 1'),
      ]);

      when(mockEvaluator.eval(any, any)).thenReturn(false);

      final updatedFields = await ruleEngine.applyRules(fields);

      expect(updatedFields[0].isVisible, isFalse);
    });
  });
}
