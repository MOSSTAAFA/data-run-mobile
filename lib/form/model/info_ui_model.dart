import 'package:equatable/equatable.dart';

class InfoUiModel with EquatableMixin {
  const InfoUiModel(this.title, this.description);

  final String title;
  final String description;

  @override
  List<Object?> get props => [title, description];
}
