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
    {'name': 'Alice', 'age': 25, 'country': 'USA'},
    {'name': 'Bob', 'age': 30, 'country': 'UK'},
    {'name': 'Charlie', 'age': 35, 'country': 'USA'},
    {'name': 'David', 'age': 40, 'country': 'Canada'},
  ];

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
