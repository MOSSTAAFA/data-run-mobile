import 'package:flutter/foundation.dart';

abstract class FormRepository {
  Future<void> saveData(Map<String, dynamic> data);
}

// class ApiRepository implements FormRepository {
//   final ApiClient _client;
//
//   ApiRepository(this._client);
//
//   @override
//   Future<void> saveData(Map<String, dynamic> data) async {
//     // Convert form data into the API payload
//     await _client.post('/saveFormData', data);
//   }
// }

class LocalRepository implements FormRepository {
  @override
  Future<void> saveData(Map<String, dynamic> data) async {
    debugPrint('LocalRepository Save form data to the local database ${data}');
    // // Save form data to the local database
    // await _database.insert('formData', data);
  }
}
