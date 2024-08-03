import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

IconData getRandomIcon(String code) {
  final List<IconData> icons = <IconData>[
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
  final Uint8List bytes = utf8.encode(code);
  final Digest digest = md5.convert(bytes);
  final int hashValue = digest.bytes.reduce((int value, int element) => value + element);

  // Use the hash value to get a consistent index
  final int index = hashValue % icons.length;
  return icons[index];
}
