import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mass_pro/data_run/engine/rule_engine.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Expression>()])
@GenerateNiceMocks([MockSpec<ExpressionEvaluator>()])
import 'rule_engine_test2.mocks.dart';

void main() {
  group('RuleEngine', () {
    late RuleEngine ruleEngine;
    late MockExpressionEvaluator evaluator;

    setUp(() {
      evaluator = MockExpressionEvaluator();
      ruleEngine = RuleEngine(evaluator);
    });

    test('should initialize field visibility based on show rules', () async {
      // Setup your fields and rules
      final fields = IList<QFieldModel>([
        QFieldModel(
            uid: 'field1',
            fieldRules: IList([
              Rule(
                  action: 'show',
                  expression: 'true',
                  id: 'id1',
                  /*field: 'field1'*/)
            ]),
            isFocused: false,
            isVisible: true,
            isEditable: true,
            isMandatory: false,
            label: 'label1'),
        QFieldModel(
            uid: 'field2',
            fieldRules: IList([
              Rule(
                  action: 'show',
                  expression: 'false',
                  id: 'id1',
                  /*field: 'field1'*/)
            ]),
            isFocused: false,
            isEditable: true,
            isVisible: true,
            isMandatory: false,
            label: 'label1')
      ]);

      when(evaluator.eval(any, any)).thenReturn(true);

      // Apply rules
      final updatedFields = await ruleEngine.applyRules(fields);

      // Assertions
      expect(updatedFields[0].isVisible, isTrue);
      expect(updatedFields[1].isVisible, isTrue);
    });

    test('should apply show action based on expression evaluation', () async {
      final fields = IList<QFieldModel>([
        QFieldModel(
            uid: 'field1',
            fieldRules: IList([
              Rule(
                  action: 'show',
                  expression: 'true',
                  id: 'id1',
                  /*field: 'field1'*/)
            ]),
            isFocused: false,
            isVisible: false,
            isEditable: true,
            isMandatory: false,
            label: 'label1'),
      ]);

      when(evaluator.eval(any, any)).thenReturn(true);

      final updatedFields = await ruleEngine.applyRules(fields);

      expect(updatedFields[0].isVisible, isTrue);
    });

    test('should apply hide action based on expression evaluation', () async {
      final fields = IList<QFieldModel>([
        QFieldModel(
            uid: 'field1',
            fieldRules: IList([
              Rule(
                  action: 'hide',
                  expression: 'true',
                  id: 'id1',
                  /*field: 'field1'*/)
            ]),
            isFocused: false,
            isVisible: true,
            isEditable: true,
            isMandatory: false,
            label: 'label1'),
      ]);

      when(evaluator.eval(any, any)).thenReturn(true);

      final updatedFields = await ruleEngine.applyRules(fields);

      expect(updatedFields[0].isVisible, isFalse);
    });

    test('should apply error action based on expression evaluation', () async {
      final fields = IList<QFieldModel>([
        QFieldModel(
            uid: 'field1',
            fieldRules: IList([
              Rule(
                  action: 'error',
                  expression: 'true',
                  message: {'en': 'Error message'},
                  id: 'id1',
                  /*field: 'field1'*/)
            ]),
            isFocused: false,
            isEditable: true,
            isMandatory: false,
            label: 'label1'),
      ]);

      when(evaluator.eval(any, any)).thenReturn(true);

      final updatedFields = await ruleEngine.applyRules(fields);

      expect(updatedFields[0].error, equals('Error message'));
    });

    test('should reset error action if condition is not met', () async {
      final fields = IList<QFieldModel>([
        QFieldModel(
            uid: 'field1',
            error: 'Initial error',
            fieldRules: IList([
              Rule(
                  action: 'error',
                  expression: 'false',
                  message: {'en': 'Error message'},
                  id: 'id1',
                  /*field: 'field1'*/)
            ]),
            isFocused: false,
            isEditable: true,
            isMandatory: false,
            label: 'label1'),
      ]);

      when(evaluator.eval(any, any)).thenReturn(false);

      final updatedFields = await ruleEngine.applyRules(fields);

      expect(updatedFields[0].error, isNull);
    });

    test('should handle invalid expressions gracefully', () async {
      final fields = IList<QFieldModel>([
        QFieldModel(
            uid: 'field1',
            fieldRules: IList([
              Rule(
                  action: 'error',
                  expression: 'invalid expression',
                  message: {'en': 'Error message'},
                  id: 'id1',
                  /*field: 'field1'*/)
            ]),
            isFocused: false,
            isEditable: true,
            isMandatory: false,
            label: 'label1'),
      ]);

      when(evaluator.eval(any, any))
          .thenThrow(FormatException('Invalid expression'));

      final updatedFields = await ruleEngine.applyRules(fields);

      expect(updatedFields[0].error, isNull);
    });
  });
}
