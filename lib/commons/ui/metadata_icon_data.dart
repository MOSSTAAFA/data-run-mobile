import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MetadataIconData with EquatableMixin {
  MetadataIconData(
      {required this.programColor,
      required this.iconResource,
      this.sizeInDp = 40});

  final Color programColor;
  final Icon iconResource;
  final double sizeInDp;

  MetadataIconData copyWith(
          {Color? programColor, Icon? iconResource, double? sizeInDp}) =>
      MetadataIconData(
          programColor: programColor ?? this.programColor,
          iconResource: iconResource ?? this.iconResource,
          sizeInDp: sizeInDp ?? this.sizeInDp);

  @override
  List<Object?> get props => [programColor, iconResource, sizeInDp];
}
