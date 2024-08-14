import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class EntitySummary with EquatableMixin {
  EntitySummary({required this.orgUnit, required this.data});

  final String orgUnit;
  final IMap<String, dynamic> data;

  @override
  List<Object?> get props => [orgUnit, data];
}
