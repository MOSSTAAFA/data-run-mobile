extension IterableMinBy<E> on Iterable<E> {
  /// Returns the first element yielding the smallest value of the given
  /// [selector] or `null` if there are no elements.
  E? minBy(Comparable Function(E element) selector) => _minMaxBy(-1, selector);
}

extension IterableMinWith<E> on Iterable<E> {
  /// Returns the first element having the smallest value according to the
  /// provided [comparator] or `null` if there are no elements.
  E? minWith(Comparator<E> comparator) => _minMaxWith(-1, comparator);
}

extension _MinMaxHelper<E> on Iterable<E> {
  E? _minMax(int order) {
    final Iterator<E> it = iterator;
    if (!it.moveNext()) {
      return null;
    }
    var currentMin = it.current;

    if (order < 0) {
      while (it.moveNext()) {
        if ((it.current as Comparable).compareTo(currentMin) <= order) {
          currentMin = it.current;
        }
      }
    } else {
      while (it.moveNext()) {
        if ((it.current as Comparable).compareTo(currentMin) >= order) {
          currentMin = it.current;
        }
      }
    }

    return currentMin;
  }

  E? _minMaxBy(int order, Comparable Function(E element) selector) {
    final it = iterator;
    if (!it.moveNext()) {
      return null;
    }

    var currentMin = it.current;
    var currentMinValue = selector(it.current);
    while (it.moveNext()) {
      final comp = selector(it.current);
      if (comp.compareTo(currentMinValue) == order) {
        currentMin = it.current;
        currentMinValue = comp;
      }
    }

    return currentMin;
  }

  E? _minMaxWith(int order, Comparator<E> comparator) {
    final it = iterator;
    if (!it.moveNext()) {
      return null;
    }
    var currentMin = it.current;

    while (it.moveNext()) {
      if (comparator(it.current, currentMin) == order) {
        currentMin = it.current;
      }
    }

    return currentMin;
  }
}

extension NullOrEmpty<T> on List<T>? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
