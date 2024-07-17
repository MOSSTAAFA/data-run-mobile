import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

IconData getRandomIcon(String code) {
  List<IconData> icons = [
    Icons.home,
    Icons.vaccines,
    Icons.male,
    Icons.girl,
    Icons.female,
    Icons.boy,
    Icons.healing,
    Icons.group,
    Icons.bedroom_baby,
    Icons.bed,
    Icons.person,
    Icons.camera,
    Icons.phone,
    Icons.map,
    Icons.alarm,
    Icons.work,
    Icons.school,
  ];

  // Hash the code to get a consistent value
  var bytes = utf8.encode(code);
  var digest = md5.convert(bytes);
  int hashValue = digest.bytes.reduce((value, element) => value + element);

  // Use the hash value to get a consistent index
  int index = hashValue % icons.length;
  return icons[index];
}
