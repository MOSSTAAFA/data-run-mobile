import 'package:d2_remote/modules/datarun/form/shared/field_template/scanned_code_properties.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

class ScanValidator {
  final ScannedCodeProperties scannedCodeProperties;

  ScanValidator(this.scannedCodeProperties);

  /// Validate the scanned barcode
  bool validate(GS1Barcode barcode) {
    final allowedItemTypes = scannedCodeProperties.allowedItemTypes;

    // Check item type
    if (allowedItemTypes.isNotEmpty &&
        !barcode.getAIsData.keys.any((t) => allowedItemTypes.contains(t))) {
      return false;
    }

    // Validate constraints
    // final constraints = scannedCodeProperties['constraints'] as Map<String, dynamic>?;
    // if (constraints != null) {
    // Validate GTIN
    final productionDate = barcode.getAIData('11');
    final batchLot = barcode.getAIData('10');
    final serial = barcode.getAIData('21');
    final GTIN =
        serial == null ? barcode.getAIData('01') : barcode.getAIData('02');
    final gtinPatterns = scannedCodeProperties.gtin;
    if (!gtinPatterns.any((pattern) => _matchesPattern(GTIN, pattern))) {
      return false;
    }

    // Validate BATCH/LOT
    // final batchRegex = scannedCodeProperties.batchLot;
    // if (batchRegex != null &&
    //     !RegExp(batchRegex).hasMatch(barcode.batch ?? '')) {
    //   return false;
    // }

    // Validate PROD_DATE
    // final prodDateConstraints = scannedCodeProperties.productionDate;

    /// get production date from AI parsed element if present
    // final prodDate = barcode.getAIParsedElement('11');
    // if (prodDate != null) {
    //   final date = DateTime.parse(prodDate.aiCode);
    //   final minDate = DateTime.parse(prodDateConstraints['min']!);
    //   final maxDate = DateTime.parse(prodDateConstraints['max']!);
    //   if (prodDate.isBefore() || prodDate.isAfter(maxDate)) {
    //     return false;
    //   }
    // }

    // }

    return true;
  }

  /// Check if a value matches a wildcard pattern
  bool _matchesPattern(String? value, String pattern) {
    if (value == null) return false;
    final regex = RegExp(pattern.replaceAll('*', '.*'));
    return regex.hasMatch(value);
  }
}
