import 'package:equatable/equatable.dart';

part 'search_te_screen_state_sealed.dart';

// /// Sealed, and data classes
// @Sealed()
// abstract class _SearchTEScreenState {
//
//   _SearchTEScreenState(this.screenState, this.previousSate);
//   final SearchScreenState screenState;
//   final SearchScreenState previousSate;
//
//   @WithName('SearchList')
//   void searchList(
//       SearchScreenState previousSate,
//       SearchScreenState listType,
//       bool displayFrontPageList,
//       bool canCreateWithoutSearch,
//       bool isSearching,
//       SearchForm searchForm,
//       SearchFilters searchFilters);
//
//   @WithName('SearchAnalytics')
//   void searchAnalytics(SearchScreenState previousSate);
// }

// class SearchList {
//   /*override*/ SearchScreenState previousSate;
//   SearchScreenState listType;
//   bool displayFrontPageList;
//   bool canCreateWithoutSearch;
//   bool isSearching;
//   SearchForm searchForm;
//   SearchFilters searchFilters;
// }

class SearchForm {
  const SearchForm(
      {required this.queryHasData,
      required this.minAttributesToSearch,
      this.isForced = false,
      this.isOpened = false});

  final bool queryHasData;
  final int minAttributesToSearch;
  final bool isForced;

  final bool isOpened;
}

class SearchFilters {
  SearchFilters([this.hasActiveFilters = false, this.isOpened = false]);

  final bool hasActiveFilters;
  final bool isOpened;
}

enum SearchScreenState { NONE, LIST, MAP, ANALYTICS }
