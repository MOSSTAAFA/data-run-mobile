part of 'search_te_screen_state.dart';

/// [SearchTEScreenState] {
///
/// {[SearchScreenState] screenState, [SearchScreenState] previousSate}
///
/// -----------------
///
/// ([SearchList] searchList){[SearchScreenState] listType, [SearchScreenState] previousSate, [bool] displayFrontPageList, [bool] canCreateWithoutSearch, [bool] isSearching, [SearchForm] searchForm, [SearchFilters] searchFilters} with data equality
///
/// ----------------
///
/// ([SearchAnalytics] searchAnalytics){[SearchScreenState] previousSate} with data equality
///
/// }
abstract class SearchTEScreenState {
  const SearchTEScreenState._internal(this.screenState, this.previousSate);

  const factory SearchTEScreenState.searchAnalytics({
    required SearchScreenState previousSate,
  }) = SearchAnalytics;

  const factory SearchTEScreenState.searchList({
    required SearchScreenState listType,
    required SearchScreenState previousSate,
    required bool displayFrontPageList,
    required bool canCreateWithoutSearch,
    required bool isSearching,
    required SearchForm searchForm,
    required SearchFilters searchFilters,
  }) = SearchList;

  final SearchScreenState screenState;
  final SearchScreenState previousSate;

  bool get isSearchList => this is SearchList;

  bool get isSearchAnalytics => this is SearchAnalytics;

  SearchList get asSearchList => this as SearchList;

  SearchAnalytics get asSearchAnalytics => this as SearchAnalytics;

  SearchList? get asSearchListOrNull {
    final searchTEScreenState = this;
    return searchTEScreenState is SearchList ? searchTEScreenState : null;
  }

  SearchAnalytics? get asSearchAnalyticsOrNull {
    final searchTEScreenState = this;
    return searchTEScreenState is SearchAnalytics ? searchTEScreenState : null;
  }

  R when<R extends Object?>({
    required R Function(
            SearchScreenState listType,
            SearchScreenState previousSate,
            bool displayFrontPageList,
            bool canCreateWithoutSearch,
            bool isSearching,
            SearchForm searchForm,
            SearchFilters searchFilters)
        searchList,
    required R Function(SearchScreenState previousSate) searchAnalytics,
  }) {
    final searchTEScreenState = this;
    if (searchTEScreenState is SearchList) {
      return searchList(
          searchTEScreenState.listType,
          searchTEScreenState.previousSate,
          searchTEScreenState.displayFrontPageList,
          searchTEScreenState.canCreateWithoutSearch,
          searchTEScreenState.isSearching,
          searchTEScreenState.searchForm,
          searchTEScreenState.searchFilters);
    } else if (searchTEScreenState is SearchAnalytics) {
      return searchAnalytics(searchTEScreenState.previousSate);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(
            SearchScreenState listType,
            SearchScreenState previousSate,
            bool displayFrontPageList,
            bool canCreateWithoutSearch,
            bool isSearching,
            SearchForm searchForm,
            SearchFilters searchFilters)?
        searchList,
    R Function(SearchScreenState previousSate)? searchAnalytics,
    required R Function(SearchTEScreenState searchTEScreenState) orElse,
  }) {
    final searchTEScreenState = this;
    if (searchTEScreenState is SearchList) {
      return searchList != null
          ? searchList(
              searchTEScreenState.listType,
              searchTEScreenState.previousSate,
              searchTEScreenState.displayFrontPageList,
              searchTEScreenState.canCreateWithoutSearch,
              searchTEScreenState.isSearching,
              searchTEScreenState.searchForm,
              searchTEScreenState.searchFilters)
          : orElse(searchTEScreenState);
    } else if (searchTEScreenState is SearchAnalytics) {
      return searchAnalytics != null
          ? searchAnalytics(searchTEScreenState.previousSate)
          : orElse(searchTEScreenState);
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(
            SearchScreenState listType,
            SearchScreenState previousSate,
            bool displayFrontPageList,
            bool canCreateWithoutSearch,
            bool isSearching,
            SearchForm searchForm,
            SearchFilters searchFilters)?
        searchList,
    R Function(SearchScreenState previousSate)? searchAnalytics,
    R Function(SearchTEScreenState searchTEScreenState)? orElse,
  }) {
    final searchTEScreenState = this;
    if (searchTEScreenState is SearchList) {
      return searchList != null
          ? searchList(
              searchTEScreenState.listType,
              searchTEScreenState.previousSate,
              searchTEScreenState.displayFrontPageList,
              searchTEScreenState.canCreateWithoutSearch,
              searchTEScreenState.isSearching,
              searchTEScreenState.searchForm,
              searchTEScreenState.searchFilters)
          : orElse?.call(searchTEScreenState);
    } else if (searchTEScreenState is SearchAnalytics) {
      return searchAnalytics != null
          ? searchAnalytics(searchTEScreenState.previousSate)
          : orElse?.call(searchTEScreenState);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(SearchList searchList) searchList,
    required R Function(SearchAnalytics searchAnalytics) searchAnalytics,
  }) {
    final searchTEScreenState = this;
    if (searchTEScreenState is SearchList) {
      return searchList(searchTEScreenState);
    } else if (searchTEScreenState is SearchAnalytics) {
      return searchAnalytics(searchTEScreenState);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(SearchList searchList)? searchList,
    R Function(SearchAnalytics searchAnalytics)? searchAnalytics,
    required R Function(SearchTEScreenState searchTEScreenState) orElse,
  }) {
    final searchTEScreenState = this;
    if (searchTEScreenState is SearchList) {
      return searchList != null
          ? searchList(searchTEScreenState)
          : orElse(searchTEScreenState);
    } else if (searchTEScreenState is SearchAnalytics) {
      return searchAnalytics != null
          ? searchAnalytics(searchTEScreenState)
          : orElse(searchTEScreenState);
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(SearchList searchList)? searchList,
    R Function(SearchAnalytics searchAnalytics)? searchAnalytics,
    R Function(SearchTEScreenState searchTEScreenState)? orElse,
  }) {
    final searchTEScreenState = this;
    if (searchTEScreenState is SearchList) {
      return searchList != null
          ? searchList(searchTEScreenState)
          : orElse?.call(searchTEScreenState);
    } else if (searchTEScreenState is SearchAnalytics) {
      return searchAnalytics != null
          ? searchAnalytics(searchTEScreenState)
          : orElse?.call(searchTEScreenState);
    } else {
      throw AssertionError();
    }
  }
}

