
import 'package:d2_remote/shared/entities/identifiable.entity.dart';

class ValueTypeDeviceRendering extends IdentifiableEntity {

  ValueTypeDeviceRendering(
      {required super.id,
      super.name,
      this.objectTable,
      this.deviceType,
      this.type,
      this.min,
      this.max,
      this.step,
      this.decimalPoints,
      required super.dirty});

  factory ValueTypeDeviceRendering.fromJson(Map<String, dynamic> json) {
    return ValueTypeDeviceRendering(
        id: json['id'],
        name: json['name'],
        objectTable: json['objectTable'],
        deviceType: json['deviceType'],
        type: json['type'],
        min: json['min'],
        max: json['max'],
        step: json['step'],
        decimalPoints: json['decimalPoints'],
        dirty: json['dirty']);
  }
  String? objectTable;

  String? deviceType;

  String? type;

  int? min;

  int? max;

  int? step;

  int? decimalPoints;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['objectTable'] = objectTable;
    data['deviceType'] = deviceType;
    data['type'] = type;
    data['min'] = min;
    data['max'] = max;
    data['step'] = step;
    data['decimalPoints'] = decimalPoints;
    data['dirty'] = dirty;
    return data;
  }
}
