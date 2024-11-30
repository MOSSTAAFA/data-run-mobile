import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

class BarcodeValidator {
  // Fixed parts of the barcode
  final String startCode;
  final String fixedGtin;
  final int productionDateLength;
  final int batchNumberLength;
  final String serialNumberPrefix;
  final int serialNumberLength;

  BarcodeValidator({
    required this.startCode,
    required this.fixedGtin,
    required this.productionDateLength,
    required this.batchNumberLength,
    required this.serialNumberPrefix,
    required this.serialNumberLength,
  });

  // Method to validate the barcode
  bool isValidBarcode(String barcode) {
    // Check the start code
    if (!barcode.startsWith(startCode)) {
      return false;
    }

    // Check the GTIN (just after the start code)
    String barcodeGtin = barcode.substring(
        startCode.length, startCode.length + fixedGtin.length);
    if (barcodeGtin != fixedGtin) {
      return false;
    }

    // Calculate the start index of the remaining segments
    int startIndex = startCode.length + fixedGtin.length;

    // Check the production date (basic length check)
    String productionDate =
        barcode.substring(startIndex, startIndex + productionDateLength);
    if (productionDate.length != productionDateLength) {
      return false;
    }

    // Update the start index for the next segment
    startIndex += productionDateLength;

    // Check the batch number (basic length check)
    String batchNumber =
        barcode.substring(startIndex, startIndex + batchNumberLength);
    if (batchNumber.length != batchNumberLength) {
      return false;
    }

    // Update the start index for the next segment
    startIndex += batchNumberLength;

    // Check the serial number prefix and length
    String serialNumber = barcode.substring(startIndex);
    if (!serialNumber.startsWith(serialNumberPrefix) ||
        serialNumber.length != serialNumberPrefix.length + serialNumberLength) {
      return false;
    }

    return true;
  }
}

void scanBarcode() async {
  String barcodeScanRes = ']C102076402178117593750\u001d1124070010104724';
  String barcodeScanRes2 =
      '\u001d01076402178117591124070010104724\u001d21E6DAF62C0';

  final String barcode =
      ']C101040123456789011715012910ABC1233932971471131030005253922471142127649716';
  final parser = GS1BarcodeParser.defaultParser();
  final result = parser.parse(barcode);
  final result1 = parser.parse(barcodeScanRes);
  final result2 = parser.parse(barcodeScanRes2);
  print(result);
  print(result1);
  print(result2);
  // // Define the validator with expected parameters
  // BarcodeValidator validator = BarcodeValidator(
  //   startCode: "]C1",
  //   fixedGtin: "076402178101",
  //   productionDateLength: 8,
  //   // Assuming format is YYYYMMDD
  //   batchNumberLength: 6,
  //   serialNumberPrefix: "E6D",
  //   serialNumberLength: 7, // Length excluding the prefix
  // );

  // final valid1 = barcodeScanRes.contains(']C10207640217811759');
  // final valid2 =barcodeScanRes2.contains('76402178');
  // // Validate the scanned barcode
  // if (validator.isValidBarcode(barcodeScanRes)) {
  //   print('Valid barcode: $barcodeScanRes');
  // } else {
  //   print('Invalid barcode: $barcodeScanRes');
  // }
}

void main() {
  scanBarcode();
}

// void main() {
//   final barcode = "]C102076402178117593750\u001d1124070010104724";
//   final parsedFields = parseGS1Barcode(barcode);
//
//   print(parsedFields);
//   // Output: {GTIN: 021123456789012345678901234567890, Quantity: 1, Production Date: 1234567890, Batch: 10123456789012345678901234567890, Serial
//   // }
// }