/// (([SearchList] : [SearchTEScreenState]) searchList){[SearchScreenState] screenState, [SearchScreenState] previousSate, [SearchScreenState] listType, [bool] displayFrontPageList, [bool] canCreateWithoutSearch, [bool] isSearching, [SearchForm] searchForm, [SearchFilters] searchFilters}
///
/// with data equality
class SearchList extends SearchTEScreenState with EquatableMixin {
  const SearchList({
    required this.listType,
    required this.previousSate,
    required this.displayFrontPageList,
    required this.canCreateWithoutSearch,
    required this.isSearching,
    required this.searchForm,
    required this.searchFilters,
  }) : super._internal(listType, previousSate);

  final SearchScreenState listType;

  @override
  final SearchScreenState previousSate;
  final bool displayFrontPageList;
  final bool canCreateWithoutSearch;
  final bool isSearching;
  final SearchForm searchForm;
  final SearchFilters searchFilters;

  @override
  String toString() =>
      'SearchTEScreenState.searchList(previousSate: $previousSate, listType: $listType, displayFrontPageList: $displayFrontPageList, canCreateWithoutSearch: $canCreateWithoutSearch, isSearching: $isSearching, searchForm: $searchForm, searchFilters: $searchFilters)';

  @override
  List<Object?> get props => [
        previousSate,
        listType,
        displayFrontPageList,
        canCreateWithoutSearch,
        isSearching,
        searchForm,
        searchFilters,
      ];
}

/// (([SearchAnalytics] : [SearchTEScreenState]) searchAnalytics){[SearchScreenState] screenState, [SearchScreenState] previousSate}
///
/// with data equality
class SearchAnalytics extends SearchTEScreenState with EquatableMixin {
  const SearchAnalytics({
    required this.previousSate,
  }) : super._internal(SearchScreenState.ANALYTICS, previousSate);

  @override
  final SearchScreenState previousSate;

  @override
  String toString() =>
      'SearchTEScreenState.searchAnalytics(previousSate: $previousSate)';

  @override
  List<Object?> get props => [
        screenState,
        previousSate,
      ];
}
