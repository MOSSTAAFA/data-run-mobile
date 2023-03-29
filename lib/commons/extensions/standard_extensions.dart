
// extension StandardAsyncExt<T> on Future<T> {
//   /// Async calls the specified function [block] with `this` value as its argument and returns its result as Future.
//   Future<R> aaLet<R>(R Function(T) block) async {
//     final T incomingValue = await this;
//     return block((await this) as T);
//   }
// }
extension StandardExt<T> on T {
  // Constant `true` function, used as callback by [forEach].
  static bool _kTrue(Object? _) => true;

  /// Calls the specified function [block] with `this` value as its argument and returns its result.
  Future<R> aLet<R>(Future<R> Function(T it) block) {
    return block(this);
  }

  /// Calls the specified function [block] with `this` value as its argument and returns its result.
  R let<R>(R Function(T it) block) {
    return block(this);
  }

  /// Calls the specified function [block] with `this` value as its argument and returns `this` value.
  T also(void Function(T) block) {
    block(this);
    return this;
  }

  /// Returns `this` value if it satisfies the given [predicate] or `null`, if it doesn't.
  T? takeIf(bool Function(T) predicate) {
    if (predicate(this)) return this;
    return null;
  }

  /// Returns `this` value if it _does not_ satisfy the given [predicate] or `null`, if it does.
  T? takeUnless(bool Function(T) predicate) {
    if (!predicate(this)) return this;
    return null;
  }
}
