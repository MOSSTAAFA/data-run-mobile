import 'package:equatable/equatable.dart';

import '../filters.dart';
import 'sorting_status.dart';

/// Data class
class SortingItem with EquatableMixin {
  SortingItem(
      {required this.filterSelectedForSorting,
      this.sortingStatus = SortingStatus.ASC});
  final Filters filterSelectedForSorting;
  final SortingStatus sortingStatus;

  SortingItem copyWith(
      {Filters? filterSelectedForSorting, SortingStatus? sortingStatus}) {
    return SortingItem(
        filterSelectedForSorting:
            filterSelectedForSorting ?? this.filterSelectedForSorting,
        sortingStatus: sortingStatus ?? this.sortingStatus);
  }

  @override
  List<Object?> get props => [filterSelectedForSorting, sortingStatus];
}
