typedef AsyncValueGetter<T> = Future<T> Function();

class Lazy<T> {
  Lazy(this._asyncLoad);

  final AsyncValueGetter<T> _asyncLoad;
  bool _isLoaded = false;

  late final T _value;

  bool get isLoaded => _isLoaded;

  Future<T> call() async => _isLoaded ? _value : await _loadValue();

  Future<T> _loadValue() async {
    _value = await _asyncLoad();
    _isLoaded = true;
    return _value;
  }
}

//
// class Lazy<T> {
//   final Future<T> Function() _asyncFunction;
//   bool _isEvaluated = false;
//
//   Lazy(this._asyncFunction);
//
//   late final T _value;
//
//   Future<T> call() async {
//     if (!_isEvaluated) {
//       // if(_func != null) {
//       _value = await _asyncFunction();
//       // }
//       _isEvaluated = true;
//     }
//     return _value;
//   }
// }
