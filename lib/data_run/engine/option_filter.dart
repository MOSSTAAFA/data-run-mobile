class Filter {
  Filter(this.field, this.value, this.condition);

  final String field;
  final dynamic value;
  final bool Function(dynamic fieldValue, dynamic filterValue) condition;

  bool apply(Map<String, dynamic> item) {
    return condition(item[field], value);
  }
}

List<Map<String, dynamic>> applyFilters(
  List<Map<String, dynamic>> data,
  List<Filter> filters,
) {
  var filteredData = data;

  for (var filter in filters) {
    filteredData = filteredData.where((item) => filter.apply(item)).toList();
  }

  return filteredData;
}

void main() {
  // Sample data set
  final data = [
    {'name': 'us rate 10', 'regionFilter': 'northAmerica', 'rate': 10}, // Item 1
    {'name': 'us rate 70', 'regionFilter': 'northAmerica', 'rate': 70}, // Item 2
    {'name': 'ca rate 20', 'regionFilter': 'northAmerica', 'rate': 10}, // Item 3
    {'name': 'de rate 50', 'europe': 'northAmerica', 'temp': 50}, // Item 4
    {'name': 'china rate 50', 'europe': 'northAmerica', 'temp': 50}, // Item 5
    {'name': 'china rate 40', 'europe': 'northAmerica', 'temp': 40}, // Item 6
  ];

  Map<String, dynamic> values = {
    'region': 'northAmerica',
    'rate': 50
  };
  /// regionFilter == #{region} // would return
  /// regionFilter == #{region} && rate == 10
  /// regionFilter == #{region} && rate == #{rateValue}

  // Define filters
  final filters = [
    Filter('country', 'USA',
        (fieldValue, filterValue) => fieldValue == filterValue),
    Filter('age', 30, (fieldValue, filterValue) => fieldValue > filterValue),
  ];

  // Apply filters cumulatively
  final result = applyFilters(data, filters);

  // print(result);
}
