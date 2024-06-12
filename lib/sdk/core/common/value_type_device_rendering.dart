
import 'package:d2_remote/shared/entities/identifiable.entity.dart';

class ValueTypeDeviceRendering extends IdentifiableEntity {
  String? objectTable;

  String? deviceType;

  String? type;

  int? min;

  int? max;

  int? step;

  int? decimalPoints;

  ValueTypeDeviceRendering(
      {required String? id,
      String? name,
      this.objectTable,
      this.deviceType,
      this.type,
      this.min,
      this.max,
      this.step,
      this.decimalPoints,
      required bool dirty})
      : super(id: id, name: name, dirty: dirty);

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['objectTable'] = this.objectTable;
    data['deviceType'] = this.deviceType;
    data['type'] = this.type;
    data['min'] = this.min;
    data['max'] = this.max;
    data['step'] = this.step;
    data['decimalPoints'] = this.decimalPoints;
    data['dirty'] = this.dirty;
    return data;
  }
}
